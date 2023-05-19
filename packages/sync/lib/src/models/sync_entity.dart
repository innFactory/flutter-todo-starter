import '../../sync.dart';

class SyncEntity {
  SyncEntity({
    required this.id,
    required this.type,
    required this.status,
    required this.modifiedAt,
  });

  /// The local id of the entity.
  final int id;

  /// The type of entity that is represented by this sync entity.
  final SyncEntityType type;

  /// The synchronisation status of this entity.
  final SyncStatus status;

  /// When this entity was modified locally.
  final DateTime modifiedAt;
}
