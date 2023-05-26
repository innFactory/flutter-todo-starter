import 'package:core/core.dart';
import 'package:sync/sync.dart';
import 'package:todo/todo.dart';

abstract class TodoRepository {
  @useResult
  TaskEither<Failure, Todo> createOrUpdateTodo(Todo todo);

  Stream<List<Todo>> watchTodos();

  @useResult
  TaskEither<Failure, List<Todo>> getTodos();

  @useResult
  TaskEither<Failure, Todo> getTodoById(TodoId todoId);

  @useResult
  TaskEither<Failure, Unit> deleteTodoById(TodoId todoId);

  @useResult
  TaskEither<Failure, Unit> pushToRemote(int localId, SyncStatus syncStatus);

  @useResult
  TaskEither<Failure, Unit> fetchFromRemote(DateTime? lastSyncedAt);
}
