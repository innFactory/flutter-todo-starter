import 'package:core/core.dart';
import 'package:database/src/drift_database.dart';

final driftDatabaseProvider = Provider<DriftLocalDatabase>(
  (ref) {
    return DriftLocalDatabase();
  },
);
