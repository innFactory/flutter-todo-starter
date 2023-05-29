import 'package:todo/src/domain/models/todo.dart';

class TodoSync {
  TodoSync({
    required this.todos,
    required this.deletedTodoIds,
  });

  final List<Todo> todos;
  final List<TodoRemoteId> deletedTodoIds;
}
