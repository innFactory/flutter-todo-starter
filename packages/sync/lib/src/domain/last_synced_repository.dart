import 'package:core/core.dart';
import 'package:sync/sync.dart';

abstract interface class LastSyncedRepository {
  @useResult
  TaskEither<Failure, DateTime?> getLastSyncedAtTimestamp(
    SyncIdentifier syncIdentifier,
  );

  @useResult
  TaskEither<Failure, Unit> setLastSyncedAtTimestamp(
    SyncIdentifier syncIdentifier,
  );
}
