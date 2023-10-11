import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:database/src/common/drift_failure.dart';
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
    required bool addToSyncQueue,
  }) {
    return runTransaction(
      database: attachedDatabase,
      () async {
        final maybeOldTodo = await todo.localId?.let(
          (localId) => (select(tableInfo)
                ..where((tbl) => tbl.localId.equals(localId.value)))
              .getSingleOrNull(),
        );

        return into(tableInfo).insertReturning(
          TodoMapper.toLocal(todo).copyWith(
            localUpdatedAt: Value(DateTime.now()),
            localSyncStatus: const Value(SyncStatus.modified),
            localCreatedAt: maybeOldTodo?.localCreatedAt.let(Value.new) ??
                const Value.absent(),
          ),
          mode: InsertMode.insertOrReplace,
        );
      },
    ).flatMap(
      (local) {
        if (!addToSyncQueue) {
          return TaskEither.right(local);
        }

        return _addToSyncQueue(local.localId).map((r) => local);
      },
    ).map(TodoMapper.fromLocal);
  }

  @override
  TaskEither<Failure, Todo> createOrUpdateFromRemote(
    Todo todo,
    TodoLocalId? localId,
  ) {
    return runTransaction(
      database: attachedDatabase,
      () async {
        final maybeOldTodo = await (select(tableInfo)
              ..where(
                (tbl) => localId != null
                    ? tbl.localId.equals(localId.value)
                    : tbl.remoteId.equals(todo.remoteId!.value),
              ))
            .getSingleOrNull();

        if (maybeOldTodo != null &&
            maybeOldTodo.localUpdatedAt.isAfter(todo.updatedAt)) {
          // TODO: Merging logic
          return maybeOldTodo;
        }

        final createOrUpdateTodo = TodoMapper.toLocal(todo).copyWith(
          localId: maybeOldTodo?.localId.let(Value.new) ?? const Value.absent(),
          localParentId: maybeOldTodo?.localParentId.let(Value.new) ??
              const Value.absent(),
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
    ).map(TodoMapper.fromLocal);
  }

  @override
  TaskEither<Failure, List<Todo>> getTodos() {
    return runTransaction(
      database: attachedDatabase,
      () async {
        return (select(tableInfo)
              ..where(
                (tbl) =>
                    tbl.localSyncStatus.isNotValue(SyncStatus.deleted.name),
              ))
            .get();
      },
    ).map((r) => r.map(TodoMapper.fromLocal).toList());
  }

  @override
  TaskEither<Failure, Todo> getTodoById({
    TodoLocalId? localId,
    TodoRemoteId? remoteId,
  }) {
    if (localId == null && remoteId == null) {
      return tLeft(const NotFoundFailure());
    }

    return runTransaction(
      database: attachedDatabase,
      () async {
        return (select(tableInfo)
              ..where(
                (tbl) => localId != null
                    ? tbl.localId.equals(localId.value)
                    : tbl.remoteId.equals(remoteId!.value),
              ))
            .getSingle();
      },
    ).map((a) {
      return TodoMapper.fromLocal(a);
    });
  }

  @override
  Stream<List<Todo>> watchTodos({bool includeSoftDeleted = false}) {
    try {
      if (includeSoftDeleted) {
        return select(tableInfo)
            .watch()
            .map((event) => event.map(TodoMapper.fromLocal).toList());
      }

      return (select(tableInfo)
            ..where(
              (tbl) => tbl.localSyncStatus.isNotValue(SyncStatus.deleted.name),
            ))
          .watch()
          .map((event) => event.map(TodoMapper.fromLocal).toList());
    } catch (e) {
      return Stream.value([]);
    }
  }

  @override
  TaskEither<Failure, Todo> replaceTodo(Todo todo, SyncStatus syncStatus) {
    return runTransaction(
      () async {
        final maybeOldTodo = await todo.localId?.let(
          (localId) => (select(tableInfo)
                ..where((tbl) => tbl.localId.equals(localId.value)))
              .getSingleOrNull(),
        );

        return into(tableInfo).insertReturning(
          TodoMapper.toLocal(todo).copyWith(
            localSyncStatus: Value(syncStatus),
            localCreatedAt: maybeOldTodo?.localCreatedAt.let(Value.new) ??
                const Value.absent(),
          ),
          mode: InsertMode.replace,
        );
      },
      database: attachedDatabase,
    ).map(TodoMapper.fromLocal);
  }

  @override
  TaskEither<Failure, int> deleteByLocalIdHard(TodoLocalId localId) {
    return runTransaction(
      database: attachedDatabase,
      () => (delete(tableInfo)
            ..where((tbl) => tbl.localId.equals(localId.value)))
          .go(),
    );
  }

  @override
  TaskEither<Failure, int> deleteByLocalIdSoft(TodoLocalId localId) {
    return getTodoById(localId: localId).flatMap((todo) {
      return runTransaction(
        database: attachedDatabase,
        () async {
          return into(tableInfo).insertOnConflictUpdate(
            TodoMapper.toLocal(todo).copyWith(
              localId: Value(localId.value),
              localSyncStatus: const Value(SyncStatus.deleted),
            ),
          );
        },
      ).flatMap(
        (id) => _addToSyncQueue(localId.value),
      );
    });
  }

  @override
  TaskEither<Failure, int> deleteByRemoteId(TodoRemoteId remoteId) {
    return runTransaction(
      database: attachedDatabase,
      () => (delete(tableInfo)
            ..where((tbl) => tbl.remoteId.equals(remoteId.value)))
          .go(),
    );
  }

  @override
  TaskEither<Failure, int> deleteByRemoteIdSoft(TodoRemoteId remoteId) {
    return getTodoById(remoteId: remoteId).flatMap((todo) {
      return runTransaction(
        database: attachedDatabase,
        () async {
          await into(tableInfo).insertOnConflictUpdate(
            TodoMapper.toLocal(todo).copyWith(
              localSyncStatus: const Value(SyncStatus.deleted),
            ),
          );

          return todo.localId;
        },
      ).flatMap(
        (id) => _addToSyncQueue(id!.value),
      );
    });
  }

  @override
  TaskEither<Failure, int> deleteByRemoteIds(List<TodoRemoteId> remoteIds) {
    return runTransaction(
      database: attachedDatabase,
      () => (delete(tableInfo)
            ..where(
              (tbl) => tbl.remoteId.isIn(remoteIds.map((e) => e.value)),
            ))
          .go(),
    );
  }

  @override
  Stream<Either<Failure, Todo>> watchTodoById({
    TodoLocalId? localId,
    TodoRemoteId? remoteId,
  }) {
    if (localId == null && remoteId == null) {
      return Stream.value(left(const NotFoundFailure()));
    }

    try {
      return (select(tableInfo)
            ..where(
              (tbl) => localId != null
                  ? tbl.localId.equals(localId.value)
                  : tbl.remoteId.equals(remoteId!.value),
            ))
          .watchSingleOrNull()
          .map(
            (event) => Either.fromNullable(
              event,
              NotFoundFailure.new,
            ).map(TodoMapper.fromLocal),
          );
    } catch (e) {
      return Stream.value(left(DriftFailure(e)));
    }
  }

  TaskEither<Failure, int> _addToSyncQueue(int localId) {
    return updateSyncEntity(
      database: attachedDatabase,
      entityId: localId,
      entityType: SyncEntityType.todo,
    );
  }

  TableInfo<TodoTable, LocalTodo> get tableInfo => attachedDatabase.todoTable;
}
