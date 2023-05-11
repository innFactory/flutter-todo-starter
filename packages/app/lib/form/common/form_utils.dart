import 'dart:async';

import 'package:reactive_forms/reactive_forms.dart';

Future<bool> validateControl(AbstractControl<dynamic> control) async {
  final validationCompleter = Completer<bool>();
  final subscription = control.statusChanged.listen((status) {
    if (status == ControlStatus.valid) {
      validationCompleter.complete(true);
    } else if (status == ControlStatus.invalid) {
      validationCompleter.complete(false);
    }
  });

  control.markAllAsTouched();
  control.updateValueAndValidity();

  final valid = await validationCompleter.future.timeout(
    const Duration(seconds: 5),
    onTimeout: () => false,
  );

  await subscription.cancel();

  return valid;
}
