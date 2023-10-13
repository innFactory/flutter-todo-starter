import 'package:admin_utils/admin_utils.dart';
import 'package:auto_route/auto_route.dart';

/// {@template auth_router}
/// The root router for all pages that are visible post-authentication. This is
/// the parent router for all pages that require the user to be authenticated.
/// {@endtemplate}
@RoutePage(name: 'AuthenticatedRouter')
class AuthenticatedRouterPage extends AutoRouter with AdminGestureWrapper {
  /// {@macro auth_router}
  const AuthenticatedRouterPage({super.key});
}
