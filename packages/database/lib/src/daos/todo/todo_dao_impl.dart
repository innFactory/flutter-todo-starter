import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:database/src/common/utils.dart';
import 'package:database/src/tables/todo_table.dart';
import 'package:sync/sync.dart';
import 'package:todo/todo.dart';

part 'todo_dao_impl.g.dart';

@DriftAccessor()
class TodoDaoImpl extends DatabaseAccessor<DriftLocalDatabase>
    with _$TodoDaoImplMixin
    implements TodoDao {
  TodoDaoImpl(super.attachedDatabase);

  @override
  TaskEither<Failure, Todo> createOrUpdate(
    Todo todo, {
    bool addToSyncQueue = true,
  }) {
    return runTransaction(
      () => transaction(
        () async {
          final maybeOldTodo = await todo.localId?.let(
            (localId) => (select(tableInfo)
                  ..where((tbl) => tbl.localId.equals(localId.value)))
                .getSingleOrNull(),
          );

          return into(tableInfo).insertReturning(
            TodoMapper.toLocal(todo).copyWith(
              localUpdatedAt: Value(DateTime.now()),
              localSyncStatus: Value(
                todo.remoteId != null ? SyncStatus.updated : SyncStatus.created,
              ),
              localCreatedAt: maybeOldTodo?.localCreatedAt.let(Value.new) ??
                  const Value.absent(),
            ),
            mode: InsertMode.insertOrReplace,
          );
        },
      ),
    ).flatMap(
      (local) {
        if (!addToSyncQueue) {
          return TaskEither.right(local);
        }

        return _addToSyncQueue(
          local.localId,
          todo.remoteId != null ? SyncStatus.updated : SyncStatus.created,
        ).map((r) => local);
      },
    ).map(TodoMapper.fromLocal);
  }

  @override
  TaskEither<Failure, Todo> createOrUpdateFromRemote(Todo todo, int? localId) {
    return runTransaction(
      () => transaction(
        () async {
          final maybeOldTodo = await (select(tableInfo)
                ..where(
                  (tbl) => localId != null
                      ? tbl.localId.equals(localId)
                      : tbl.remoteId.equals(todo.remoteId!),
                ))
              .getSingleOrNull();

          if (maybeOldTodo != null &&
              maybeOldTodo.localUpdatedAt.isAfter(todo.updatedAt)) {
            // TODO: Merging logic
            return maybeOldTodo;
          }

          final createOrUpdateTodo = TodoMapper.toLocal(todo).copyWith(
            localId:
                maybeOldTodo?.localId.let(Value.new) ?? const Value.absent(),
            localUpdatedAt: Value(DateTime.now()),
            localSyncStatus: const Value(SyncStatus.synced),
            localCreatedAt: maybeOldTodo?.localCreatedAt.let(Value.new) ??
                const Value.absent(),
          );

          return into(tableInfo).insertReturning(
            createOrUpdateTodo,
            mode: InsertMode.insertOrReplace,
          );
        },
      ),
    ).map(TodoMapper.fromLocal);
  }

  @override
  TaskEither<Failure, List<Todo>> getTodos() {
    return runTransaction(
      () => transaction(
        () async {
          return (select(tableInfo)
                ..where(
                  (tbl) =>
                      tbl.localSyncStatus.isNotValue(SyncStatus.deleted.name),
                ))
              .get();
        },
      ),
    ).map((r) => r.map(TodoMapper.fromLocal).toList());
  }

  @override
  TaskEither<Failure, Todo> getTodoById({TodoId? localId, String? remoteId}) {
    if (localId == null && remoteId == null) {
      return tLeft(Failures.notFound);
    }

    return runTransaction(
      () => transaction(
        () async {
          return (select(tableInfo)
                ..where(
                  (tbl) => localId != null
                      ? tbl.localId.equals(localId.value)
                      : tbl.remoteId.equals(remoteId!),
                ))
              .getSingle();
        },
      ),
    ).map((a) {
      return TodoMapper.fromLocal(a);
    });
  }

  @override
  Stream<List<Todo>> watchTodos() {
    return (select(tableInfo)
          ..where(
            (tbl) => tbl.localSyncStatus.isNotValue(SyncStatus.deleted.name),
          ))
        .watch()
        .map((event) => event.map(TodoMapper.fromLocal).toList());
  }

  @override
  TaskEither<Failure, int> deleteByLocalIdHard(int localId) {
    return runTransaction(
      () => transaction(
        () => (delete(tableInfo)..where((tbl) => tbl.localId.equals(localId)))
            .go(),
      ),
    );
  }

  @override
  TaskEither<Failure, int> deleteByLocalIdSoft(int localId) {
    return getTodoById(localId: TodoId(localId)).flatMap((todo) {
      return runTransaction(
        () => transaction(
          () async {
            return into(tableInfo).insertOnConflictUpdate(
              TodoMapper.toLocal(todo).copyWith(
                localId: Value(localId),
                localSyncStatus: const Value(SyncStatus.deleted),
              ),
            );
          },
        ),
      ).flatMap(
        (id) => _addToSyncQueue(
          localId,
          SyncStatus.deleted,
        ),
      );
    });
  }

  // @override
  // TaskEither<Failure, List<int>> deleteByLocalIdsSoft(Set<int> localIds) {
  //   return runTransaction(
  //     () => transaction(
  //       () => customUpdate(
  //         'UPDATE ${tableInfo.actualTableName} SET local_sync_status = ${SyncStatus.deleted.name} WHERE local_id IN (${localIds.map((e) => '?').join(',')})',
  //         variables: localIds.map((e) => Variable.withInt(e)).toList(),
  //         updates: {tableInfo},
  //         updateKind: UpdateKind.update,
  //       ),
  //     ),
  //   ).flatMap(
  //     (r) => TaskEither.traverseList(
  //       localIds.toList(),
  //       (localId) => _addToSyncQueue(
  //         localId,
  //         SyncStatus.deleted,
  //       ),
  //     ),
  //   );
  // }

  @override
  TaskEither<Failure, int> deleteByRemoteId(String remoteId) {
    return runTransaction(
      () => transaction(
        () => (delete(tableInfo)..where((tbl) => tbl.remoteId.equals(remoteId)))
            .go(),
      ),
    );
  }

  @override
  TaskEither<Failure, int> deleteByRemoteIds(Set<String> remoteIds) {
    return runTransaction(
      () => transaction(
        () => (delete(tableInfo)
              ..where(
                (tbl) => tbl.remoteId.isIn(remoteIds),
              ))
            .go(),
      ),
    );
  }

  @override
  TaskEither<Failure, int> deleteByRemoteIdSoft(String remoteId) {
    return runTransaction(
      () => transaction(
        () => customUpdate(
          'UPDATE ${tableInfo.actualTableName} SET local_sync_status = ${SyncStatus.deleted.name} WHERE remote_id = ?',
          variables: [Variable.withString(remoteId)],
          updates: {tableInfo},
          updateKind: UpdateKind.update,
        ),
      ),
    ).flatMap(
      (r) => getTodoById(remoteId: remoteId).flatMap(
        (r) => _addToSyncQueue(
          r.localId!.value,
          SyncStatus.deleted,
        ),
      ),
    );
  }

  TableInfo<TodoTable, LocalTodo> get tableInfo => attachedDatabase.todoTable;

  TaskEither<Failure, int> _addToSyncQueue(
    int localId,
    SyncStatus syncStatus,
  ) {
    return updateSyncEntity(
      database: attachedDatabase,
      entityId: localId,
      entityType: SyncEntityType.todos,
      syncStatus: syncStatus,
    );
  }
}
