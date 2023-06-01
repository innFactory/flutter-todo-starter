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

  @override
  TaskEither<Failure, List<SyncEntity>> getSyncEntities() {
    return syncDao.getSyncEntities();
  }

  @override
  TaskEither<Failure, Unit> modifySyncEntity(
    SyncEntityType type,
    int localId,
    TaskEither<Failure, Unit> Function(SyncEntity syncEntity) process,
  ) {
    final lock = _locks[Object.hash(type, localId)] ??= FunctionalLock();

    return lock.synchronized(
      () => syncDao
          .getSyncEntity(type, localId)
          .flatMap(process)
          .andThen(() => syncDao.deleteSyncEntity(type, localId)),
    );
  }
}
