import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:sync/sync.dart';
import 'package:todo/todo.dart';

class TodoListView extends ConsumerWidget {
  const TodoListView({
    super.key,
    required this.onCreatePressed,
    required this.onEditPressed,
    required this.onCompleteToggle,
    required this.onDelete,
    required this.todos,
  });

  final VoidCallback onCreatePressed;
  final void Function(Todo) onEditPressed;
  final void Function(Todo) onCompleteToggle;
  final void Function(Todo) onDelete;
  final List<Todo> todos;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        IconButton(
          onPressed: onCreatePressed,
          icon: const Icon(Icons.add),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              return TodoListTile(
                todo: todo,
                onEditPressed: onEditPressed,
                onCompleteToggle: onCompleteToggle,
                onDelete: onDelete,
              );
            },
          ),
        ),
      ],
    );
  }
}

class TodoListTile extends StatelessWidget {
  const TodoListTile({
    super.key,
    required this.todo,
    required this.onEditPressed,
    required this.onCompleteToggle,
    required this.onDelete,
  });

  final Todo todo;
  final void Function(Todo p1) onEditPressed;
  final void Function(Todo p1) onCompleteToggle;
  final void Function(Todo p1) onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      tileColor: todo.isCompleted ? Colors.green : Colors.red,
      subtitle: Text(todo.description),
      onTap: () => onEditPressed(todo),
      leading: IconButton(
        onPressed: () => onCompleteToggle(todo),
        icon: todo.isCompleted
            ? const Icon(Icons.check)
            : const Icon(Icons.check_box_outline_blank),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            todo.syncStatus == SyncStatus.synced
                ? Icons.cloud_done
                : Icons.cloud_off,
          ),
          IconButton(
            onPressed: () => onDelete(todo),
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
