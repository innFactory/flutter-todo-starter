import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:sync/src/domain/last_synced_repository.dart';
import 'package:sync/src/infrastructure/last_synced_repository_impl.dart';

final lastSyncedRepositoryProvider = Provider.autoDispose<LastSyncedRepository>(
  (ref) {
    final driftDatabase = ref.watch(driftDatabaseProvider);
    final lastSyncedDao = LastSyncedDao(driftDatabase);

    return LastSyncedRepositoryImpl(
      lastSyncedDao: lastSyncedDao,
    );
  },
  dependencies: [
    driftDatabaseProvider,
  ],
);
