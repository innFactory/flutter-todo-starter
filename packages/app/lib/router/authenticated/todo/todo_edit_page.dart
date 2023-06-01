import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

@RoutePage()
class TodoEditPage extends StatelessWidget {
  const TodoEditPage({
    super.key,
    this.localId,
    this.remoteId,
  });

  final TodoLocalId? localId;
  final TodoRemoteId? remoteId;

  @override
  Widget build(BuildContext context) {
    final args = TodoFormArgs(localId: localId, remoteId: remoteId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.translate('todo_edit'),
        ),
      ),
      body: TodoFormView(
        args: args,
        onSubmitSuccess: (todo) => context.popRoute(),
      ),
    );
  }
}
