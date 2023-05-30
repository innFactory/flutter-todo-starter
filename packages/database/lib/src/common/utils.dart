import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:database/src/common/drift_failure.dart';
import 'package:sync/sync.dart';

TaskEither<Failure, TR> runTransaction<TR>(Future<TR> Function() transaction) {
  return TaskEither.tryCatch(
    () => transaction(),
    (error, stackTrace) => DriftFailure(
      error: error,
      stackTrace: stackTrace,
    ),
  );
}

TaskEither<Failure, int> updateSyncEntity({
  required DriftLocalDatabase database,
  required int entityId,
  required SyncEntityType entityType,
}) {
  return runTransaction(
    () async {
      final oldSyncEntity = await (database.select(database.syncTable)
            ..where((tbl) {
              return tbl.entityId.equals(entityId) &
                  tbl.entityType.equals(entityType.name);
            }))
          .getSingleOrNull();

      final newSyncEntity = oldSyncEntity?.copyWith(
            entityModifiedAt: DateTime.now(),
          ) ??
          SyncTableCompanion(
            entityId: Value(entityId),
            entityType: Value(entityType),
            entityModifiedAt: Value(DateTime.now()),
          );

      final inserted = await database
          .into(database.syncTable)
          .insertOnConflictUpdate(newSyncEntity);

      return inserted;
    },
  );
}
