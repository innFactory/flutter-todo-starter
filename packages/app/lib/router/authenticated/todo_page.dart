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

    return const Scaffold(
      body: TodoListView(),
    );
  }
}
