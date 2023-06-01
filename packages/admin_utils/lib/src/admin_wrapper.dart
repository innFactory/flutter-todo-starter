import 'package:admin_utils/src/router/router.gm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shake/shake.dart';

class AdminWrapper extends HookWidget {
  const AdminWrapper({
    super.key,
    required this.child,
    required this.database,
    this.additionalAdminPageActions = const [],
  });

  final Widget child;
  final GeneratedDatabase database;
  final List<Widget> additionalAdminPageActions;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      ShakeDetector? detector;

      if (kDebugMode) {
        detector = ShakeDetector.autoStart(
          onPhoneShake: () {
            final alreadyPushed = AutoRouter.of(context)
                .stack
                .map((e) => e.name)
                .contains(AdminRoute.name);

            if (!alreadyPushed) {
              AutoRouter.of(context).push(
                AdminRoute(
                  database: database,
                  additionalActions: additionalAdminPageActions,
                ),
              );
            }
          },
        );
      }

      return detector?.stopListening;
    }, []);

    return child;
  }
}
