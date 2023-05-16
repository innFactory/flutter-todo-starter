import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

@RoutePage()
class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TodoListView(),
    );
  }
}
