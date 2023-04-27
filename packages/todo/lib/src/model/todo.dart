import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

class TodoId extends ValueId<int> {
  const TodoId(int value) : super(value);
}

@freezed
class Todo with _$Todo {
  const factory Todo({
    required TodoId? id,
    required String title,
    required String description,
    required Set<String> tags,
    required bool isCompleted,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Todo;

  /// Create a new Todo with default values.
  factory Todo.empty() {
    return Todo(
      id: null,
      title: '',
      description: '',
      tags: {},
      isCompleted: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}
