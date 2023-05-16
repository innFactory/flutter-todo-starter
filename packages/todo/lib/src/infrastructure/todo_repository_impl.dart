import 'package:api/api.dart';
import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:network_info/network_info.dart';
import 'package:todo/src/domain/mapper/todo_mapper.dart';
import 'package:todo/todo.dart';

class TodoRepositoryImpl implements TodoRepository {
  TodoRepositoryImpl({
    required this.networkInfo,
    required this.todoApi,
    required this.todoDao,
  });

  final NetworkInfo networkInfo;
  final TodoApiControllerApi todoApi;
  final TodoDao todoDao;

  @override
  TaskEither<Failure, Todo> createOrUpdateTodo(Todo todo) {
    return todoDao
        .createOrUpdate(TodoMapper.toLocal(todo))
        .map(TodoMapper.fromLocal);
  }

  @override
  TaskEither<Failure, Unit> deleteTodoById(TodoId todoId) {
    return todoDao.deleteById(todoId);
  }

  @override
  TaskEither<Failure, Todo> getTodoById(TodoId todoId) {
    return todoDao.getTodoById(todoId).map(TodoMapper.fromLocal);
  }

  @override
  Stream<List<Todo>> watchTodos() {
    return todoDao.watchTodos().map(
          (todos) => todos.map(TodoMapper.fromLocal).toList(),
        );
  }

  @override
  TaskEither<Failure, List<Todo>> getTodos() {
    return todoDao.getTodos().map(
          (todos) => todos.map(TodoMapper.fromLocal).toList(),
        );
  }
}
