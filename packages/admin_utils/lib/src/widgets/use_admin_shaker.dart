import 'package:admin_utils/src/router.gm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shake/shake.dart';

void useAdminShaker({
  bool onlyInDebugMode = true,
}) {
  final context = useContext();

  return useEffect(() {
    if (onlyInDebugMode && !kDebugMode) {
      return null;
    }

    final detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        final alreadyPushed = AutoRouter.of(context)
            .stack
            .map((e) => e.name)
            .contains(AdminRoute.name);

        if (!alreadyPushed) {
          AutoRouter.of(context).push(const AdminRoute());
        }
      },
    );

    return detector.stopListening;
  }, []);
}
