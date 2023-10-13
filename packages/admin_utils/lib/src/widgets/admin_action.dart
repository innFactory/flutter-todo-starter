import 'dart:async';

import 'package:admin_utils/src/admin/admin_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AdminAction extends HookConsumerWidget {
  const AdminAction({
    super.key,
    required this.title,
    required this.onTap,
    this.requiresConfirmation = false,
    this.trailing = const Icon(Icons.chevron_right),
  });

  final String title;
  final FutureOr<void> Function() onTap;
  final bool requiresConfirmation;
  final Widget trailing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    final globalLoading = ref.watch(adminLoadingProvider.notifier);

    Future<void> onTap() async {
      try {
        if (requiresConfirmation) {
          final confirmed = await _ConfirmationDialog.show(
            context,
            title,
          );

          if (!confirmed) {
            return;
          }
        }

        isLoading.value = true;
        globalLoading.state = true;
        await this.onTap();
      } finally {
        if (context.mounted) {
          isLoading.value = false;
        }
        // Give the loading dialog time to show up.
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          globalLoading.state = false;
        });
      }
    }

    return ListTile(
      title: Text(title),
      trailing: isLoading.value
          ? SizedBox.square(
              dimension: IconTheme.of(context).size,
              child: const FittedBox(
                child: CircularProgressIndicator.adaptive(),
              ),
            )
          : trailing,
      onTap: onTap,
    );
  }
}

class _ConfirmationDialog extends StatelessWidget {
  const _ConfirmationDialog(this.title);

  final String title;

  static Future<bool> show(BuildContext context, String title) {
    return showDialog<bool>(
      context: context,
      builder: (_) => _ConfirmationDialog(title),
    ).then((value) => value ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: const Text(
        'Are you sure you want to perform the selected action?',
      ),
      actions: [
        TextButton(
          onPressed: () => context.popRoute(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => context.popRoute(true),
          child: Text(
            'Confirm',
            style: TextStyle(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        ),
      ],
    );
  }
}
