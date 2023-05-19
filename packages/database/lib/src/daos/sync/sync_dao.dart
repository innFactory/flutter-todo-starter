import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:database/src/daos/sync/sync_dao_impl.dart';

abstract class SyncDao {
  factory SyncDao(DriftLocalDatabase db) = SyncDaoImpl;

  TaskEither<Failure, LocalSync> createOrUpdate(SyncTableCompanion entity);

  TaskEither<Failure, List<LocalSync>> getSyncEntities();

  TaskEither<Failure, Unit> deleteById(int localId);

  TaskEither<Failure, int> deleteByEntityId(int entityId);
}
