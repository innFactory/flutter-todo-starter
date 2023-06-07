import 'package:api/api.dart';
import 'package:core/core.dart';
import 'package:network_info/network_info.dart';
import 'package:todo/todo.dart';

class TodoApiImpl implements TodoApi {
  TodoApiImpl(this.todoApi, this.networkInfo);

  final TodoApiControllerApi todoApi;
  final NetworkInfo networkInfo;

  @override
  TaskEither<Failure, Todo> createTodo(Todo todo) {
    return networkInfo.onlineOrFailure.andThen(
      () => todoApi
          .createTodo(todoCreation: TodoMapper.toDtoCreate(todo))
          .toTaskEither()
          .mapResponse()
          .map(
            (remoteTodo) => TodoMapper.fromCreateTodoResponseContent(
              remoteTodo,
              todo,
            ),
          ),
    );
  }

  @override
  TaskEither<Failure, Todo> getTodoById(TodoRemoteId id) {
    return networkInfo.onlineOrFailure.andThen(
      () => todoApi
          .getTodoById(todoId: id.value)
          .toTaskEither()
          .mapResponse()
          .map(TodoMapper.fromRemoteById),
    );
  }

  @override
  TaskEither<Failure, List<Todo>> getTodos() {
    return networkInfo.onlineOrFailure.andThen(
      () => todoApi.getTodos().toTaskEither().mapResponse().map(
            (todos) => todos.map(TodoMapper.fromRemote).toList(),
          ),
    );
  }

  @override
  TaskEither<Failure, Todo> updateTodo(Todo todo) {
    return networkInfo.onlineOrFailure.andThen(
      () => todoApi
          .updateTodo(
            todoId: todo.remoteId!.value,
            todoUpdate: TodoMapper.toDtoUpdate(todo),
          )
          .toTaskEither()
          .mapResponse()
          .map(
            (remoteTodo) => TodoMapper.fromUpdateTodoResponseContent(
              remoteTodo,
              todo,
            ),
          ),
    );
  }

  @override
  TaskEither<Failure, Unit> deleteTodoById(TodoRemoteId remoteId) {
    return networkInfo.onlineOrFailure.andThen(
      () => todoApi
          .deleteTodoById(todoId: remoteId.value)
          .toTaskEither()
          .mapResponse()
          .map((_) => unit),
    );
  }

  @override
  TaskEither<Failure, TodoSync> getTodosSync(DateTime? lastSyncedAt) {
    return networkInfo.onlineOrFailure.andThen(
      () => todoApi
          .getTodosSync(timestamp: lastSyncedAt?.toIso8601String())
          .toTaskEither()
          .mapResponse()
          .map(
            (response) => TodoSync(
              todos: response.entities.map(TodoMapper.fromRemote).toList(),
              deletedTodoIds: response.deleted.map(TodoRemoteId.new).toList(),
            ),
          ),
    );
  }
}
