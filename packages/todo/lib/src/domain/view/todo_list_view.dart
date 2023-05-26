import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:sync/sync.dart';
import 'package:todo/src/application/todo_stream_provider.dart';
import 'package:todo/src/domain/usecases/complete_todo_use_case.dart';
import 'package:todo/todo.dart';

class TodoListView extends ConsumerWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoStreamProvider).valueOrNull ?? [];
    final todoUseCase = ref.watch(completeTodoUseCaseProvider);

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
                subtitle: Text(todo.description),
                leading: IconButton(
                  onPressed: () => todoUseCase.toggleTodo(todo).run(),
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
                      onPressed: () => ref
                          .read(todoRepositoryProvider)
                          .deleteTodoById(todo.localId!)
                          .run(),
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
