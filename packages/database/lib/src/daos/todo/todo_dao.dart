import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:database/src/daos/todo/todo_dao_impl.dart';
import 'package:todo/todo.dart';

abstract class TodoDao {
  factory TodoDao(DriftLocalDatabase db) = TodoDaoImpl;

  TaskEither<Failure, LocalTodo> createOrUpdate(TodoTableCompanion todo);

  Stream<List<LocalTodo>> watchTodos();

  TaskEither<Failure, List<LocalTodo>> getTodos();

  TaskEither<Failure, LocalTodo> getTodoById(TodoId todoId);

  TaskEither<Failure, Unit> deleteById(TodoId todoId);

  TaskEither<Failure, int> deleteByLocalId(int localId);

  TaskEither<Failure, int> deleteByLocalIdSoft(int localId);

  TaskEither<Failure, int> deleteByLocalIdsSoft(Set<int> localIds);

  TaskEither<Failure, int> deleteByRemoteId(String remoteId);

  TaskEither<Failure, int> deleteByRemoteIds(Set<String> remoteIds);

  TaskEither<Failure, int> deleteByRemoteIdSoft(String remoteId);

  TaskEither<Failure, int> deleteByRemoteIdsSoft(Set<String> remoteIds);
}
