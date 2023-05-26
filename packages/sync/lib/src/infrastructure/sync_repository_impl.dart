import 'dart:async';

import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:network_info/network_info.dart';
import 'package:sync/src/domain/models/functional_lock.dart';
import 'package:sync/sync.dart';
import 'package:todo/todo.dart';

class SyncRepositoryImpl implements SyncRepository {
  SyncRepositoryImpl({
    required this.networkInfo,
    required this.todoRepository,
    required this.syncDao,
    required this.lastSyncedDao,
  }) {
    _syncEntitiesSubscription = watchSyncEntities().listen(
      (event) {
        _pushChangesToRemote().run();
      },
    );
  }

  final NetworkInfo networkInfo;
  final TodoRepository todoRepository;
  final SyncDao syncDao;
  final LastSyncedDao lastSyncedDao;
  StreamSubscription<List<SyncEntity>>? _syncEntitiesSubscription;
  final _lock = FunctionalLock(reentrant: true);

  @override
  TaskEither<Failure, Unit> syncAll([
    List<SyncEntityType> types = SyncEntityType.values,
  ]) {
    return networkInfo.onlineOrFailure
        .andThen(() => _fetchChangesFromRemote(types))
        .andThen(() => _pushChangesToRemote());
  }

  TaskEither<Failure, Unit> _pushChangesToRemote() {
    return _lock.synchronized(
      () => networkInfo.onlineOrFailure
          .andThen(syncDao.getSyncEntities)
          .flatMap(
            (r) => TaskEither.traverseListSeq(
              r.sortWithDate((instance) => instance.modifiedAt).toList(),
              (syncEntity) => _pushChangeToRemote(syncEntity),
            ),
          )
          .map((r) => unit),
    );
  }

  TaskEither<Failure, Unit> _pushChangeToRemote(SyncEntity syncEntity) {
    return _pushChangeToRemoteAction(syncEntity).flatMap(
      (r) => syncDao.deleteById(syncEntity.id!).map((r) => unit),
    );
  }

  TaskEither<Failure, Unit> _pushChangeToRemoteAction(SyncEntity syncEntity) {
    switch (syncEntity.type) {
      // insert remote sync actions here
      case SyncEntityType.todos:
        return todoRepository.pushToRemote(
          syncEntity.entityLocalId,
          syncEntity.status,
        );
    }
  }

  TaskEither<Failure, Unit> _fetchChangesFromRemote([
    List<SyncEntityType> types = SyncEntityType.values,
  ]) {
    return networkInfo.onlineOrFailure.flatMap(
      (r) => TaskEither.traverseList(
        types,
        (type) => _getLastSyncedEntity(type).flatMap(
          (lastSyncedEntity) => _fetchChangesFromRemoteAction(
            type,
            lastSyncedEntity.lastSyncedAt,
          ).flatMap((r) => _updateLastSyncedTimestamp(type)),
        ),
      ).map((r) => unit),
    );
  }

  TaskEither<Failure, Unit> _updateLastSyncedTimestamp(
    SyncEntityType entityType,
  ) {
    return lastSyncedDao.setLastSyncedTimestampForSyncEntityType(entityType);
  }

  TaskEither<Failure, LastSyncedEntity> _getLastSyncedEntity(
    SyncEntityType type,
  ) {
    return lastSyncedDao.getBySyncEntityType(type).orElse(
          (l) => tRight(LastSyncedEntity.empty(type)),
        );
  }

  TaskEither<Failure, Unit> _fetchChangesFromRemoteAction(
    SyncEntityType type,
    DateTime? lastSyncedAt,
  ) {
    switch (type) {
      // insert remote get actions here
      case SyncEntityType.todos:
        return todoRepository.fetchFromRemote(lastSyncedAt);
    }
  }

  @override
  Stream<List<SyncEntity>> watchSyncEntities() {
    return syncDao.watchSyncEntities();
  }

  Future<void> dispose() async {
    await _syncEntitiesSubscription?.cancel();
  }
}
