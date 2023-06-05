import 'package:admin_utils/src/router/router.gm.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig.module()
class AdminUtilsModule extends $AdminUtilsModule {
  static List<AutoRoute> get routes {
    return [
      AutoRoute(page: AdminRoute.page),
      AutoRoute(page: DriftDbRoute.page),
    ];
  }
}
