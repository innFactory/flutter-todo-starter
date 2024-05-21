part of 'todo_form_controller.dart';

class TodoForm extends TypedFormGroup<Todo> {
  TodoForm(Todo currentValue) : super(currentValue);

  late final titleControl = createControl(
    'titleControl',
    (value) => value.title,
  )(
    (value) => TypedFormControl<String>(
      value: value,
      validators: [
        Validators.required,
      ],
    ),
  );

  late final descriptionControl = createControl(
    'descriptionControl',
    (value) => value.description,
  )(
    (value) => TypedFormControl<String>(
      value: value,
      validators: [
        Validators.required,
      ],
    ),
  );

  late final completedControl = createControl(
    'completedControl',
    (value) => value.isCompleted,
  )(
    (value) => TypedFormControl<bool>(
      value: value,
      validators: [
        Validators.required,
      ],
    ),
  );

  late final parentIdControl = createControl(
    'parentIdControl',
    (value) => (value.localParentId, value.remoteParentId),
  )(
    (value) => TypedFormControl<(TodoLocalId?, TodoRemoteId?)>(
      value: value,
      validators: [
        Validators.required,
      ],
    ),
  );

  late final tagControl = createControl(
    'tagControl',
    (value) => value.tags,
  )(
    (value) => TypedFormControl<Set<String>>(
      value: value,
      validators: [
        Validators.required,
      ],
    ),
  );

  @override
  Todo toDomain(Todo previousValue) {
    return previousValue.copyWith(
      title: titleControl.value,
      description: descriptionControl.value,
      isCompleted: completedControl.value,
      localParentId: parentIdControl.value.$1,
      remoteParentId: parentIdControl.value.$2,
      tags: tagControl.value,
    );
  }
}
