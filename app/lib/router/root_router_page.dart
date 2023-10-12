import 'package:app/router/router.dart';
import 'package:app/router/splash_page.dart';
import 'package:auth/auth.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// The root router for the entire app. This is the parent router for all other
/// routers.
///
/// This router is responsible for loading all relevant data (e.g. auth state)
/// before showing the relevant sub-router.
@RoutePage()
class RootRouterPage extends HookConsumerWidget {
  const RootRouterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authUser = ref.watch(authUserStreamProvider);

    return AutoRouter.declarative(
      placeholder: (context) => const SplashPage(),
      routes: (pending) => authUser.when(
        data: (authUser) => authUser.fold(
          () => [const AuthRouter()],
          (authUser) => [const AuthenticatedRouter()],
        ),
        loading: () => [const SplashRoute()],
        error: (err, stack) => [ErrorRoute(error: err)],
      ),
    );
  }
}
