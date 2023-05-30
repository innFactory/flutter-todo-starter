import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:reactive_forms/reactive_forms.dart';

ControlStatus useControlStatus<T>(AbstractControl<T> control) {
  final snapshot = useStream(
    control.statusChanged,
    initialData: control.status,
  );

  return snapshot.data ?? control.status;
}

bool useControlDisabled<T>(AbstractControl<T> control) {
  final controlStatus = useControlStatus(control);

  return controlStatus == ControlStatus.disabled ||
      controlStatus == ControlStatus.pending;
}
