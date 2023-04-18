import 'dart:async';
import 'dart:developer';

import 'package:app/app.dart';
import 'package:core/core.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

const kDevicePreviewEnabled = bool.fromEnvironment('ENABLE_DEVICE_PREVIEW');

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
