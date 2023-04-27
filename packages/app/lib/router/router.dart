import 'package:app/router/auth/auth_router_page.dart';
import 'package:app/router/auth/sign_in_page.dart';
import 'package:app/router/authenticated/authenticated_router.dart';
import 'package:app/router/error_page.dart';
import 'package:app/router/root_router_page.dart';
import 'package:app/router/splash_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

/// The `auto_route` router for the app. All relevant routes for the app are
/// defined here.
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(
        page: RootRouterRoute.page,
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
              AutoRoute(page: SignInRoute.page),
            ],
          ),
          CustomRoute(
            transitionsBuilder: TransitionsBuilders.fadeIn,
            page: AuthenticatedRouter.page,
            children: const [
              // CustomRoute(
              //   page: SplashPage,
              //   transitionsBuilder: TransitionsBuilders.fadeIn,
              // ),
              // CustomRoute(
              //   page: ErrorPage,
              //   transitionsBuilder: TransitionsBuilders.fadeIn,
              // ),
            ],
          ),
        ],
      ),
    ];
  }
}
