import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:reactive_forms/reactive_forms.dart';

T? useControlValue<T>(AbstractControl<T> control) {
  final snapshot = useStream(
    control.valueChanges,
    initialData: control.value,
  );

  return snapshot.data;
}
