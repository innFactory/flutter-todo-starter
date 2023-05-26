import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:database/src/daos/sync/last_synced_dao_impl.dart';
import 'package:sync/sync.dart';

abstract class LastSyncedDao {
  factory LastSyncedDao(DriftLocalDatabase db) = LastSyncedDaoImpl;

  TaskEither<Failure, LastSyncedEntity> createOrUpdate(LastSyncedEntity entity);

  TaskEither<Failure, Unit> setLastSyncedTimestampForSyncEntityType(
    SyncEntityType entityType,
  );

  TaskEither<Failure, List<LastSyncedEntity>> getLastSyncedTimestamps();

  TaskEither<Failure, LastSyncedEntity> getBySyncEntityType(
    SyncEntityType syncEntityType,
  );

  TaskEither<Failure, LastSyncedEntity> getLastSyncEntityById(
    int localId,
  );

  TaskEither<Failure, Unit> deleteById(int localId);
}
