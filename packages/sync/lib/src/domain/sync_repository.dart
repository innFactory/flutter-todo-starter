import 'package:core/core.dart';
import 'package:sync/sync.dart';

abstract interface class SyncRepository {
  /// Watch all entities requiring synchronisation.
  Stream<List<SyncEntity>> watchSyncEntities();

  /// Get all entities requiring synchronisation.
  @useResult
  TaskEither<Failure, List<SyncEntity>> getSyncEntities();

  @useResult
  TaskEither<Failure, Unit> modifySyncEntity(
    SyncEntityType type,
    int localId,
    TaskEither<Failure, Unit> Function(SyncEntity entity) process,
  );
}