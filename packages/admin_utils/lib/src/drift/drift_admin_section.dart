import 'package:admin_utils/src/router.gm.dart';
import 'package:admin_utils/src/widgets/admin_action.dart';
import 'package:admin_utils/src/widgets/admin_group.dart';
import 'package:auto_route/auto_route.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';

class DriftAdminSection extends StatelessWidget {
  const DriftAdminSection(this.db, {super.key});

  final drift.GeneratedDatabase db;

  @override
  Widget build(BuildContext context) {
    return AdminGroup(
      title: 'Database',
      children: [
        AdminAction(
          title: 'View Database',
          onTap: () {
            context.pushRoute(DriftDbRoute(database: db));
          },
        ),
        AdminAction(
          title: 'Clear Database',
          onTap: () async {
            await db.transaction(() async {
              await db.customStatement('PRAGMA foreign_keys = OFF;');
              await Future.wait(db.allTables.map((t) => db.delete(t).go()));
              await db.customStatement('PRAGMA foreign_keys = ON;');
            });
          },
          requiresConfirmation: true,
          trailing: const Icon(Icons.delete),
        ),
      ],
    );
  }
}
