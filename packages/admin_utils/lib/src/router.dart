import 'package:admin_utils/src/router.gm.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig.module()
class AdminUtilsModule extends $AdminUtilsModule {
  static AutoRoute get route {
    return AutoRoute(
      page: AdminRouterRoute.page,
      path: '/admin',
      children: [
        AutoRoute(
          initial: true,
          page: AdminRoute.page,
        ),
        AutoRoute(
          page: DriftDbRoute.page,
          path: 'db',
        ),
      ],
    );
  }
}
