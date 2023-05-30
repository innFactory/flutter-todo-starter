import 'sync_entity_type.dart';

class SyncEntity {
  SyncEntity({
    required this.entityLocalId,
    required this.entityType,
    required this.modifiedAt,
  });

  /// The local id of the entity.
  final int entityLocalId;

  /// The type of entity that is represented by this sync entity.
  final SyncEntityType entityType;

  /// When this entity was modified locally.
  final DateTime modifiedAt;
}
