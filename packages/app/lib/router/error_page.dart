import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// {@template error_page}
/// A generic error page that is used as a fallback when no specific error
/// handling is implemented or possible.
/// {@endtemplate}
@RoutePage()
class ErrorPage extends StatelessWidget {
  /// {@macro error_page}
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO
    return const Placeholder();
  }
}
