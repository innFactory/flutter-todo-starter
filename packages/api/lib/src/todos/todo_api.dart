import 'package:core/core.dart';
import 'package:todo/todo.dart';

abstract interface class TodoApi {
  @useResult
  TaskEither<Failure, List<Todo>> getTodos();

  @useResult
  TaskEither<Failure, Todo> getTodoById(TodoRemoteId id);

  @useResult
  TaskEither<Failure, Todo> createTodo(Todo todo);

  @useResult
  TaskEither<Failure, Todo> updateTodo(Todo todo);

  @useResult
  TaskEither<Failure, Unit> deleteTodoById(TodoRemoteId remoteId);

  @useResult
  TaskEither<Failure, TodoSync> getTodosSync(DateTime? lastSyncedAt);
}
