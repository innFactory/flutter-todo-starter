import 'package:flutter/material.dart';

/// {@template environment}
/// Environment configuration object which contains global configuration values
/// for the app.
/// {@endtemplate}
enum Environment {
  /// The development environment.
  development(
    appTitle: 'Todo Factory [DEV]',
    apiBaseUrl: 'http://10.101.0.165:9000',
    banner: EnvironmentBanner(
      text: 'DEV',
      color: Colors.green,
    ),
  ),

  /// The staging environment.
  staging(
    appTitle: 'Todo Factory [STG]',
    apiBaseUrl: '',
    banner: EnvironmentBanner(
      text: 'STG',
      color: Colors.blue,
    ),
  ),

  /// The production environment.
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

  /// The app title, usually shown in the operating systems app switcher or the
  /// browser tab title.
  final String appTitle;

  /// Optional banner to show on the top left corner of the app.
  final EnvironmentBanner? banner;

  /// The base URL of the API.
  final String apiBaseUrl;
}

/// Extension methods for the [Environment] class.
extension EnvironmentX on Environment? {
  /// The Environment or [defaultEnvironment] if the current environment is null.
  Environment get getOrDefault => this ?? Environment.defaultEnvironment;
}

/// {@template environment_banner}
/// Configuration object for showing a banner on the top left corner of the app.
/// {@endtemplate}
class EnvironmentBanner {
  /// {@macro environment_banner}
  const EnvironmentBanner({
    required this.text,
    required this.color,
  });

  /// The text to show on the banner.
  final String text;

  /// The background color of the banner.
  final Color color;
}
