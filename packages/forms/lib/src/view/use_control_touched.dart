import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:reactive_forms/reactive_forms.dart';

bool useControlTouched<T>(AbstractControl<T> control) {
  final snapshot = useStream(
    control.touchChanges,
    initialData: control.touched,
  );

  return snapshot.data ?? control.touched;
}
