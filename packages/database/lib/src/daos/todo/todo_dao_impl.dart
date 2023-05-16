import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:database/src/common/utils.dart';
import 'package:sync/sync.dart';
import 'package:todo/todo.dart';

part 'todo_dao_impl.g.dart';

@DriftAccessor()
class TodoDaoImpl extends DatabaseAccessor<DriftLocalDatabase>
    with _$TodoDaoImplMixin
    implements TodoDao {
  TodoDaoImpl(super.attachedDatabase);

  @override
  TaskEither<Failure, int> createOrUpdate({
    required LocalTodo todo,
  }) {
    return runTransaction(
      () => transaction(
        () async {
          final todoLocalId = await into(tableInfo).insertOnConflictUpdate(
            todo.copyWith(localUpdatedAt: DateTime.now()),
          );

          return todoLocalId;
        },
      ),
    );
  }

  @override
  TaskEither<Failure, Unit> deleteById(TodoId todoId) {
    return runTransaction(
      () => transaction(
        () async {
          await (delete(tableInfo)
                ..where((t) => t.localId.isValue(todoId.value)))
              .go();

          return unit;
        },
      ),
    );
  }

  TaskEither<Failure, int> deleteByLocalId(int localId) {
    return runTransaction(
      () =>
          (delete(tableInfo)..where((tbl) => tbl.localId.equals(localId))).go(),
    );
  }

  TaskEither<Failure, int> deleteByLocalIdSoft(int localId) {
    return runTransaction(
      () => transaction(
        () => customUpdate(
          'UPDATE ${tableInfo.actualTableName} SET local_sync_status = ${SyncStatus.deleted.name} WHERE local_id = ?',
          variables: [Variable.withInt(localId)],
          updates: {tableInfo},
          updateKind: UpdateKind.update,
        ),
      ),
    );
  }

  TaskEither<Failure, int> deleteByLocalIdsSoft(Set<int> localIds) {
    return runTransaction(
      () => transaction(
        () => customUpdate(
          'UPDATE ${tableInfo.actualTableName} SET local_sync_status = ${SyncStatus.deleted.name} WHERE local_id IN (${localIds.map((e) => '?').join(',')})',
          variables: localIds.map((e) => Variable.withInt(e)).toList(),
          updates: {tableInfo},
          updateKind: UpdateKind.update,
        ),
      ),
    );
  }

  TaskEither<Failure, int> deleteByRemoteId(String remoteId) {
    return runTransaction(
      () => transaction(
        () => (delete(tableInfo)..where((tbl) => tbl.remoteId.equals(remoteId)))
            .go(),
      ),
    );
  }

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
    );
  }

  TaskEither<Failure, int> deleteByRemoteIdsSoft(Set<String> remoteIds) {
    return runTransaction(
      () => transaction(
        () => customUpdate(
          'UPDATE ${tableInfo.actualTableName} SET local_sync_status = ${SyncStatus.deleted.name} WHERE remote_id IN (${remoteIds.map((e) => '?').join(',')})',
          variables: remoteIds.map((e) => Variable.withString(e)).toList(),
          updates: {tableInfo},
          updateKind: UpdateKind.update,
        ),
      ),
    );
  }

  TableInfo<TodoTable, LocalTodo> get tableInfo => attachedDatabase.todoTable;
}
