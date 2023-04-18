import 'package:flutter/material.dart';

/// {@template environment}
/// Environment configuration object which contains global configuration values
/// for the app.
/// {@endtemplate}
enum Environment {
  development(
    appTitle: 'Todo Factory [DEV]',
    apiBaseUrl: '',
    banner: EnvironmentBanner(
      text: 'DEV',
      color: Colors.green,
    ),
  ),
  staging(
    appTitle: 'Todo Factory [STG]',
    apiBaseUrl: '',
    banner: EnvironmentBanner(
      text: 'STG',
      color: Colors.blue,
    ),
  ),
  production(
    appTitle: 'Todo Factory',
    apiBaseUrl: '',
  );

  /// {@macro environment}
  const Environment({
    required this.appTitle,
    required this.apiBaseUrl,
    this.banner,
  });

  /// The default environment to use as a fallback.
  static Environment defaultEnvironment = Environment.production;

  /// The current active environment. Should be set before the app is run,
  /// changing it later will not re-build the app.
  static Environment current = defaultEnvironment;

  final String appTitle;
  final EnvironmentBanner? banner;

  final String apiBaseUrl;
}

extension EnvironmentX on Environment? {
  /// The Environment or [defaultEnvironment] if the current environment is null.
  Environment get getOrDefault => this ?? Environment.defaultEnvironment;
}

class EnvironmentBanner {
  const EnvironmentBanner({
    required this.text,
    required this.color,
  });

  final String text;
  final Color color;
}
