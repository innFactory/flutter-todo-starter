// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:admin_utils/src/admin/admin_page.dart' as _i1;
import 'package:admin_utils/src/admin/admin_router_page.dart' as _i2;
import 'package:admin_utils/src/drift/drift_admin_page.dart' as _i3;
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:drift/drift.dart' as _i6;
import 'package:flutter/material.dart' as _i5;

abstract class $AdminUtilsModule extends _i4.AutoRouterModule {
  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    AdminRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AdminPage(),
      );
    },
    AdminRouterRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AdminRouterPage(),
      );
    },
    DriftDbRoute.name: (routeData) {
      final args = routeData.argsAs<DriftDbRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.DriftDbPage(
          key: args.key,
          database: args.database,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AdminPage]
class AdminRoute extends _i4.PageRouteInfo<void> {
  const AdminRoute({List<_i4.PageRouteInfo>? children})
      : super(
          AdminRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AdminRouterPage]
class AdminRouterRoute extends _i4.PageRouteInfo<void> {
  const AdminRouterRoute({List<_i4.PageRouteInfo>? children})
      : super(
          AdminRouterRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminRouterRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DriftDbPage]
class DriftDbRoute extends _i4.PageRouteInfo<DriftDbRouteArgs> {
  DriftDbRoute({
    _i5.Key? key,
    required _i6.GeneratedDatabase database,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          DriftDbRoute.name,
          args: DriftDbRouteArgs(
            key: key,
            database: database,
          ),
          initialChildren: children,
        );

  static const String name = 'DriftDbRoute';

  static const _i4.PageInfo<DriftDbRouteArgs> page =
      _i4.PageInfo<DriftDbRouteArgs>(name);
}

class DriftDbRouteArgs {
  const DriftDbRouteArgs({
    this.key,
    required this.database,
  });

  final _i5.Key? key;

  final _i6.GeneratedDatabase database;

  @override
  String toString() {
    return 'DriftDbRouteArgs{key: $key, database: $database}';
  }
}
