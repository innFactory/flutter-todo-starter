import 'package:api/api.dart';
import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:network_info/network_info.dart';
import 'package:sync/sync.dart';
import 'package:todo/todo.dart';

class TodoRepositoryImpl implements TodoRepository {
  TodoRepositoryImpl({
    required this.networkInfo,
    required this.todoApi,
    required this.todoDao,
  });

  final NetworkInfo networkInfo;
  final TodoApiControllerApi todoApi;
  final TodoDao todoDao;

  @override
  TaskEither<Failure, Todo> createOrUpdateTodo(Todo todo) {
    return todoDao.createOrUpdate(todo);
  }

  @override
  TaskEither<Failure, Unit> deleteTodoById(
    TodoId? localId, [
    String? remoteId,
  ]) {
    if (localId == null && remoteId == null) {
      return tLeft(Failures.notFound);
    }

    if (localId != null) {
      return todoDao.deleteByLocalIdSoft(localId.value).map((r) => unit);
    }

    return todoDao.deleteByRemoteIdSoft(remoteId!).map((r) => unit);
  }

  @override
  TaskEither<Failure, Todo> getTodoById(TodoId? localId, [String? remoteId]) {
    return TaskEither(() async {
      final todo =
          await todoDao.getTodoById(localId: localId, remoteId: remoteId).run();

      if (todo.isLeft() && remoteId != null) {
        return _fetchByIdFromRemote(remoteId, localId).run();
      }

      return todo;
    });
  }

  @override
  Stream<List<Todo>> watchTodos() async* {
    yield* todoDao.watchTodos();
  }

  @override
  TaskEither<Failure, List<Todo>> getTodos() {
    return todoDao.getTodos();
  }

  @override
  TaskEither<Failure, Unit> pushToRemote(
    int localId,
    SyncStatus status,
  ) {
    return networkInfo.onlineOrFailure.flatMap(
      (r) => getTodoById(TodoId(localId)).flatMap(
        (todo) {
          switch (status) {
            case SyncStatus.synced:
              return tRight(unit);

            case SyncStatus.deleted:
              if (todo.remoteId != null) {
                return todoApi
                    .deleteTodoById(todoId: todo.remoteId!)
                    .toTaskEither()
                    .mapResponse()
                    .flatMap(
                      (r) => todoDao.deleteByLocalIdHard(todo.localId!.value),
                    )
                    .map((r) => unit);
              } else {
                return todoDao
                    .deleteByLocalIdHard(todo.localId!.value)
                    .map((r) => unit);
              }

            case SyncStatus.created:
              return _resolveParentId(todo)
                  .flatMap(
                    (resolvedTodo) => todoApi
                        .createTodo(todoCreation: TodoMapper.toDtoCreate(todo))
                        .toTaskEither()
                        .mapResponse()
                        .flatMap(
                          (response) => todoDao.createOrUpdateFromRemote(
                            TodoMapper.fromCreateTodoResponseContent(
                              response,
                              todo,
                            ),
                            localId,
                          ),
                        ),
                  )
                  .map((r) => unit);

            case SyncStatus.updated:
              return _resolveParentId(todo)
                  .flatMap(
                    (resolvedTodo) => todoApi
                        .updateTodo(
                          todoUpdate: TodoMapper.toDtoUpdate(todo),
                          todoId: todo.remoteId!,
                        )
                        .toTaskEither()
                        .mapResponse()
                        .flatMap(
                          (r) => todoDao.createOrUpdateFromRemote(
                            TodoMapper.fromUpdateTodoResponseContent(r)
                                .copyWith(
                              localId: resolvedTodo.localId,
                              localParentId: resolvedTodo.localParentId,
                            ),
                            localId,
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
  TaskEither<Failure, Unit> fetchFromRemote(DateTime? lastSyncedAt) {
    return networkInfo.onlineOrFailure
        .flatMap(
          (r) => todoApi
              .getTodosSync(timestamp: lastSyncedAt?.toIso8601String())
              .toTaskEither()
              .mapResponse()
              .flatMap(
                (response) => TaskEither.traverseList(
                  response.entities,
                  (todo) => todoDao.createOrUpdateFromRemote(
                    TodoMapper.fromRemote(todo),
                    null,
                  ),
                ).flatMap((r) {
                  return todoDao.deleteByRemoteIds(
                    response.deleted.toSet(),
                  );
                }),
              ),
        )
        .map((r) => unit);
  }

  TaskEither<Failure, Todo> _resolveParentId(Todo todo) {
    if (todo.localParentId == null && todo.remoteParentId == null) {
      return TaskEither.right(todo);
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
      String remoteId, TodoId? localId) {
    return networkInfo.onlineOrFailure.flatMap(
      (r) => todoApi
          .getTodoById(todoId: remoteId)
          .toTaskEither()
          .mapResponse()
          .flatMap(
            (r) => todoDao.createOrUpdateFromRemote(
              TodoMapper.fromRemoteById(r),
              localId?.value,
            ),
          ),
    );
  }
}
