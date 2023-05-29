import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'last_synced_entity.freezed.dart';

class LastSyncedEntityId extends ValueId<int> {
  const LastSyncedEntityId(int value) : super(value);
}

@freezed
class LastSyncedEntity with _$LastSyncedEntity {
  factory LastSyncedEntity({
    LastSyncedEntityId? localId,

    /// The Timestamp of the last sync process.
    required DateTime? lastSyncedAt,
  }) = _LastSyncedEntity;

  factory LastSyncedEntity.empty([
    DateTime? lastSyncedAt,
  ]) {
    return LastSyncedEntity(
      localId: null,
      lastSyncedAt: lastSyncedAt,
    );
  }
}
