import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../sync.dart';

part 'last_synced_entity.freezed.dart';

@freezed
class LastSyncedEntity with _$LastSyncedEntity {
  factory LastSyncedEntity({
    required int? id,

    /// The type of entity that is represented by this last synced entity.
    required SyncEntityType entityType,

    /// The Timestamp of the last sync process.
    required DateTime? lastSyncedAt,
  }) = _LastSyncedEntity;

  factory LastSyncedEntity.empty(SyncEntityType entityType,
      [DateTime? lastSyncedAt]) {
    return LastSyncedEntity(
      id: null,
      entityType: entityType,
      lastSyncedAt: lastSyncedAt,
    );
  }
}
