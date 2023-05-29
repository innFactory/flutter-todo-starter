import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sync/sync.dart';

part 'todo.freezed.dart';

class TodoLocalId extends ValueId<int> {
  const TodoLocalId(int value) : super(value);
}

class TodoRemoteId extends ValueId<String> {
  const TodoRemoteId(String value) : super(value);
}

@freezed
class Todo with _$Todo {
  const factory Todo({
    required TodoLocalId? localId,
    required TodoRemoteId? remoteId,
    required String title,
    required String description,
    required Set<String> tags,
    required bool isCompleted,
    required TodoLocalId? localParentId,
    required TodoRemoteId? remoteParentId,
    required DateTime createdAt,
    required DateTime updatedAt,
    required SyncStatus syncStatus,
  }) = _Todo;

  /// Create a new Todo with default values.
  factory Todo.empty() {
    return Todo(
      localId: null,
      remoteId: null,
      title: 'title',
      description: 'description',
      tags: {},
      isCompleted: false,
      localParentId: null,
      remoteParentId: null,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      syncStatus: SyncStatus.modified,
    );
  }
}
