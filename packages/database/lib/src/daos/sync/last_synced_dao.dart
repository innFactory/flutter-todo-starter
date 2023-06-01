import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:database/src/daos/sync/last_synced_dao_impl.dart';
import 'package:sync/sync.dart';

abstract interface class LastSyncedDao {
  factory LastSyncedDao(DriftLocalDatabase db) = LastSyncedDaoImpl;

  TaskEither<Failure, Unit> setLastSyncedTimestamp(
    SyncIdentifier identifier,
  );

  TaskEither<Failure, List<LastSyncedEntity>> getLastSyncedTimestamps();

  TaskEither<Failure, LastSyncedEntity> getBySyncIdentifier(
    SyncIdentifier identifier,
  );
}
