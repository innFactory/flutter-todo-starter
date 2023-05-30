import 'package:app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo/todo.dart';

@RoutePage()
class TodoPage extends HookConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref.read(todoRepositoryProvider).fetchFromRemote().run();

      return null;
    }, []);

    void onItemCreate() {
      context.pushRoute(const TodoCreateRoute());
    }

    void onItemEdit(Todo todo) {
      context.pushRoute(TodoEditRoute(
        localId: todo.localId,
        remoteId: todo.remoteId,
      ));
    }

    void onCompleteTodo(Todo todo) {
      ref.read(completeTodoUseCaseProvider).toggleTodo(todo).run();
    }

    final todos = ref.watch(todoStreamProvider).valueOrNull ?? [];

    return Scaffold(
      body: TodoListView(
        todos: todos,
        onCreatePressed: onItemCreate,
        onEditPressed: onItemEdit,
        onCompleteToggle: onCompleteTodo,
        onDelete: (todo) => ref
            .read(todoRepositoryProvider)
            .deleteTodoById(todo.localId, todo.remoteId)
            .run(),
      ),
    );
  }
}
