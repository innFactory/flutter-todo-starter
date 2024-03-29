import 'package:core/core.dart';
import 'package:todo/todo.dart';

abstract interface class TodoRepository {
  @useResult
  TaskEither<Failure, Todo> createOrUpdateTodo(Todo todo);

  Stream<List<Todo>> watchTodos({
    bool includeSoftDeleted = false,
  });

  Stream<Either<Failure, Todo>> watchTodoById(
    TodoLocalId localId,
    TodoRemoteId? remoteId,
  );

  @useResult
  TaskEither<Failure, List<Todo>> getTodos();

  @useResult
  TaskEither<Failure, Todo> getTodoById(
    TodoLocalId? localId,
    TodoRemoteId? remoteId,
  );

  @useResult
  TaskEither<Failure, Unit> deleteTodoById(
    TodoLocalId? todoId,
    TodoRemoteId? remoteId,
  );

  @useResult
  TaskEither<Failure, Unit> syncToRemote(int localId);

  @useResult
  TaskEither<Failure, Unit> fetchFromRemote();

  @useResult
  TaskEither<Failure, Unit> revertChanges(int localId);
}
