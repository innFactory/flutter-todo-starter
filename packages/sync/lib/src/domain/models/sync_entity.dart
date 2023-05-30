import 'package:core/core.dart';

import 'sync_entity_type.dart';

class SyncEntityId extends ValueId<int> {
  const SyncEntityId(int value) : super(value);
}

class SyncEntity {
  SyncEntity({
    required this.id,
    required this.entityLocalId,
    required this.syncEntityType,
    required this.modifiedAt,
  });

  final SyncEntityId? id;

  /// The local id of the entity.
  final int entityLocalId;

  /// The type of entity that is represented by this sync entity.
  final SyncEntityType syncEntityType;

  /// When this entity was modified locally.
  final DateTime modifiedAt;
}
