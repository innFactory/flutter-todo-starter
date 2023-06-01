import 'package:admin_utils/src/router/router.gm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';

@RoutePage()
class AdminPage extends StatelessWidget {
  const AdminPage({
    super.key,
    required this.database,
    required this.additionalActions,
  });

  final drift.GeneratedDatabase database;
  final List<Widget> additionalActions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Seite'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () =>
                    context.pushRoute(DriftDbRoute(database: database)),
                child: const Text('Datenbank Inspektor'),
              ),
            ),
            ...additionalActions,
          ],
        ),
      ),
    );
  }
}
