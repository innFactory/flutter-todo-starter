import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// {@template root_router}
/// The root router for the entire app. This is the parent router for all other
/// routers.
///
/// This router is responsible for loading all relevant data before showing the
/// relevant sub-router.
/// {@endtemplate}
@RoutePage()
class RootRouterPage extends StatelessWidget {
  /// {@macro root_router}
  const RootRouterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
