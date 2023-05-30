import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:forms/forms.dart';
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

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
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
                TextField(
                  controller: textEditingController,
                  onTap: () => TemplateBottomSheet.show<void>(context,
                      builder: (context) {
                    return ListView(
                      children: todos
                          .where(
                        (element) => args?.localId != null
                            ? element != args!.localId
                            : true,
                      )
                          .map((e) {
                        return TodoListTile(
                          todo: e,
                          onEditPressed: (todo) {
                            formState.form.parentIdControl.value =
                                (todo.localId, todo.remoteId);
                          },
                          onCompleteToggle: (todo) {},
                          onDelete: (todo) {},
                        );
                      }).toList(),
                    );
                  }),
                ),
                ElevatedButton(
                  onPressed: () => ref
                      .read(todoFormControllerProvider(args).notifier)
                      .submit(),
                  child: const Text('submit'),
                ),
              ].separated((index) => const SizedBox(height: 20)),
            ),
          );
        });
      },
    );
  }
}

class TemplateBottomSheet extends StatelessWidget {
  const TemplateBottomSheet({
    super.key,
    required this.child,
    this.header,
    this.footer,
    this.loading = false,
  });

  final Widget child;
  final Widget? header;
  final Widget? footer;
  final bool loading;

  static Future<T?> show<T>(
    BuildContext context, {
    required WidgetBuilder builder,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: builder,
    );
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;

    final mq = MediaQuery.of(context);
    final maxHeight = mq.size.height - mq.padding.top;

    final bottomPadding = EdgeInsets.only(
      bottom: mq.viewInsets.bottom,
    );

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Material(
          color: backgroundColor,
          child: Padding(
            padding: bottomPadding,
            child: AnimatedSize(
              duration: const Duration(milliseconds: 200),
              child: loading
                  ? Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        height: mq.size.width / 2,
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(),
                      ),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (header != null) header!,
                        Flexible(
                          child: child,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: mq.padding.bottom,
                          ),
                          child: footer,
                        )
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
