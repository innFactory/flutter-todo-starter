import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:sync/sync.dart';

extension SyncMapper on Never {
  static SyncTableCompanion toLocal(SyncEntity entity) {
    return SyncTableCompanion(
      localId: entity.id?.let(Value.new) ?? const Value.absent(),
      entityId: Value(entity.entityLocalId),
      entityModifiedAt: Value(entity.modifiedAt),
      localSyncStatus: Value(entity.status),
      entityType: Value(entity.type),
    );
  }

  static SyncEntity fromLocal(LocalSync local) {
    return SyncEntity(
      id: local.localId,
      entityLocalId: local.entityId,
      type: local.entityType,
      status: local.localSyncStatus,
      modifiedAt: local.entityModifiedAt,
    );
  }
}
