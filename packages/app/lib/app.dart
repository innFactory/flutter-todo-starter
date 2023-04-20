import 'package:app/environment_provider.dart';
import 'package:app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart' hide TextDirection;
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// {@template app}
/// The root widget of the application. This widget is responsible for
/// handling the [Environment] loading state.
/// {@endtemplate}
class App extends ConsumerWidget {
  /// {@macro app}
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final env = ref.watch(environmentProvider);

    logD('Environment: ${env?.name}');

    if (env == null) {
      return MaterialApp(
        title: env.getOrDefault.appTitle,
        home: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return _App(key: ValueKey(env));
  }
}

class _App extends HookConsumerWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useMemoized(AppRouter.new);

    return MaterialApp.router(
      title: Environment.current.appTitle,
      locale: DevicePreview.locale(context),
      builder: <TransitionBuilder>[
        (context, child) {
          return DevicePreview.appBuilder(context, child);
        },
        if (Environment.current.banner != null)
          (context, child) {
            return Directionality(
              textDirection: TextDirection.ltr,
              child: Banner(
                location: BannerLocation.topStart,
                message: Environment.current.banner!.text,
                color: Environment.current.banner!.color,
                child: child,
              ),
            );
          },
      ].reduce((value, element) {
        return (context, child) {
          return value(
            context,
            element(context, child),
          );
        };
      }),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('de'),
        Locale('en'),
      ],
      routerDelegate: AutoRouterDelegate(
        router,
        navigatorObservers: () => [AutoRouteObserver()],
      ),
      routeInformationParser: router.defaultRouteParser(),
    );
  }
}
