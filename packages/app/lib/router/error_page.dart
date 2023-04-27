import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// A generic error page that is used as a fallback when no specific error
/// handling is implemented or possible.
@RoutePage()
class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    this.error,
  });

  final Object? error;

  @override
  Widget build(BuildContext context) {
    // TODO
    return const Placeholder();
  }
}
