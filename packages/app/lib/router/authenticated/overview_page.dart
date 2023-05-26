import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:database/database.dart' as db;
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OverviewPage extends ConsumerWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final database = ref.watch(db.driftDatabaseProvider);

    return DriftDbViewer(database);
  }
}
