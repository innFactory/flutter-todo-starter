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
    AuthRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const AuthRouterPage()),
      );
    },
    AuthenticatedRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const AuthenticatedRouterPage()),
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
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    RootRouterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RootRouterPage(),
      );
    },
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SignInPage(
          key: args.key,
          onLoginSuccess: args.onLoginSuccess,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    SyncOverviewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SyncOverviewPage(),
      );
    },
    TodoCreateRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TodoCreatePage(),
      );
    },
    TodoEditRoute.name: (routeData) {
      final args = routeData.argsAs<TodoEditRouteArgs>(
          orElse: () => const TodoEditRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TodoEditPage(
          key: args.key,
          localId: args.localId,
          remoteId: args.remoteId,
        ),
      );
    },
    TodoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TodoPage(),
      );
    },
    ...AdminUtilsModule().pagesMap,
  };
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
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [SignInPage]
class SignInRoute extends PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    Key? key,
    required void Function() onLoginSuccess,
    List<PageRouteInfo>? children,
  }) : super(
          SignInRoute.name,
          args: SignInRouteArgs(
            key: key,
            onLoginSuccess: onLoginSuccess,
          ),
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<SignInRouteArgs> page = PageInfo<SignInRouteArgs>(name);
}

class SignInRouteArgs {
  const SignInRouteArgs({
    this.key,
    required this.onLoginSuccess,
  });

  final Key? key;

  final void Function() onLoginSuccess;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key, onLoginSuccess: $onLoginSuccess}';
  }
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

/// generated route for
/// [SyncOverviewPage]
class SyncOverviewRoute extends PageRouteInfo<void> {
  const SyncOverviewRoute({List<PageRouteInfo>? children})
      : super(
          SyncOverviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'SyncOverviewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TodoCreatePage]
class TodoCreateRoute extends PageRouteInfo<void> {
  const TodoCreateRoute({List<PageRouteInfo>? children})
      : super(
          TodoCreateRoute.name,
          initialChildren: children,
        );

  static const String name = 'TodoCreateRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TodoEditPage]
class TodoEditRoute extends PageRouteInfo<TodoEditRouteArgs> {
  TodoEditRoute({
    Key? key,
    TodoLocalId? localId,
    TodoRemoteId? remoteId,
    List<PageRouteInfo>? children,
  }) : super(
          TodoEditRoute.name,
          args: TodoEditRouteArgs(
            key: key,
            localId: localId,
            remoteId: remoteId,
          ),
          initialChildren: children,
        );

  static const String name = 'TodoEditRoute';

  static const PageInfo<TodoEditRouteArgs> page =
      PageInfo<TodoEditRouteArgs>(name);
}

class TodoEditRouteArgs {
  const TodoEditRouteArgs({
    this.key,
    this.localId,
    this.remoteId,
  });

  final Key? key;

  final TodoLocalId? localId;

  final TodoRemoteId? remoteId;

  @override
  String toString() {
    return 'TodoEditRouteArgs{key: $key, localId: $localId, remoteId: $remoteId}';
  }
}

/// generated route for
/// [TodoPage]
class TodoRoute extends PageRouteInfo<void> {
  const TodoRoute({List<PageRouteInfo>? children})
      : super(
          TodoRoute.name,
          initialChildren: children,
        );

  static const String name = 'TodoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
