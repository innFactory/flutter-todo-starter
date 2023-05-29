import 'package:core/core.dart';
import 'package:sync/sync.dart';
import 'package:todo/todo.dart';

abstract class TodoRepository {
  @useResult
  TaskEither<Failure, Todo> createOrUpdateTodo(Todo todo);

  Stream<List<Todo>> watchTodos();

  Stream<Either<Failure, Todo>> watchTodoById(
    TodoLocalId localId,
    TodoRemoteId? remoteId,
  );

  @useResult
  TaskEither<Failure, List<Todo>> getTodos();

  @useResult
  TaskEither<Failure, Todo> getTodoById(
    TodoLocalId localId,
    TodoRemoteId? remoteId,
  );

  @useResult
  TaskEither<Failure, Unit> deleteTodoById(TodoLocalId todoId);

  @useResult
  TaskEither<Failure, Unit> pushToRemote(int localId, SyncStatus syncStatus);

  @useResult
  TaskEither<Failure, Unit> fetchFromRemote();
}
