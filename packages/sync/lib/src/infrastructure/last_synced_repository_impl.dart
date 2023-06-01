import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:sync/src/domain/last_synced_repository.dart';
import 'package:sync/src/domain/models/last_synced_entity.dart';
import 'package:sync/src/domain/models/sync_identifier.dart';

class LastSyncedRepositoryImpl implements LastSyncedRepository {
  LastSyncedRepositoryImpl({
    required this.lastSyncedDao,
  });

  final LastSyncedDao lastSyncedDao;

  @override
  TaskEither<Failure, DateTime?> getLastSyncedAtTimestamp(
    SyncIdentifier syncIdentifier,
  ) {
    return lastSyncedDao
        .getBySyncIdentifier(syncIdentifier)
        .orElse<Failure>((l) => tRight(LastSyncedEntity.empty()))
        .map((r) => r.lastSyncedAt);
  }

  @override
  TaskEither<Failure, Unit> setLastSyncedAtTimestamp(
    SyncIdentifier syncIdentifier,
  ) {
    return lastSyncedDao.setLastSyncedTimestamp(syncIdentifier);
  }
}
