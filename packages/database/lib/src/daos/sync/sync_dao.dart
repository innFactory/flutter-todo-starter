import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:database/src/daos/sync/sync_dao_impl.dart';
import 'package:sync/sync.dart';

abstract interface class SyncDao {
  factory SyncDao(DriftLocalDatabase db) = SyncDaoImpl;

  TaskEither<Failure, SyncEntity> createOrUpdate(SyncEntity entity);

  Stream<List<SyncEntity>> watchSyncEntities();

  Stream<List<SyncEntity>> watchSyncEntitiesWithError();

  TaskEither<Failure, List<SyncEntity>> getSyncEntities();

  TaskEither<Failure, SyncEntity> getSyncEntity(
    SyncEntityType type,
    int localId,
  );

  TaskEither<Failure, Unit> deleteSyncEntity(
    SyncEntityType type,
    int localId,
  );
}
