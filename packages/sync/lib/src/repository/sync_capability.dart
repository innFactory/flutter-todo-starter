import 'package:core/core.dart';
import 'package:sync/src/model/selectable.dart';
import 'package:sync/src/model/sync_entity.dart';

/// Base functionality required for a [Repository] to be able to sync data.
abstract class SyncCapability {
  /// Select all entities requiring synchronisation.
  Selectable<List<SyncEntity>> findSyncEntities();

  /// Synchronise an entity.
  TaskEither<Failure, Unit> syncEntity(SyncEntity entity);

  TaskEither<Failure, Unit> syncEntityFailed(SyncEntity entity);

  /// Synchronises all remote entities.
  TaskEither<Failure, Unit> syncRemote();
}
