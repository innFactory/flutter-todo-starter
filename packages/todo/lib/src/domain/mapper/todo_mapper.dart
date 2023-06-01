import 'package:api/api.dart';
import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:sync/sync.dart';
import 'package:todo/todo.dart';

extension TodoMapper on Never {
  static TodoTableCompanion toLocal(Todo todo) {
    return TodoTableCompanion(
      localId: todo.localId?.value.let(Value.new) ?? const Value.absent(),
      remoteId: todo.remoteId?.value.let(Value.new) ?? const Value.absent(),
      title: Value(todo.title),
      description: Value(todo.description),
      isCompleted: Value(todo.isCompleted),
      localParentId:
          todo.localParentId?.value.let(Value.new) ?? const Value.absent(),
      remoteParentId:
          todo.remoteParentId?.value.let(Value.new) ?? const Value.absent(),
      tags: Value(
        todo.tags.toList(),
      ),
      createdAt: Value(todo.createdAt),
      updatedAt: Value(todo.updatedAt),
      localSyncStatus: Value(todo.syncStatus),
    );
  }

  static Todo fromRemote(TodoResponse todo) {
    return Todo(
      localId: null,
      remoteId: TodoRemoteId(todo.todoId),
      title: todo.title,
      description: todo.description,
      tags: todo.tags.toSet(),
      isCompleted: todo.completed,
      localParentId: null,
      remoteParentId: todo.parentId?.let(TodoRemoteId.new),
      createdAt: DateTime.parse(todo.createdAt),
      updatedAt: DateTime.parse(todo.updatedAt),
      syncStatus: SyncStatus.synced,
    );
  }

  static Todo fromCreateTodoResponseContent(
    CreateTodoResponseContent todo,
    Todo? localTodo,
  ) {
    return Todo(
      localId: localTodo?.localId,
      remoteId: TodoRemoteId(todo.todoId),
      title: todo.title,
      description: todo.description,
      tags: todo.tags.toSet(),
      isCompleted: todo.completed,
      localParentId: localTodo?.localParentId,
      remoteParentId: todo.parentId?.let(TodoRemoteId.new),
      createdAt: DateTime.parse(todo.createdAt),
      updatedAt: DateTime.parse(todo.updatedAt),
      syncStatus: SyncStatus.synced,
    );
  }

  static Todo fromUpdateTodoResponseContent(
    UpdateTodoResponseContent todo,
    Todo? localTodo,
  ) {
    return Todo(
      localId: localTodo?.localId,
      remoteId: TodoRemoteId(todo.todoId),
      title: todo.title,
      description: todo.description,
      tags: todo.tags.toSet(),
      isCompleted: todo.completed,
      localParentId: localTodo?.localParentId,
      remoteParentId: todo.parentId?.let(TodoRemoteId.new),
      createdAt: DateTime.parse(todo.createdAt),
      updatedAt: DateTime.parse(todo.updatedAt),
      syncStatus: SyncStatus.synced,
    );
  }

  static Todo fromRemoteById(GetTodoByIdResponseContent todo) {
    return Todo(
      localId: null,
      remoteId: TodoRemoteId(todo.todoId),
      title: todo.title,
      description: todo.description,
      tags: todo.tags.toSet(),
      isCompleted: todo.completed,
      localParentId: null,
      remoteParentId: todo.parentId?.let(TodoRemoteId.new),
      createdAt: DateTime.parse(todo.createdAt),
      updatedAt: DateTime.parse(todo.updatedAt),
      syncStatus: SyncStatus.synced,
    );
  }

  static TodoCreation toDtoCreate(Todo todo) {
    return TodoCreation(
      title: todo.title,
      description: todo.description,
      completed: todo.isCompleted,
      parentId: todo.remoteParentId?.value,
      tags: todo.tags.toList(),
    );
  }

  static TodoUpdate toDtoUpdate(Todo todo) {
    return TodoUpdate(
      title: todo.title,
      description: todo.description,
      completed: todo.isCompleted,
      parentId: todo.remoteParentId?.value,
      tags: todo.tags.toList(),
    );
  }

  static Todo fromLocal(LocalTodo todo) {
    return Todo(
      localId: TodoLocalId(todo.localId),
      remoteId: todo.remoteId?.let(TodoRemoteId.new),
      title: todo.title,
      description: todo.description,
      tags: todo.tags.toSet(),
      isCompleted: todo.isCompleted,
      localParentId: todo.localParentId?.let(TodoLocalId.new),
      remoteParentId: todo.remoteParentId?.let(TodoRemoteId.new),
      createdAt: todo.createdAt ?? todo.localCreatedAt,
      updatedAt: todo.updatedAt ?? todo.localUpdatedAt,
      syncStatus: todo.localSyncStatus,
    );
  }
}
