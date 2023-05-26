import 'package:core/core.dart';
import 'package:sync/src/domain/models/sync_entity.dart';
import 'package:sync/src/domain/models/sync_entity_type.dart';

abstract class SyncRepository {
  /// Synchronises all entities of the given types. If no types are given, all
  /// entities are synchronised.
  @useResult
  TaskEither<Failure, Unit> syncAll([
    List<SyncEntityType> types = SyncEntityType.values,
  ]);

  /// Watch all entities requiring synchronisation.
  Stream<List<SyncEntity>> watchSyncEntities();
}
