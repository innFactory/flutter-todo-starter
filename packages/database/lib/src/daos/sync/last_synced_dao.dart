import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:database/src/daos/sync/last_synced_dao_impl.dart';
import 'package:sync/sync.dart';

abstract class LastSyncedDao {
  factory LastSyncedDao(DriftLocalDatabase db) = LastSyncedDaoImpl;

  TaskEither<Failure, LocalLastSynced> createOrUpdate(
      LastSyncedTableCompanion entity);

  TaskEither<Failure, List<LocalLastSynced>> getLastSyncedTimestamps();

  TaskEither<Failure, LocalLastSynced> getBySyncStatus(SyncStatus status);

  TaskEither<Failure, Unit> deleteById(int localId);
}
