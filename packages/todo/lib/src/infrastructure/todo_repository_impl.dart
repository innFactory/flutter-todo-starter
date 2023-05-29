import 'package:api/api.dart';
import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:network_info/network_info.dart';
import 'package:sync/sync.dart';
import 'package:todo/todo.dart';

class TodoRepositoryImpl implements TodoRepository {
  TodoRepositoryImpl({
    required this.networkInfo,
    required this.lastSyncedRepository,
    required this.todoApi,
    required this.todoDao,
  });

  final NetworkInfo networkInfo;
  final LastSyncedRepository lastSyncedRepository;
  final TodoApi todoApi;
  final TodoDao todoDao;

  @override
  Stream<List<Todo>> watchTodos() => todoDao.watchTodos();

  @override
  TaskEither<Failure, List<Todo>> getTodos() => todoDao.getTodos();

  @override
  TaskEither<Failure, Todo> getTodoById(
    TodoLocalId localId,
    TodoRemoteId? remoteId,
  ) {
    return todoDao.getTodoById(localId: localId, remoteId: remoteId).orElse(
      (failure) {
        if (remoteId == null) return tLeft(failure);

        return _fetchByIdFromRemote(localId, remoteId);
      },
    );
  }

  @override
  Stream<Either<Failure, Todo>> watchTodoById(
    TodoLocalId localId,
    TodoRemoteId? remoteId,
  ) {
    return todoDao.watchTodoById(localId: localId, remoteId: remoteId).orElse(
      (failure) {
        if (remoteId == null) return tLeft(failure);

        return _fetchByIdFromRemote(localId, remoteId);
      },
    );
  }

  @override
  TaskEither<Failure, Todo> createOrUpdateTodo(Todo todo) =>
      todoDao.createOrUpdate(todo);

  @override
  TaskEither<Failure, Unit> deleteTodoById(
    TodoLocalId? localId, [
    TodoRemoteId? remoteId,
  ]) {
    if (localId == null && remoteId == null) {
      return tLeft(Failures.notFound);
    }

    if (localId != null) {
      return todoDao.deleteByLocalIdSoft(localId).map((r) => unit);
    }

    return todoDao.deleteByRemoteIdSoft(remoteId!).map((r) => unit);
  }

  @override
  TaskEither<Failure, Unit> pushToRemote(
    int localId,
    SyncStatus status,
  ) {
    return networkInfo.onlineOrFailure.flatMap(
      (r) => getTodoById(TodoLocalId(localId), null).flatMap(
        (todo) {
          switch (status) {
            case SyncStatus.synced:
              return tRight(unit);

            case SyncStatus.deleted:
              if (todo.remoteId != null) {
                return todoApi
                    .deleteTodoById(todo.remoteId!)
                    .andThen(
                      () => todoDao.deleteByLocalIdHard(todo.localId!),
                    )
                    .map((r) => unit);
              } else {
                return todoDao
                    .deleteByLocalIdHard(todo.localId!)
                    .map((r) => unit);
              }

            case SyncStatus.modified:
              return _resolveParentId(todo)
                  .flatMap(
                    (resolvedTodo) => todoApi.createTodo(todo).flatMap(
                          (response) => todoDao.createOrUpdateFromRemote(
                            todo,
                            TodoLocalId(localId),
                          ),
                        ),
                  )
                  .map((r) => unit);
          }
        },
      ),
    );
  }

  @override
  TaskEither<Failure, Unit> fetchFromRemote() {
    return networkInfo.onlineOrFailure.andThen(
      () => lastSyncedRepository
          .getLastSyncedAtTimestamp(const TodoSyncIdentifier())
          .flatMap(_fetchFromRemote),
    );
  }

  TaskEither<Failure, Unit> _fetchFromRemote(DateTime? timeStamp) {
    return todoApi
        .getTodosSync(timeStamp)
        .flatMap(
          (response) => TaskEither.traverseList(
            response.todos,
            (todo) => todoDao.createOrUpdateFromRemote(todo, null),
          ).andThen(() => todoDao.deleteByRemoteIds(response.deletedTodoIds)),
        )
        .andThen(
          () => lastSyncedRepository.setLastSyncedAtTimestamp(
            const TodoSyncIdentifier(),
          ),
        )
        .map((r) => unit);
  }

  TaskEither<Failure, Todo> _resolveParentId(Todo todo) {
    if (todo.localParentId == null && todo.remoteParentId == null) {
      return tRight(todo);
    }

    return todoDao
        .getTodoById(localId: todo.localParentId, remoteId: todo.remoteParentId)
        .flatMap(
          (parent) => todoDao.createOrUpdate(
            todo.copyWith(
              localParentId: parent.localId,
              remoteParentId: parent.remoteId,
            ),
            addToSyncQueue: false,
          ),
        );
  }

  TaskEither<Failure, Todo> _fetchByIdFromRemote(
    TodoLocalId? localId,
    TodoRemoteId remoteId,
  ) {
    return networkInfo.onlineOrFailure
        .andThen(() => todoApi.getTodoById(remoteId))
        .flatMap((todo) => todoDao.createOrUpdateFromRemote(todo, localId));
  }
}
