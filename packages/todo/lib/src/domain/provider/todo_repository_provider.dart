import 'package:api/api.dart';
import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:network_info/network_info.dart';
import 'package:sync/sync.dart';
import 'package:todo/src/domain/todo_repository.dart';
import 'package:todo/src/infrastructure/todo_repository_impl.dart';

final todoRepositoryProvider = Provider.autoDispose<TodoRepository>(
  (ref) {
    final networkInfo = ref.watch(networkInfoProvider);
    final todoApi = ref.watch(todoApiProvider);
    final driftDatabase = ref.watch(driftDatabaseProvider);
    final todoDao = TodoDao(driftDatabase);
    final lastSyncedRepository = ref.watch(lastSyncedRepositoryProvider);
    final syncRepository = ref.watch(syncRepositoryProvider);

    return TodoRepositoryImpl(
      networkInfo: networkInfo,
      lastSyncedRepository: lastSyncedRepository,
      syncRepository: syncRepository,
      todoApi: todoApi,
      todoDao: todoDao,
    );
  },
);
