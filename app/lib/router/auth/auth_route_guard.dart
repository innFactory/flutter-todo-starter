import 'package:app/router/router.dart';
import 'package:auth/auth.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';

final authRouteGuardProvider = Provider.autoDispose(
  (ref) => AuthRouteGuard(
    authRepository: ref.watch(authRepositoryProvider),
  ),
);

class AuthRouteGuard extends AutoRouteGuard {
  const AuthRouteGuard({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    resolver.redirect(const SplashRoute());

    final credentials = await _authRepository.isUserSignedIn().run();

    if (credentials.toNullable() == true) {
      resolver.next();
    } else {
      await resolver.redirect(
        SignInRoute(onLoginSuccess: () => resolver.next()),
      );
    }
  }
}
