import 'package:core/core.dart';
import 'package:sync/sync.dart';

abstract class Dao<T> {
  /// Creates or updated the given entity in the database. If the entity has an
  /// id, it will be updated, otherwise it will be created.
  ///
  /// Returns the created or updated entity.
  TaskEither<Failure, T> createOrUpdate(
    T entity, {
    SyncStatus? syncStatus,
  });

  /// Creates or updates the given entities in the database. If an entity has an
  /// id, it will be updated, otherwise it will be created.
  ///
  /// Returns the number of created or updated entities.
  TaskEither<Failure, int> createOrUpdateAll(
    Iterable<T> entities, {
    SyncStatus? syncStatus,
  });

  /// Deletes the entity with the given id from the database.
  TaskEither<Failure, Unit> deleteById({
    int? localId,
    String? remoteId,
    required bool softDelete,
  });

  /// Deletes all entities with the given ids from the database.
  ///
  /// Returns the number of deleted entities.
  TaskEither<Failure, int> deleteByIds({
    required Iterable<String> remoteIds,
    required Iterable<int> localIds,
    required bool softDelete,
  });

  TaskEither<Failure, Unit> hardDeleteNotInIds(
    Set<String> ids,
  );

  /// Returns the entity with the given id from the database.
  Selectable<T> findById({
    required bool includeSoftDeleted,
    int? localId,
    String? remoteId,
  });

  /// Returns all entities from the database.
  Selectable<List<T>> findAll({
    required bool includeSoftDeleted,
    List<int>? localIds,
    List<String>? remoteIds,
  });

  Selectable<List<T>> findAllRequiringSync();

  /// Replace all entities in the database with the given entities. This will
  /// delete all entities that are not in the given list.
  TaskEither<Failure, Unit> replaceAll(Iterable<T> entities);
}
