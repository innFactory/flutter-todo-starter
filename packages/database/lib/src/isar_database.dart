import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IsarDatabase {
  static const String _schemaVersionKey = 'isar_schema_version';
  static const int _currentSchemaVersion = 1;
  static const int autoIncrement = Isar.autoIncrement;

  Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();

    await Isar.open(
      [
        LocalSyncLogSchema,
        LocalTodoSchema,
        // Add all schemas here
      ],
      directory: dir.path,
    );

    // await clear();

    final prefs = await SharedPreferences.getInstance();
    final schemaVersion = prefs.getInt(_schemaVersionKey) ?? 0;

    if (schemaVersion < _currentSchemaVersion) {
      logI(
        'Local database schema version is $schemaVersion, but '
        '$_currentSchemaVersion is required. Clearing local database.',
      );
      await clear();
      await prefs.setInt(_schemaVersionKey, _currentSchemaVersion);
    }
  }

  Future<void> clear() async {
    final isar = Isar.getInstance()!;
    await isar.writeTxn(() => isar.clear());

    logI('Local database cleared');
  }
}
