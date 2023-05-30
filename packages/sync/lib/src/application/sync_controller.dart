import 'dart:async';

import 'package:core/core.dart';
import 'package:sync/src/domain/models/functional_lock.dart';
import 'package:sync/sync.dart';
import 'package:todo/todo.dart';

final syncControllerProvider = Provider.autoDispose<SyncController>(
  (ref) {
    final syncRepository = ref.watch(syncRepositoryProvider);
    final todoRepository = ref.watch(todoRepositoryProvider);

    return SyncController(
      syncRepository: syncRepository,
      todoRepository: todoRepository,
    );
  },
  dependencies: [
    syncRepositoryProvider,
    todoRepositoryProvider,
  ],
);

class SyncController {
  SyncController({
    required this.syncRepository,
    required this.todoRepository,
  }) {
    _syncEntitiesSubscription =
        syncRepository.watchSyncEntities().listen((syncEntities) {
      pushChangesToRemote().run();
    });
  }

  final SyncRepository syncRepository;
  final TodoRepository todoRepository;
  StreamSubscription<List<SyncEntity>>? _syncEntitiesSubscription;
  final _lock = FunctionalLock(reentrant: true);

  TaskEither<Failure, Unit> pushChangesToRemote() {
    return _lock.synchronized(
      () => syncRepository.getSyncEntities().flatMap(
            (syncEntities) => TaskEither.sequenceList<Failure, Unit>(
              syncEntities
                  .map(
                    (entity) => _syncChangesForEntityType(entity).andThen(
                      () => syncRepository.deleteSyncEntity(entity.id!),
                    ),
                  )
                  .toList(),
            ).map((r) => unit),
          ),
    );
  }

  TaskEither<Failure, Unit> _syncChangesForEntityType(SyncEntity entity) {
    switch (entity.syncEntityType) {
      case SyncEntityType.todo:
        return todoRepository.syncToRemote(entity.entityLocalId);
    }
  }

  Future<void> dispose() async {
    await _syncEntitiesSubscription?.cancel();
  }
}
