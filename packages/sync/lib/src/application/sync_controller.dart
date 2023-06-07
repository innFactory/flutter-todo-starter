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
      () => syncRepository
          .getSyncEntities()
          .flatMap(
            (syncEntities) => TaskEither.sequenceList(
              syncEntities
                  .where(
                    (element) =>
                        element.revertChanges == false &&
                        element.errorCode == null,
                  )
                  .map((entity) => _syncChangesForEntityType(entity))
                  .toList(),
            ).andThen(
              () => TaskEither.sequenceList(
                syncEntities
                    .where((element) => element.revertChanges == true)
                    .map((entity) => _revertChanges(entity))
                    .toList(),
              ),
            ),
          )
          .map((r) => unit),
    );
  }

  TaskEither<Failure, Unit> _syncChangesForEntityType(SyncEntity entity) {
    switch (entity.entityType) {
      case SyncEntityType.todo:
        return todoRepository.syncToRemote(entity.entityLocalId);
    }
  }

  TaskEither<Failure, Unit> toggleRevertChange(SyncEntity entity) {
    return syncRepository
        .toggleRevertChangeForSyncEntity(entity)
        .map((_) => unit);
  }

  TaskEither<Failure, Unit> retryChange(SyncEntity entity) {
    return syncRepository.retryChangeForSyncEntity(entity).map((_) => unit);
  }

  TaskEither<Failure, Unit> _revertChanges(SyncEntity entity) {
    switch (entity.entityType) {
      case SyncEntityType.todo:
        return todoRepository.revertChanges(entity.entityLocalId);
    }
  }

  Future<void> dispose() async {
    await _syncEntitiesSubscription?.cancel();
  }
}
