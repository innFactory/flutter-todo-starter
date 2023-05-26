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
  required SyncStatus syncStatus,
}) {
  return runTransaction(
    () async {
      final inserted = await database.into(database.syncTable).insert(
            SyncTableCompanion(
              entityId: Value(entityId),
              localSyncStatus: Value(syncStatus),
              entityType: Value(entityType),
            ),
          );

      return inserted;
    },
  );
}
