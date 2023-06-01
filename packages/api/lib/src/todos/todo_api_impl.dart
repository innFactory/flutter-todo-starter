import 'package:api/api.dart';
import 'package:core/core.dart';
import 'package:todo/todo.dart';

class TodoApiImpl implements TodoApi {
  TodoApiImpl(this.todoApi);

  final TodoApiControllerApi todoApi;

  @override
  TaskEither<Failure, Todo> createTodo(Todo todo) {
    return todoApi
        .createTodo(todoCreation: TodoMapper.toDtoCreate(todo))
        .toTaskEither()
        .mapResponse()
        .map(
          (remoteTodo) => TodoMapper.fromCreateTodoResponseContent(
            remoteTodo,
            todo,
          ),
        );
  }

  @override
  TaskEither<Failure, Todo> getTodoById(TodoRemoteId id) {
    return todoApi
        .getTodoById(todoId: id.value)
        .toTaskEither()
        .mapResponse()
        .map(TodoMapper.fromRemoteById);
  }

  @override
  TaskEither<Failure, List<Todo>> getTodos() {
    return todoApi
        .getTodos()
        .toTaskEither()
        .mapResponse()
        .map((todos) => todos.map(TodoMapper.fromRemote).toList());
  }

  @override
  TaskEither<Failure, Todo> updateTodo(Todo todo) {
    return todoApi
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
        );
  }

  @override
  TaskEither<Failure, Unit> deleteTodoById(TodoRemoteId remoteId) {
    return todoApi
        .deleteTodoById(
          todoId: remoteId.value,
        )
        .toTaskEither()
        .mapResponse()
        .map((_) => unit);
  }

  @override
  TaskEither<Failure, TodoSync> getTodosSync(DateTime? lastSyncedAt) {
    return todoApi
        .getTodosSync(timestamp: lastSyncedAt?.toIso8601String())
        .toTaskEither()
        .mapResponse()
        .map(
          (response) => TodoSync(
            todos: response.entities.map(TodoMapper.fromRemote).toList(),
            deletedTodoIds: response.deleted.map(TodoRemoteId.new).toList(),
          ),
        );
  }
}
