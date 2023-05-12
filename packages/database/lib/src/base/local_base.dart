import 'package:database/src/isar/isar.dart';
import 'package:sync/sync.dart';

abstract class LocalBase {
  LocalBase({
    this.localId,
    this.remoteId,
    DateTime? localCreatedAt,
    DateTime? localUpdatedAt,
    SyncStatus? localSyncStatus,
  })  : localSyncStatus = localSyncStatus ?? SyncStatus.synced,
        localCreatedAt = localCreatedAt ?? DateTime.now(),
        localUpdatedAt = localUpdatedAt ?? DateTime.now();

  Id? localId;

  @Index()
  String? remoteId;

  @Index()
  @isarEnum
  late SyncStatus localSyncStatus;

  late DateTime localCreatedAt;
  late DateTime localUpdatedAt;
}
