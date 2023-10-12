import 'package:app/auth/view/sign_in_form_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// {@template sign_in_page}
/// The page that is shown when the user is not authenticated. This page is
/// responsible for showing the login form and handling the authentication
/// process.
/// {@endtemplate}
@RoutePage()
class SignInPage extends StatelessWidget {
  /// {@macro sign_in_page}
  const SignInPage({super.key, required this.onLoginSuccess});

  final VoidCallback onLoginSuccess;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.translate('sign_in'),
        ),
      ),
      body: SignInFormView(onLoginSuccess: onLoginSuccess),
    );
  }
}
