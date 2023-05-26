import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sync/sync.dart';

part 'todo.freezed.dart';

class TodoId extends ValueId<int> {
  const TodoId(int value) : super(value);
}

@freezed
class Todo with _$Todo {
  const factory Todo({
    required TodoId? localId,
    required String? remoteId,
    required String title,
    required String description,
    required Set<String> tags,
    required bool isCompleted,
    required TodoId? localParentId,
    required String? remoteParentId,
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
      syncStatus: SyncStatus.created,
    );
  }
}
