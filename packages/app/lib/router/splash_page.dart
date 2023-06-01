import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// {@template splash_page}
/// The page that is shown when the app is still loading the initial state.
/// This page is responsible for showing the splash screen.
/// {@endtemplate}
@RoutePage()
class SplashPage extends StatelessWidget {
  /// {@macro splash_page}
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(
          size: MediaQuery.of(context).size.shortestSide * 0.4,
        ),
      ),
    );
  }
}
