import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:forms/src/common/form_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'reactive_form_controller.freezed.dart';
part 'reactive_form_state.dart';
part 'typed_form_array.dart';
part 'typed_form_base.dart';
part 'typed_form_control.dart';
part 'typed_form_group.dart';

/// A [ReactiveFormController] that can be used to manage a [FormGroup].
///
/// [F] is the type of the failure of the form.
/// [T] is the type of the entity of the form.
abstract class ReactiveFormController<Domain,
        Form extends TypedFormGroup<Domain>>
    extends StateNotifier<ReactiveFormState<Domain, Form>> {
  ReactiveFormController() : super(const ReactiveFormState.loading()) {
    _init();
  }

  StreamSubscription<dynamic>? _valueChangesSubscription;
  StreamSubscription<ControlStatus>? _statusChangesSubscription;

  late Form form;

  /// Load the initial state of the _form. Usually checks if an id of the entity
  /// is given and loads the entity from the repository. If no id is given, a
  /// new "empty" entity should be returned.
  @protected
  TaskEither<Failure, Domain> get initialValue;

  /// Create the form object with the initial value. Will only be called once.
  @protected
  Form createForm(Domain initialValue);

  @protected
  TaskEither<Failure, Domain> onSubmit(Domain value);

  Future<void> updateForm(FutureOr<void> Function(Form form) update) async {
    await state.whenOrNull(
      (form, isSubmitting, isPristine, isDisabled, submitFailureOrSuccess) {
        return update(form);
      },
    );
  }

  Future<bool> submit() async {
    return await state.maybeMap(
      (value) async {
        final form = value.form;
        final valid = await validateControl(form);

        if (!valid) {
          logW('Form is not valid: ${form.errors}');

          return false;
        }

        form.markAsDisabled();

        state = value.copyWith(
          isSubmitting: true,
          submitFailureOrSuccess: null,
        );
        final newValue = form.toDomain(form._value);
        final result = await onSubmit(newValue).run();
        result.getRight().map((value) {
          form.patchValue(value);
          form.markAsPristine();
        });
        form.markAsEnabled();

        if (mounted) {
          state = value.copyWith(
            isSubmitting: false,
            submitFailureOrSuccess: result,
            isPristine: result.isRight(),
          );
        }

        return result.isRight();
      },
      orElse: () => false,
    );
  }

  @override
  Future<void> dispose() async {
    await _valueChangesSubscription?.cancel();
    await _statusChangesSubscription?.cancel();

    return super.dispose();
  }

  Future<void> _init() async {
    final initialValue = await this.initialValue.run();

    initialValue.fold(
      (failure) {
        state = ReactiveFormState.error(failure);
      },
      (value) {
        form = createForm(value);
        form.patchValue(value);
        form.markAsPristine();
        state = ReactiveFormState.initial(form);

        _valueChangesSubscription = form.valueChanges.listen((_) {
          // Update pristine states
          state = state.maybeMap(
            (loaded) => loaded.copyWith(
              isPristine: form.pristine,
            ),
            orElse: () => state,
          );
        });

        _statusChangesSubscription = form.statusChanged.listen((status) {
          state = state.maybeMap(
            (loaded) => loaded.copyWith(
              isDisabled: status == ControlStatus.pending ||
                  status == ControlStatus.disabled,
            ),
            orElse: () => state,
          );
        });
      },
    );
  }
}
