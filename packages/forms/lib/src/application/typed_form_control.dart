part of 'reactive_form_controller.dart';

class TypedFormControl<T> extends FormControl<T> with TypedFormBase<T> {
  TypedFormControl({
    required T super.value,
    super.validators = const [],
    super.asyncValidators = const [],
    super.asyncValidatorsDebounceTime = 250,
    super.touched = false,
    super.disabled = false,
  });

  @override
  set value(covariant T value) {
    updateValue(value);
  }

  @override
  void updateValue(
    covariant T value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    super.updateValue(value, updateParent: updateParent, emitEvent: emitEvent);
  }

  @override
  void patchValue(
    covariant T value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    super.patchValue(value, updateParent: updateParent, emitEvent: emitEvent);
  }
}
