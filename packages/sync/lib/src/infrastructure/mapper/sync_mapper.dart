import 'package:database/database.dart';
import 'package:sync/sync.dart';

extension SyncMapper on Never {
  static SyncTableCompanion toLocal(SyncEntity entity) {
    return SyncTableCompanion(
      entityId: Value(entity.entityLocalId),
      entityModifiedAt: Value(entity.modifiedAt),
      entityType: Value(entity.entityType),
      revertChanges: Value(entity.revertChanges),
      errorCode: Value(entity.errorCode),
    );
  }

  static SyncEntity fromLocal(LocalSync local) {
    return SyncEntity(
      entityLocalId: local.entityId,
      entityType: local.entityType,
      modifiedAt: local.entityModifiedAt,
      revertChanges: local.revertChanges,
      errorCode: local.errorCode,
    );
  }
}
