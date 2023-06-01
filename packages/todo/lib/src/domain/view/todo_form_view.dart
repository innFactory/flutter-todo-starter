import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:forms/forms.dart';
import 'package:todo/src/domain/view/todo_list_tile.dart';
import 'package:todo/todo.dart';

class TodoFormView extends HookConsumerWidget {
  const TodoFormView({
    super.key,
    required this.args,
    this.onSubmitSuccess,
  });

  final TodoFormArgs? args;
  final void Function(Todo todo)? onSubmitSuccess;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoStreamProvider).valueOrNull ?? [];

    return ReactiveFormView<Todo, TodoForm>(
      provider: todoFormControllerProvider(args),
      onSubmitSuccess: onSubmitSuccess,
      focusBuilder: (form) => [form.titleControl, form.descriptionControl],
      builder: (formState) {
        return HookBuilder(builder: (context) {
          final parentIdControlValue =
              useControlValue(formState.form.parentIdControl);
          final textEditingController = useTextEditingController();

          useEffect(() {
            textEditingController.text = todos
                    .firstWhereOrNull(
                      (element) =>
                          element.localId == parentIdControlValue?.$1 ||
                          element.remoteId == parentIdControlValue?.$2,
                    )
                    ?.title ??
                '';

            return null;
          }, [parentIdControlValue]);

          return ListView(
            padding: const EdgeInsets.all(20),
            physics: const ClampingScrollPhysics(),
            children: [
              ReactiveTextField(
                formControl: formState.form.titleControl,
              ),
              ReactiveTextField(
                formControl: formState.form.descriptionControl,
              ),
              Row(
                children: [
                  const Text('Completed'),
                  ReactiveCheckbox(
                    formControl: formState.form.completedControl,
                  ),
                ],
              ),
              Column(
                children: todos
                    .where(
                      (element) {
                        if (args == null) return true;

                        return (element.localId != args?.localId &&
                                args?.localId != null) ||
                            (element.remoteId != args?.remoteId &&
                                args?.remoteId != null);
                      },
                    )
                    .where((element) =>
                        element.localParentId == null &&
                        element.remoteParentId == null)
                    .map((todo) {
                      return TodoListTile(
                        todo: todo,
                        onTap: (todo) {
                          if (parentIdControlValue?.$1 == todo.localId &&
                                  todo.localId != null ||
                              parentIdControlValue?.$2 == todo.remoteId &&
                                  todo.remoteId != null) {
                            formState.form.parentIdControl.value = (null, null);

                            return;
                          }

                          formState.form.parentIdControl.value =
                              (todo.localId, todo.remoteId);
                        },
                        selected: (parentIdControlValue?.$1 == todo.localId &&
                                todo.localId != null) ||
                            (parentIdControlValue?.$2 == todo.remoteId &&
                                todo.remoteId != null),
                      );
                    })
                    .toList(),
              ),
              ElevatedButton(
                onPressed: () => ref
                    .read(todoFormControllerProvider(args).notifier)
                    .submit(),
                child: const Text('submit'),
              ),
            ].separated((index) => const SizedBox(height: 20)),
          );
        });
      },
    );
  }
}
