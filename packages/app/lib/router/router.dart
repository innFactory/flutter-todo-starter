import 'package:admin_utils/admin_utils.dart';
import 'package:app/router/auth/auth_router_page.dart';
import 'package:app/router/auth/sign_in_page.dart';
import 'package:app/router/authenticated/authenticated_router.dart';
import 'package:app/router/authenticated/home_page.dart';
import 'package:app/router/authenticated/overview_page.dart';
import 'package:app/router/authenticated/todo/todo_create_page.dart';
import 'package:app/router/authenticated/todo/todo_edit_page.dart';
import 'package:app/router/authenticated/todo/todo_page.dart';
import 'package:app/router/error_page.dart';
import 'package:app/router/root_router_page.dart';
import 'package:app/router/splash_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

part 'router.gr.dart';

/// The `auto_route` router for the app. All relevant routes for the app are
/// defined here.
@AutoRouterConfig(
  modules: [AdminUtilsModule],
)
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(
        page: RootRouterRoute.page,
        path: '/',
        children: [
          CustomRoute(
            page: SplashRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn,
          ),
          CustomRoute(
            page: ErrorRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn,
          ),
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
            transitionsBuilder: TransitionsBuilders.fadeIn,
            page: AuthenticatedRouter.page,
            children: [
              AutoRoute(
                page: HomeRoute.page,
                initial: true,
                children: [
                  AutoRoute(page: TodoRoute.page, initial: true),
                  AutoRoute(page: OverviewRoute.page),
                ],
              ),
              AutoRoute(page: TodoEditRoute.page),
              AutoRoute(page: TodoCreateRoute.page),
              AutoRoute(page: AdminRoute.page),
              AutoRoute(page: DriftDbRoute.page),
            ],
          ),
        ],
      ),
    ];
  }
}
