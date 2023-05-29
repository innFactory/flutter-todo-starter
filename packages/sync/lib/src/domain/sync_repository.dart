import 'package:core/core.dart';
import 'package:sync/sync.dart';

abstract class SyncRepository {
  /// Synchronises all entities of the given types. If no types are given, all
  /// entities are synchronised.
  // @useResult
  // TaskEither<Failure, Unit> syncAll();

  /// Watch all entities requiring synchronisation.
  Stream<List<SyncEntity>> watchSyncEntities();

  /// Get all entities requiring synchronisation.
  TaskEither<Failure, List<SyncEntity>> getSyncEntities();

  @useResult
  TaskEither<Failure, Unit> deleteSyncEntity(int syncEntityId);
}
