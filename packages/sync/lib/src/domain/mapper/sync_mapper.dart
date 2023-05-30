import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:sync/sync.dart';

extension SyncMapper on Never {
  static SyncTableCompanion toLocal(SyncEntity entity) {
    return SyncTableCompanion(
      localId: entity.id?.value.let(Value.new) ?? const Value.absent(),
      entityId: Value(entity.entityLocalId),
      entityModifiedAt: Value(entity.modifiedAt),
      entityType: Value(entity.syncEntityType),
    );
  }

  static SyncEntity fromLocal(LocalSync local) {
    return SyncEntity(
      id: SyncEntityId(local.localId),
      entityLocalId: local.entityId,
      syncEntityType: local.entityType,
      modifiedAt: local.entityModifiedAt,
    );
  }
}
