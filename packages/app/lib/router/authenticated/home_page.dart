import 'package:app/router/router.dart';
import 'package:auth/auth.dart';
import 'package:auto_route/auto_route.dart';
import 'package:connectivity_checker/connectivity_checker.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:sync/sync.dart';

/// {@template sign_in_page}
/// The page that is shown when the user is authenticated. This page is
/// responsible for showing the menu of the app and the navigation to sub pages
/// {@endtemplate}
@RoutePage()
class HomePage extends HookConsumerWidget {
  /// {@macro sign_in_page}
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syncController = ref.watch(syncControllerProvider);

    useEffect(() {
      final connectivitySubscription =
          ConnectivityWrapper.instance.onStatusChange.listen((status) {
        if (status == ConnectivityStatus.CONNECTED) {
          syncController.pushChangesToRemote().run();
        }
      });

      return connectivitySubscription.cancel;
    }, []);

    return AutoTabsScaffold(
      appBarBuilder: (context, tabsRouter) {
        return AppBar(
          title: Text(
            context
                .translate(tabsRouter.activeIndex == 0 ? 'Todos' : 'Overview'),
          ),
        );
      },
      homeIndex: 0,
      routes: const [
        TodoRoute(),
        OverviewRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.09),
                blurRadius: 3,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              if (index != 2) {
                tabsRouter.setActiveIndex(index);
              } else {
                ref.read(authRepositoryProvider).signOut().run();
              }
            },
            type: BottomNavigationBarType.fixed,
            enableFeedback: true,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.today_outlined),
                label: 'Todos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.view_list_outlined),
                label: 'Overview',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.logout_outlined),
                label: 'Ausloggen',
              ),
            ],
          ),
        );
      },
    );
  }
}
