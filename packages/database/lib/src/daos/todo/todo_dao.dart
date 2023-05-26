import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:database/src/daos/todo/todo_dao_impl.dart';
import 'package:todo/todo.dart';

abstract class TodoDao {
  factory TodoDao(DriftLocalDatabase db) = TodoDaoImpl;

  TaskEither<Failure, Todo> createOrUpdate(Todo todo,
      {bool addToSyncQueue = true});

  TaskEither<Failure, Todo> createOrUpdateFromRemote(Todo todo, int? localId);

  Stream<List<Todo>> watchTodos();

  TaskEither<Failure, List<Todo>> getTodos();

  TaskEither<Failure, Todo> getTodoById({TodoId? localId, String? remoteId});

  TaskEither<Failure, int> deleteByLocalIdHard(int localId);

  TaskEither<Failure, int> deleteByLocalIdSoft(int localId);

  // TaskEither<Failure, List<int>> deleteByLocalIdsSoft(Set<int> localIds);

  TaskEither<Failure, int> deleteByRemoteId(String remoteId);

  TaskEither<Failure, int> deleteByRemoteIdSoft(String remoteId);

  TaskEither<Failure, int> deleteByRemoteIds(Set<String> remoteIds);
}
