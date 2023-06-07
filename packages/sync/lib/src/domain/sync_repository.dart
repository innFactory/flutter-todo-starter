import 'package:core/core.dart';
import 'package:sync/sync.dart';

abstract interface class SyncRepository {
  /// Watch all entities requiring synchronisation.
  Stream<List<SyncEntity>> watchSyncEntities();

  /// Watch all entities requiring synchronisation with an error.
  Stream<List<SyncEntity>> watchSyncEntitiesWithError();

  /// Get all entities requiring synchronisation.
  @useResult
  TaskEither<Failure, List<SyncEntity>> getSyncEntities();

  @useResult
  TaskEither<Failure, Unit> modifySyncEntity(
    SyncEntityType type,
    int localId,
    TaskEither<Failure, Unit> Function(SyncEntity entity) process,
  );

  @useResult
  TaskEither<Failure, Unit> toggleRevertChangeForSyncEntity(SyncEntity entity);

  @useResult
  TaskEither<Failure, Unit> retryChangeForSyncEntity(SyncEntity entity);
}
