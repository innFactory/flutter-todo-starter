import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:sync/src/model/selectable.dart';
import 'package:sync/src/model/sync_entity.dart';
import 'package:sync/src/model/sync_entity_type.dart';
import 'package:sync/src/model/sync_status.dart';
import 'package:sync/src/repository/sync_capability.dart';

typedef RemoteGetAll<T extends LocalBase> = Stream<Either<Failure, List<T>>>
    Function();

typedef RemoteCreateOrUpdate<T extends LocalBase> = TaskEither<Failure, T>
    Function(T entity);

typedef RemoteDelete<T extends LocalBase> = TaskEither<Failure, dynamic>
    Function(T entity);

typedef LocalMerge<T extends LocalBase> = T Function(T local, T remote);

class CrudSyncCapability<T extends LocalBase> implements SyncCapability {
  CrudSyncCapability({
    required this.dao,
    required this.remoteGetAll,
    required this.entityType,
    this.remoteCreateOrUpdate,
    this.remoteDelete,
    this.merge,
  });

  final Dao<T> dao;
  final RemoteGetAll<T> remoteGetAll;
  final RemoteCreateOrUpdate<T>? remoteCreateOrUpdate;
  final RemoteDelete<T>? remoteDelete;
  final LocalMerge<T>? merge;
  final SyncEntityType entityType;

  @override
  TaskEither<Failure, Unit> syncEntity(SyncEntity entity) {
    final localId = entity.id;

    return dao
        .findById(localId: localId, includeSoftDeleted: true)
        .get()
        .flatMap((local) {
      if (local.localSyncStatus == SyncStatus.synced) {
        return TaskEither.right(unit);
      }

      if (entity.status == SyncStatus.deleted) {
        if (remoteDelete == null || local.remoteId == null) {
          return dao.deleteById(
            localId: localId,
            remoteId: local.remoteId,
            softDelete: false,
          );
        }

        return remoteDelete!(local).andThen(() => dao.deleteById(
              localId: localId,
              remoteId: local.remoteId,
              softDelete: false,
            ));
      }

      if (remoteCreateOrUpdate == null) {
        return dao
            .findById(
                localId: localId,
                remoteId: local.remoteId,
                includeSoftDeleted: false)
            .get()
            .flatMap(
              (r) => dao.createOrUpdate(r, syncStatus: SyncStatus.synced),
            )
            .map((r) => unit);
      }

      return remoteCreateOrUpdate!(local)
          .flatMap(
            (newLocal) => dao.createOrUpdate(
              newLocal..localId = local.localId,
              syncStatus: SyncStatus.synced,
            ),
          )
          .map((r) => unit);
    });
  }

  @override
  TaskEither<Failure, Unit> syncRemote() {
    return TaskEither(() async {
      final Set<String> ids = {};

      await for (final entities in remoteGetAll()) {
        await entities.toTaskEither().flatMap((entities) {
          if (entities.isEmpty) {
            return TaskEither.right(unit);
          }

          ids.addAll(entities.map((e) => e.remoteId).whereNotNull());

          return TaskEither.traverseList(entities.toList(), patchEntity);
        }).run();
      }

      await dao.hardDeleteNotInIds(ids).run();

      return right(unit);
    });
  }

  /// Patches an entity into the database. Checks for conflicts and elects the
  /// winning entity.
  TaskEither<Failure, Unit> patchEntity(T remote) {
    return dao
        .findById(
          localId: remote.localId,
          remoteId: remote.remoteId,
          includeSoftDeleted: true,
        )
        .get()
        // TODO: If merge results in a change from the remote we should queue the entity for sync again
        .flatMap(
          (local) => dao.createOrUpdate(
            merge?.call(local, remote) ?? remote,
            syncStatus: SyncStatus.synced,
          ),
        )
        // If the entity doesn't exist in the database, create it
        .orElse(
          (_) => dao.createOrUpdate(remote, syncStatus: SyncStatus.synced),
        )
        .map((r) => unit);
  }

  @override
  Selectable<List<SyncEntity>> findSyncEntities() {
    return dao.findAllRequiringSync().map(_toSyncEntities);
  }

  @override
  TaskEither<Failure, Unit> syncEntityFailed(SyncEntity entity) {
    return dao
        .findById(
          localId: entity.id,
          includeSoftDeleted: true,
        )
        .get()
        .flatMap(
          (local) => dao.createOrUpdate(local, syncStatus: SyncStatus.synced),
        )
        .map((r) => unit);
  }

  List<SyncEntity> _toSyncEntities(List<T> list) {
    return list.map(_toSyncEntity).whereNotNull().toList();
  }

  SyncEntity? _toSyncEntity(T entity) {
    final localId = entity.localId;
    if (localId == null) return null;
    return SyncEntity(
      id: localId,
      status: entity.localSyncStatus,
      modifiedAt: entity.localUpdatedAt,
      type: entityType,
    );
  }
}
