// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    RootRouterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RootRouterPage(),
      );
    },
    ErrorRoute.name: (routeData) {
      final args = routeData.argsAs<ErrorRouteArgs>(
          orElse: () => const ErrorRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ErrorPage(
          key: args.key,
          error: args.error,
        ),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInPage(),
      );
    },
    AuthRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthRouterPage(),
      );
    },
    AuthenticatedRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthenticatedRouterPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
  };
}

/// generated route for
/// [RootRouterPage]
class RootRouterRoute extends PageRouteInfo<void> {
  const RootRouterRoute({List<PageRouteInfo>? children})
      : super(
          RootRouterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRouterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ErrorPage]
class ErrorRoute extends PageRouteInfo<ErrorRouteArgs> {
  ErrorRoute({
    Key? key,
    Object? error,
    List<PageRouteInfo>? children,
  }) : super(
          ErrorRoute.name,
          args: ErrorRouteArgs(
            key: key,
            error: error,
          ),
          initialChildren: children,
        );

  static const String name = 'ErrorRoute';

  static const PageInfo<ErrorRouteArgs> page = PageInfo<ErrorRouteArgs>(name);
}

class ErrorRouteArgs {
  const ErrorRouteArgs({
    this.key,
    this.error,
  });

  final Key? key;

  final Object? error;

  @override
  String toString() {
    return 'ErrorRouteArgs{key: $key, error: $error}';
  }
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthRouterPage]
class AuthRouter extends PageRouteInfo<void> {
  const AuthRouter({List<PageRouteInfo>? children})
      : super(
          AuthRouter.name,
          initialChildren: children,
        );

  static const String name = 'AuthRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthenticatedRouterPage]
class AuthenticatedRouter extends PageRouteInfo<void> {
  const AuthenticatedRouter({List<PageRouteInfo>? children})
      : super(
          AuthenticatedRouter.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticatedRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
