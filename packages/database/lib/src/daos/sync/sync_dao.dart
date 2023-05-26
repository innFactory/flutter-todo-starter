import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:database/src/daos/sync/sync_dao_impl.dart';
import 'package:sync/sync.dart';

abstract class SyncDao {
  factory SyncDao(DriftLocalDatabase db) = SyncDaoImpl;

  TaskEither<Failure, SyncEntity> createOrUpdate(SyncEntity entity);

  Stream<List<SyncEntity>> watchSyncEntities();

  TaskEither<Failure, List<SyncEntity>> getSyncEntities([
    List<SyncEntityType> types = const [],
  ]);

  TaskEither<Failure, SyncEntity> getSyncEntityById(int localId);

  TaskEither<Failure, Unit> deleteById(int localId);

  TaskEither<Failure, int> deleteByEntityId(int entityId);
}
