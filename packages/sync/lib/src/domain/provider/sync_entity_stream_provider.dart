import 'package:core/core.dart';
import 'package:sync/sync.dart';

final syncEntityStreamProvider = StreamProvider.autoDispose<List<SyncEntity>>(
  (ref) {
    final syncRepository = ref.watch(syncRepositoryProvider);

    return syncRepository.watchSyncEntities();
  },
);
