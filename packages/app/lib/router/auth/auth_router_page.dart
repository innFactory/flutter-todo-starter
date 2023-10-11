import 'package:admin_utils/admin_utils.dart';
import 'package:auto_route/auto_route.dart';

/// {@template auth_router}
/// The root router for all pages that are visible pre-authentication.
/// {@endtemplate}
@RoutePage(name: 'AuthRouter')
class AuthRouterPage extends AutoRouter with AdminGestureWrapper {
  /// {@macro auth_router}
  const AuthRouterPage({super.key});
}
