import 'dart:async';

import 'package:admin_utils/admin_utils.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final adminLoadingProvider = StateProvider((_) => false);

@RoutePage()
class AdminPage extends HookConsumerWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final children = AdminProvider.of(context).children;

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ref.read(adminLoadingProvider.notifier).state = true;

        // Wait to avoid the user immediately interacting with the UI since
        // it might have been opened by tapping fast repeatedly.
        // Without this unwanted interactions might happen.
        Future<void>.delayed(const Duration(milliseconds: 300)).then((_) {
          if (context.mounted) {
            ref.read(adminLoadingProvider.notifier).state = false;
          }
        });
      });

      return null;
    }, []);

    ref.listen(adminLoadingProvider, (previous, next) {
      if (next) {
        showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (_) => const _LoadingDialog(),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        leading: const AutoLeadingButton(),
        title: const Text('Admin'),
      ),
      body: ListView(children: children),
    );
  }
}

class _LoadingDialog extends ConsumerWidget {
  const _LoadingDialog();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      adminLoadingProvider,
      (previous, next) {
        if (!next) {
          Navigator.of(context).pop();
        }
      },
    );

    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
