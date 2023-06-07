import 'package:freezed_annotation/freezed_annotation.dart';

import 'sync_entity_type.dart';

part 'sync_entity.freezed.dart';

@freezed
class SyncEntity with _$SyncEntity {
  factory SyncEntity({
    /// The local id of the entity.
    required int entityLocalId,

    /// The type of entity that is represented by this sync entity.
    required SyncEntityType entityType,

    /// When this entity was modified locally.
    required DateTime modifiedAt,

    /// The error code that represents the failure of a failed sync attempt.
    required String? errorCode,

    /// Whether the changes that were made to the entity should be reverted.
    required bool revertChanges,
  }) = _SyncEntity;
}
