import 'package:admin_utils/admin_utils.dart';
import 'package:app/auth/application/auth_change_notifier.dart';
import 'package:app/router/auth/auth_route_guard.dart';
import 'package:app/router/auth/auth_router_page.dart';
import 'package:app/router/auth/sign_in_page.dart';
import 'package:app/router/authenticated/authenticated_router.dart';
import 'package:app/router/authenticated/home_page.dart';
import 'package:app/router/authenticated/sync_overview_page.dart';
import 'package:app/router/authenticated/todo/todo_create_page.dart';
import 'package:app/router/authenticated/todo/todo_edit_page.dart';
import 'package:app/router/authenticated/todo/todo_page.dart';
import 'package:app/router/error_page.dart';
import 'package:app/router/root_router_page.dart';
import 'package:app/router/splash_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

part 'router.gr.dart';

final appRouterProvier = Provider.autoDispose(
  (ref) => AppRouter._(
    authGuard: ref.watch(authRouteGuardProvider),
  ),
);

final appRouterReevaluateListenableProvider = Provider.autoDispose(
  (ref) {
    return _MergeChangeNotifier([
      ref.watch(authChangeNotifierProvider),
    ]);
  },
);

/// The `auto_route` router for the app. All relevant routes for the app are
/// defined here.
@AutoRouterConfig(
  modules: [AdminUtilsModule],
)
class AppRouter extends _$AppRouter {
  AppRouter._({
    required AuthRouteGuard authGuard,
  }) : _authGuard = authGuard;

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  final AuthRouteGuard _authGuard;

  @override
  List<AutoRoute> get routes {
    return [
      CustomRoute(
        transitionsBuilder: TransitionsBuilders.fadeIn,
        page: AuthRouter.page,
        children: [
          AutoRoute(
            page: SignInRoute.page,
            initial: true,
          ),
        ],
      ),
      CustomRoute(
        initial: true,
        page: AuthenticatedRouter.page,
        guards: [_authGuard],
        children: [
          AutoRoute(
            page: HomeRoute.page,
            initial: true,
            children: [
              AutoRoute(page: TodoRoute.page, initial: true),
              AutoRoute(page: SyncOverviewRoute.page),
            ],
          ),
          AutoRoute(page: TodoEditRoute.page),
          AutoRoute(page: TodoCreateRoute.page),
        ],
      ),
      CustomRoute(
        page: SplashRoute.page,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      ),
      CustomRoute(
        page: ErrorRoute.page,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      ),
      AdminUtilsModule.route,
    ];
  }
}

/// A [ChangeNotifier] that merges multiple [ChangeNotifier]s into one.
/// Each time one of the merged [ChangeNotifier]s changes, this [ChangeNotifier]
/// will also notify its listeners.
class _MergeChangeNotifier extends ChangeNotifier {
  _MergeChangeNotifier(List<ChangeNotifier> changeNotifiers)
      : _changeNotifiers = changeNotifiers {
    for (final changeNotifier in _changeNotifiers) {
      changeNotifier.addListener(notifyListeners);
    }
  }

  final List<ChangeNotifier> _changeNotifiers;

  @override
  void dispose() {
    for (final changeNotifier in _changeNotifiers) {
      changeNotifier.removeListener(notifyListeners);
    }
    super.dispose();
  }
}
