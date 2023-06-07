import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:sync/sync.dart';
import 'package:todo/todo.dart';

@RoutePage()
class SyncOverviewPage extends ConsumerWidget {
  const SyncOverviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syncEntities = ref.watch(syncEntityStreamProvider).valueOrNull ?? [];
    final todos = ref.watch(todoStreamProvider).valueOrNull ?? [];
    final format = DateFormat('dd.MM.yyyy HH:mm');

    final todosWithOpenSync = syncEntities
        .where((element) => element.entityType == SyncEntityType.todo)
        .map(
          (e) => (
            e,
            todos.firstWhereOrNull(
                (element) => element.localId?.value == e.entityLocalId)
          ),
        )
        .where((element) => element.$2 != null);

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          if (todosWithOpenSync.isEmpty)
            const Text(
              'Keine offenen Synchronisierungen',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          if (todosWithOpenSync.isNotEmpty) ...[
            const Text(
              'Todos:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            ListView.builder(
              itemCount: todosWithOpenSync.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final (syncEntity, todo) = todosWithOpenSync.elementAt(index);

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(todo!.title),
                    leading: todo.isCompleted
                        ? const Icon(Icons.check)
                        : const Icon(Icons.check_box_outline_blank),
                    tileColor: syncEntity.revertChanges
                        ? Colors.orange
                        : syncEntity.errorCode != null
                            ? Colors.red.withOpacity(0.5)
                            : Colors.grey,
                    subtitle: Text(todo.description),
                    trailing: syncEntity.revertChanges
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Wird verworfen'),
                              IconButton(
                                iconSize: 20,
                                padding: EdgeInsets.zero,
                                onPressed: () => ref
                                    .read(syncControllerProvider)
                                    .toggleRevertChange(syncEntity)
                                    .run(),
                                icon: const Icon(Icons.undo),
                              ),
                            ],
                          )
                        : syncEntity.errorCode != null
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Fehler: ${syncEntity.errorCode!}'),
                                      Text(
                                          format.format(syncEntity.modifiedAt)),
                                    ],
                                  ),
                                  IconButton(
                                    iconSize: 20,
                                    padding: EdgeInsets.zero,
                                    onPressed: () => ref
                                        .read(syncControllerProvider)
                                        .retryChange(syncEntity)
                                        .run(),
                                    icon: const Icon(Icons.refresh),
                                  ),
                                  IconButton(
                                    iconSize: 20,
                                    style: const ButtonStyle(
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    padding: EdgeInsets.zero,
                                    onPressed: () => ref
                                        .read(syncControllerProvider)
                                        .toggleRevertChange(syncEntity)
                                        .run(),
                                    icon: const Icon(Icons.delete),
                                  ),
                                ],
                              )
                            : Text(format.format(syncEntity.modifiedAt)),
                  ),
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}
