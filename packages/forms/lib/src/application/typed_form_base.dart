part of 'reactive_form_controller.dart';

mixin TypedFormBase<T> on AbstractControl<T> {
  @override
  T get value => super.value as T;

  @override
  set value(covariant T value);

  @override
  Stream<T> get valueChanges => super.valueChanges.map((event) => event as T);

  @override
  void updateValue(
    covariant T value, {
    bool updateParent = true,
    bool emitEvent = true,
  });

  @override
  void patchValue(
    covariant T value, {
    bool updateParent = true,
    bool emitEvent = true,
  });
}
