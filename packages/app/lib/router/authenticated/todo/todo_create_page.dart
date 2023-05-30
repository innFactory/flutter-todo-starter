import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

/// {@template sign_in_page}
/// The page that is shown when the user is not authenticated. This page is
/// responsible for showing the login form and handling the authentication
/// process.
/// {@endtemplate}
@RoutePage()
class TodoCreatePage extends StatelessWidget {
  /// {@macro sign_in_page}
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
