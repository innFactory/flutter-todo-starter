import 'package:flutter/material.dart';
import 'package:sync/sync.dart';
import 'package:todo/src/domain/models/todo.dart';

class TodoListTile extends StatelessWidget {
  const TodoListTile({
    super.key,
    required this.todo,
    this.onTap,
    this.onCompleteToggle,
    this.onDelete,
    this.todosWithParent = const [],
    this.selectedId,
    this.indent = 0,
  });

  final Todo todo;
  final List<Todo> todosWithParent;
  final void Function(Todo p1)? onTap;
  final void Function(Todo p1)? onCompleteToggle;
  final void Function(Todo p1)? onDelete;
  final (TodoLocalId?, TodoRemoteId?)? selectedId;
  final int indent;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _TodoListTile(
          todo: todo,
          onTap: onTap,
          onCompleteToggle: onCompleteToggle,
          onDelete: onDelete,
          isFirst: true,
          selected:
              todo.localId == selectedId?.$1 || todo.remoteId == selectedId?.$2,
          indent: indent,
        ),
        ...todosWithParent
            .where(
              (element) =>
                  element.remoteParentId == todo.remoteId ||
                  element.localParentId == todo.localId,
            )
            .map((e) => TodoListTile(
                  todo: e,
                  todosWithParent: todosWithParent,
                  onCompleteToggle: onCompleteToggle,
                  onDelete: onDelete,
                  onTap: onTap,
                  selectedId: selectedId,
                  indent: indent + 1,
                )),
      ],
    );
  }
}

class _TodoListTile extends StatelessWidget {
  const _TodoListTile({
    required this.todo,
    required this.onTap,
    required this.onCompleteToggle,
    required this.onDelete,
    required this.isFirst,
    required this.selected,
    required this.indent,
  });

  final Todo todo;
  final void Function(Todo p1)? onTap;
  final void Function(Todo p1)? onCompleteToggle;
  final void Function(Todo p1)? onDelete;
  final bool isFirst;
  final bool? selected;
  final int indent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: (5 * indent).toDouble()),
      child: ListTile(
        title: Text(todo.title),
        tileColor: todo.isCompleted ? Colors.green : Colors.red,
        subtitle: Text(todo.description),
        onTap: onTap != null ? () => onTap!(todo) : null,
        leading: onCompleteToggle != null
            ? IconButton(
                onPressed: () => onCompleteToggle!(todo),
                icon: todo.isCompleted
                    ? const Icon(Icons.check)
                    : const Icon(Icons.check_box_outline_blank),
              )
            : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              todo.syncStatus == SyncStatus.synced
                  ? Icons.cloud_done
                  : Icons.cloud_off,
            ),
            if (onDelete != null)
              IconButton(
                onPressed: () => onDelete!(todo),
                icon: const Icon(Icons.delete),
              ),
            if (selected == true)
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(Icons.check),
              ),
          ],
        ),
      ),
    );
  }
}
