import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:database/src/daos/todo/todo_dao_impl.dart';
import 'package:sync/sync.dart';
import 'package:todo/todo.dart';

abstract interface class TodoDao {
  factory TodoDao(DriftLocalDatabase db) = TodoDaoImpl;

  TaskEither<Failure, Todo> createOrUpdate(
    Todo todo, {
    required bool addToSyncQueue,
  });

  TaskEither<Failure, Todo> createOrUpdateFromRemote(
    Todo todo,
    TodoLocalId? localId,
  );

  Stream<List<Todo>> watchTodos();

  Stream<Either<Failure, Todo>> watchTodoById({
    TodoLocalId? localId,
    TodoRemoteId? remoteId,
  });

  TaskEither<Failure, List<Todo>> getTodos();

  TaskEither<Failure, Todo> getTodoById({
    TodoLocalId? localId,
    TodoRemoteId? remoteId,
  });

  TaskEither<Failure, Todo> replaceTodo(Todo todo, SyncStatus syncStatus);

  TaskEither<Failure, int> deleteByLocalIdHard(TodoLocalId localId);

  TaskEither<Failure, int> deleteByLocalIdSoft(TodoLocalId localId);

  TaskEither<Failure, int> deleteByRemoteId(TodoRemoteId remoteId);

  TaskEither<Failure, int> deleteByRemoteIdSoft(TodoRemoteId remoteId);

  TaskEither<Failure, int> deleteByRemoteIds(List<TodoRemoteId> remoteIds);
}
