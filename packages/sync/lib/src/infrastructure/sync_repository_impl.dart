import 'dart:async';

import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:sync/src/domain/models/functional_lock.dart';
import 'package:sync/sync.dart';

class SyncRepositoryImpl implements SyncRepository {
  SyncRepositoryImpl({
    required this.syncDao,
  });

  final SyncDao syncDao;
  Map<int, FunctionalLock> _locks = {};

  @override
  Stream<List<SyncEntity>> watchSyncEntities() => syncDao.watchSyncEntities();

  Stream<List<SyncEntity>> watchSyncEntitiesWithError() {
    return syncDao.watchSyncEntitiesWithError();
  }

  @override
  TaskEither<Failure, List<SyncEntity>> getSyncEntities() {
    return syncDao.getSyncEntities();
  }

  @override
  TaskEither<Failure, Unit> toggleRevertChangeForSyncEntity(
    SyncEntity entity,
  ) {
    return syncDao
        .createOrUpdate(entity.copyWith(revertChanges: !entity.revertChanges))
        .map((r) => unit);
  }

  @override
  TaskEither<Failure, Unit> retryChangeForSyncEntity(
    SyncEntity entity,
  ) {
    return syncDao
        .createOrUpdate(entity.copyWith(errorCode: null))
        .map((r) => unit);
  }

  @override
  TaskEither<Failure, Unit> modifySyncEntity(
    SyncEntityType type,
    int localId,
    TaskEither<Failure, Unit> Function(SyncEntity syncEntity) process,
  ) {
    final lock = _locks[Object.hash(type, localId)] ??= FunctionalLock();

    return lock.synchronized(
      () => syncDao.getSyncEntity(type, localId).flatMap((entity) {
        return TaskEither(() async {
          final result = await process(entity).run();
          final errorCode = result.getLeft().toNullable()?.key;

          if (errorCode != null && errorCode != OfflineFailure().key) {
            await syncDao
                .createOrUpdate(
                  entity.copyWith(errorCode: errorCode, revertChanges: false),
                )
                .run();
          }

          return result;
        });
      }).andThen(() => syncDao.deleteSyncEntity(type, localId)),
    );
  }
}
