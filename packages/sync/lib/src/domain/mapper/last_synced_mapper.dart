import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:sync/src/domain/models/last_synced_entity.dart';

extension LastSyncedMapper on Never {
  static LastSyncedTableCompanion toLocal(LastSyncedEntity entity) {
    return LastSyncedTableCompanion(
      localId: entity.id?.let(Value.new) ?? const Value.absent(),
      entityType: Value(entity.entityType),
      lastSyncedAt: entity.lastSyncedAt?.let(Value.new) ?? const Value.absent(),
    );
  }

  static LastSyncedEntity fromLocal(LocalLastSynced local) {
    return LastSyncedEntity(
      id: local.localId,
      entityType: local.entityType,
      lastSyncedAt: local.lastSyncedAt,
    );
  }
}
