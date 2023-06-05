import 'dart:math';

import 'package:admin_utils/admin_utils.dart';
import 'package:auto_route/auto_route.dart';
import 'package:drift/drift.dart' as drift;
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class AdminPage extends HookWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    final groups = AdminProvider.of(context).groups;

    final loadingIndex = useState<int?>(null);
    final largestGroupSize = groups.map((g) => g.actions.length).reduce(max);

    Future<void> onTap(int index, AdminAction action) async {
      loadingIndex.value = index;

      try {
        if (action.requiresConfirmation) {
          final confirmed = await _ConfirmationDialog.show(
            context,
            action.title,
          );

          if (!confirmed) {
            return;
          }
        }

        if (context.mounted) {
          await action.action(context);
        }
      } finally {
        loadingIndex.value = null;
      }
    }

    return WillPopScope(
      onWillPop: loadingIndex.value != null ? () async => false : null,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Admin'),
        ),
        body: ListView.separated(
          itemCount: groups.length,
          itemBuilder: (context, index) {
            final group = groups[index];

            return _AdminGroupTile(
              group: group,
              loadingIndex: loadingIndex.value,
              onTap: (a) =>
                  onTap(index * largestGroupSize + a, group.actions[a]),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    );
  }
}

class DriftDatabaseAdminGroup extends AdminGroup {
  DriftDatabaseAdminGroup(drift.GeneratedDatabase db)
      : super(
          title: 'Drift Database',
          actions: [
            DriftDatabaseViewerAdminAction(db),
            DriftClearDatabaseAdminAction(db),
          ],
        );
}

class DriftDatabaseViewerAdminAction extends AdminAction {
  DriftDatabaseViewerAdminAction(drift.GeneratedDatabase db)
      : super(
          title: 'View Database',
          action: (context) => context.pushRoute(DriftDbRoute(database: db)),
        );
}

class DriftClearDatabaseAdminAction extends AdminAction {
  DriftClearDatabaseAdminAction(drift.GeneratedDatabase db)
      : super(
          title: 'Clear Database',
          action: (context) => _clearDatabase(db),
          requiresConfirmation: true,
          trailing: const Icon(Icons.delete),
        );

  static Future<void> _clearDatabase(drift.GeneratedDatabase db) async {
    await db.transaction(() async {
      await db.customStatement('PRAGMA foreign_keys = OFF;');
      await Future.wait(db.allTables.map((t) => db.delete(t).go()));
      await db.customStatement('PRAGMA foreign_keys = ON;');
    });
  }
}

class AdminGroup extends Equatable {
  const AdminGroup({required this.title, required this.actions});

  final String title;
  final List<AdminAction> actions;

  @override
  List<Object?> get props => [title, actions];
}

class AdminAction extends Equatable {
  const AdminAction({
    required this.title,
    required this.action,
    this.requiresConfirmation = false,
    this.trailing = const Icon(Icons.chevron_right),
  });

  final String title;
  final Future<void> Function(BuildContext context) action;
  final bool requiresConfirmation;
  final Icon trailing;

  @override
  List<Object?> get props => [title, action, requiresConfirmation];
}

class _AdminGroupTile extends StatelessWidget {
  const _AdminGroupTile({
    required this.group,
    required this.loadingIndex,
    required this.onTap,
  });

  final AdminGroup group;
  final int? loadingIndex;
  final Future<void> Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            group.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        for (int i = 0; i < group.actions.length; i++)
          _AdminActionTile(
            group.actions[i],
            isLoading: i == loadingIndex,
            isDisabled: loadingIndex != null,
            onTap: () => onTap(i),
          ),
      ],
      // group.actions.map((a) => ).toList(),
    );
  }
}

class _AdminActionTile extends StatelessWidget {
  const _AdminActionTile(
    this.action, {
    required this.onTap,
    required this.isLoading,
    required this.isDisabled,
  });

  final AdminAction action;
  final VoidCallback onTap;
  final bool isLoading;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(action.title),
      trailing: isLoading
          ? const SizedBox(
              width: 16,
              height: 16,
              child: FittedBox(
                child: CircularProgressIndicator.adaptive(),
              ),
            )
          : action.trailing,
      onTap: isLoading || isDisabled ? null : onTap,
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
          child: const Text('Confirm'),
        ),
      ],
    );
  }
}
