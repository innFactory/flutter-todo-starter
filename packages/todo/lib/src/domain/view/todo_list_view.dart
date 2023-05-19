import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:todo/src/application/todo_stream_provider.dart';
import 'package:todo/src/domain/provider/todo_repository_provider.dart';
import 'package:todo/todo.dart';

class TodoListView extends ConsumerWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoStreamProvider).valueOrNull ?? [];

    return Column(
      children: [
        IconButton(
          onPressed: () => ref
              .read(todoRepositoryProvider)
              .createOrUpdateTodo(
                Todo.empty(),
              )
              .run(),
          icon: const Icon(Icons.add),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              return ListTile(
                title: Text(todo.title),
                tileColor: todo.isCompleted ? Colors.green : Colors.red,
                subtitle: Text(
                    '${todo.description}  ${todo.localId?.value.toString() ?? ''}'),
                leading: todo.isCompleted
                    ? const Icon(Icons.check)
                    : const Icon(Icons.check_box_outline_blank),
                trailing: IconButton(
                  onPressed: () => ref
                      .read(todoRepositoryProvider)
                      .deleteTodoById(todo.localId!)
                      .run(),
                  icon: const Icon(Icons.delete),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
