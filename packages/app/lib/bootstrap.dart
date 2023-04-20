import 'dart:async';
import 'dart:developer';

import 'package:app/app.dart';
import 'package:core/core.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// Wether or not the [DevicePreview] is enabled. This value is set only pre
/// build time and can be set by passing the
/// `--dart-define=ENABLE_DEVICE_PREVIEW` flag to the `flutter run` command.
const kDevicePreviewEnabled = bool.fromEnvironment('ENABLE_DEVICE_PREVIEW');

/// Entrypoint for the application. This function is called by the respective
/// `main` method of each Environment (e.g. `main_development.dart`) and
/// initializes the application.
Future<void> bootstrap({
  required Environment environment,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(
    () async {
      Environment.current = environment;

      runApp(
        DevicePreview(
          enabled: kDevicePreviewEnabled,
          builder: (context) => const ProviderScope(
            child: App(),
          ),
        ),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
