import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:sync/src/domain/sync_repository.dart';
import 'package:sync/src/infrastructure/sync_repository_impl.dart';

final syncRepositoryProvider = Provider.autoDispose<SyncRepository>(
  (ref) {
    final driftDatabase = ref.watch(driftDatabaseProvider);
    final syncDao = SyncDao(driftDatabase);

    return SyncRepositoryImpl(
      syncDao: syncDao,
    );
  },
  dependencies: [
    driftDatabaseProvider,
  ],
);
