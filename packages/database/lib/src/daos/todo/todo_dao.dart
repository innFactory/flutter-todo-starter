import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:todo/todo.dart';

abstract class TodoDao {
  TaskEither<Failure, int> createOrUpdate({
    required LocalTodo todo,
  });

  TaskEither<Failure, Unit> deleteById(TodoId todoId);
}
