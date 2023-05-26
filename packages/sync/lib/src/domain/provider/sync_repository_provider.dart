import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:network_info/network_info.dart';
import 'package:sync/src/domain/sync_repository.dart';
import 'package:sync/src/infrastructure/sync_repository_impl.dart';
import 'package:todo/todo.dart';

final syncRepositoryProvider = Provider.autoDispose<SyncRepository>(
  (ref) {
    final networkInfo = ref.watch(networkInfoProvider);
    final driftDatabase = ref.watch(driftDatabaseProvider);
    final todoRepository = ref.watch(todoRepositoryProvider);
    final syncDao = SyncDao(driftDatabase);
    final lastSyncedDao = LastSyncedDao(driftDatabase);

    return SyncRepositoryImpl(
      networkInfo: networkInfo,
      syncDao: syncDao,
      todoRepository: todoRepository,
      lastSyncedDao: lastSyncedDao,
    );
  },
  dependencies: [
    networkInfoProvider,
    driftDatabaseProvider,
    todoRepositoryProvider,
  ],
);
