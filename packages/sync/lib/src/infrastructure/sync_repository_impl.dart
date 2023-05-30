import 'dart:async';

import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:sync/sync.dart';

class SyncRepositoryImpl implements SyncRepository {
  SyncRepositoryImpl({
    required this.syncDao,
  });

  final SyncDao syncDao;

  @override
  Stream<List<SyncEntity>> watchSyncEntities() => syncDao.watchSyncEntities();

  @override
  TaskEither<Failure, List<SyncEntity>> getSyncEntities() {
    return syncDao.getSyncEntities();
  }

  @override
  TaskEither<Failure, Unit> deleteSyncEntity(SyncEntityId syncEntityId) {
    return syncDao.deleteById(syncEntityId);
  }
}
