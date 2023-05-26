import '../../../sync.dart';

class SyncEntity {
  SyncEntity({
    required this.id,
    required this.entityLocalId,
    required this.type,
    required this.status,
    required this.modifiedAt,
  });

  final int? id;

  /// The local id of the entity.
  final int entityLocalId;

  /// The type of entity that is represented by this sync entity.
  final SyncEntityType type;

  /// The synchronisation status of this entity.
  final SyncStatus status;

  /// When this entity was modified locally.
  final DateTime modifiedAt;
}
