import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:todo/src/domain/view/todo_list_tile.dart';
import 'package:todo/todo.dart';

class TodoListView extends ConsumerWidget {
  const TodoListView({
    super.key,
    required this.onEditPressed,
    required this.onCompleteToggle,
    required this.onDelete,
    required this.todos,
  });

  final void Function(Todo) onEditPressed;
  final void Function(Todo) onCompleteToggle;
  final void Function(Todo) onDelete;
  final List<Todo> todos;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosWithoutParent = todos
        .where((element) =>
            element.localParentId == null && element.remoteParentId == null)
        .toList();

    final todosWithParent = todos.where((element) =>
        element.localParentId != null || element.remoteParentId != null);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: todosWithoutParent.length,
      itemBuilder: (context, index) {
        final todo = todosWithoutParent[index];

        return TodoListTile(
          todo: todo,
          onTap: onEditPressed,
          onCompleteToggle: onCompleteToggle,
          onDelete: onDelete,
          todosWithParent: todosWithParent.toList(),
        );
      },
    );
  }
}
