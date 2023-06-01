// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:admin_utils/src/router/pages/admin_page.dart' as _i2;
import 'package:admin_utils/src/router/pages/drift_db_page.dart' as _i1;
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:drift/drift.dart' as _i5;
import 'package:flutter/material.dart' as _i4;

abstract class $AdminUtilsModule extends _i3.AutoRouterModule {
  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    DriftDbRoute.name: (routeData) {
      final args = routeData.argsAs<DriftDbRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DriftDbPage(
          key: args.key,
          database: args.database,
        ),
      );
    },
    AdminRoute.name: (routeData) {
      final args = routeData.argsAs<AdminRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AdminPage(
          key: args.key,
          database: args.database,
          additionalActions: args.additionalActions,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.DriftDbPage]
class DriftDbRoute extends _i3.PageRouteInfo<DriftDbRouteArgs> {
  DriftDbRoute({
    _i4.Key? key,
    required _i5.GeneratedDatabase database,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          DriftDbRoute.name,
          args: DriftDbRouteArgs(
            key: key,
            database: database,
          ),
          initialChildren: children,
        );

  static const String name = 'DriftDbRoute';

  static const _i3.PageInfo<DriftDbRouteArgs> page =
      _i3.PageInfo<DriftDbRouteArgs>(name);
}

class DriftDbRouteArgs {
  const DriftDbRouteArgs({
    this.key,
    required this.database,
  });

  final _i4.Key? key;

  final _i5.GeneratedDatabase database;

  @override
  String toString() {
    return 'DriftDbRouteArgs{key: $key, database: $database}';
  }
}

/// generated route for
/// [_i2.AdminPage]
class AdminRoute extends _i3.PageRouteInfo<AdminRouteArgs> {
  AdminRoute({
    _i4.Key? key,
    required _i5.GeneratedDatabase database,
    required List<_i4.Widget> additionalActions,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          AdminRoute.name,
          args: AdminRouteArgs(
            key: key,
            database: database,
            additionalActions: additionalActions,
          ),
          initialChildren: children,
        );

  static const String name = 'AdminRoute';

  static const _i3.PageInfo<AdminRouteArgs> page =
      _i3.PageInfo<AdminRouteArgs>(name);
}

class AdminRouteArgs {
  const AdminRouteArgs({
    this.key,
    required this.database,
    required this.additionalActions,
  });

  final _i4.Key? key;

  final _i5.GeneratedDatabase database;

  final List<_i4.Widget> additionalActions;

  @override
  String toString() {
    return 'AdminRouteArgs{key: $key, database: $database, additionalActions: $additionalActions}';
  }
}
