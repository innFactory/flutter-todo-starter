import 'package:auto_route/auto_route.dart';
import 'package:drift/drift.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DriftDbPage extends StatelessWidget {
  const DriftDbPage({
    super.key,
    required this.database,
  });

  final GeneratedDatabase database;

  @override
  Widget build(BuildContext context) {
    return DriftDbViewer(database);
  }
}
