import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:todo/todo.dart';

extension TodoMapper on Never {
  static TodoTableCompanion toLocal(Todo todo) {
    return TodoTableCompanion(
      localId: todo.localId?.value.let(Value.new) ?? const Value.absent(),
      remoteId: todo.remoteId?.let(Value.new) ?? const Value.absent(),
      title: Value(todo.title),
      description: Value(todo.description),
      isCompleted: Value(todo.isCompleted),
      localParentId:
          todo.localParentId?.value.let(Value.new) ?? const Value.absent(),
      remoteParentId:
          todo.remoteParentId?.let(Value.new) ?? const Value.absent(),
      tags: Value(
        todo.tags.toList(),
      ),
      createdAt: Value(todo.createdAt),
      updatedAt: Value(todo.updatedAt),
    );
  }

  static Todo fromLocal(LocalTodo todo) {
    return Todo(
      localId: TodoId(todo.localId),
      remoteId: todo.remoteId,
      title: todo.title,
      description: todo.description,
      tags: todo.tags.toSet(),
      isCompleted: todo.isCompleted,
      localParentId: todo.localParentId?.let(TodoId.new),
      remoteParentId: todo.remoteParentId,
      createdAt: todo.createdAt ?? todo.localCreatedAt,
      updatedAt: todo.updatedAt ?? todo.localUpdatedAt,
    );
  }
}
