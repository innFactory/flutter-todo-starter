import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

@RoutePage()
class TodoCreatePage extends StatelessWidget {
  const TodoCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.translate('todo create'),
        ),
      ),
      body: TodoFormView(
        args: null,
        onSubmitSuccess: (todo) => context.popRoute(),
      ),
    );
  }
}
