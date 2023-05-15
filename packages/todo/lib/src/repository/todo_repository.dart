import 'package:core/core.dart';
import 'package:sync/sync.dart';
import 'package:todo/todo.dart';

abstract class TodoRepository {
  SyncCapability get syncCapability;

  @useResult
  TaskEither<Failure, Todo> createOrUpdateTodo(Todo todo);

  Stream<List<Todo>> watchTodos();

  Stream<Either<Failure, Todo>> watchTodoById(TodoId todoId);

  @useResult
  TaskEither<Failure, Todo> getTodoById(TodoId todoId);

  @useResult
  TaskEither<Failure, Unit> deleteTodoById(TodoId todoId);
}
