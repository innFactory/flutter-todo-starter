import 'package:api/api.dart';
import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:network_info/network_info.dart';
import 'package:sync/sync.dart';
import 'package:todo/src/domain/mapper/todo_mapper.dart';
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
    return todoDao
        .createOrUpdate(TodoMapper.toLocal(todo))
        .map(TodoMapper.fromLocal);
  }

  @override
  TaskEither<Failure, Unit> deleteTodoById(TodoId todoId) {
    return todoDao.deleteById(todoId);
  }

  @override
  TaskEither<Failure, Todo> getTodoById(TodoId todoId) {
    return todoDao.getTodoById(todoId).map(TodoMapper.fromLocal);
  }

  @override
  Stream<List<Todo>> watchTodos() async* {
    syncTodos().run();

    yield* todoDao.watchTodos().map(
          (todos) => todos.map(TodoMapper.fromLocal).toList(),
        );
  }

  TaskEither<Failure, Unit> syncTodos() {
    return TaskEither(() async {
      if (await networkInfo.isConnected == false) {
        return left(Failures.offline);
      }

      final eitherLocalTodos = await todoDao.getTodos().run();
      final maybeLocalTodos = eitherLocalTodos.toNullable();

      if (maybeLocalTodos == null) {
        return left(Failures.database);
      }

      for (final todo in maybeLocalTodos) {
        switch (todo.localSyncStatus) {
          case SyncStatus.synced:
            continue;
          case SyncStatus.deleted:
            if (todo.remoteId != null) {
              todoApi.deleteTodoById(todoId: todo.remoteId!);
            } else {
              todoDao.deleteById(TodoId(todo.localId));
            }
            break;
          case SyncStatus.created:
            // todoApi.createTodo(todoCreation: todoCreation);
            // mapper
            break;
          case SyncStatus.updated:

            // todoApi.updateTodoById(todoId: todo.remoteId!, todoUpdate: todoUpdate);
            break;
        }
      }

      final todos = await todoApi.getTodosSync();

      if (todos.data == null) {
        return left(Failures.api);
      }

      final newTodos = todos.data!.entities
          .map((data) => TodoMapper.fromRemote(data))
          .toList();

      await TaskEither.traverseList(
        newTodos,
        (a) => todoDao.createOrUpdate(a),
      ).run();

      todoDao.deleteByRemoteIds(todos.data!.deleted.toSet()).run();

      return right(unit);
    });
  }

  @override
  TaskEither<Failure, List<Todo>> getTodos() {
    return todoDao.getTodos().map(
          (todos) => todos.map(TodoMapper.fromLocal).toList(),
        );
  }
}
