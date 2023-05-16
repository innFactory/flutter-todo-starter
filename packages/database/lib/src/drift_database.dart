import 'dart:io';

import 'package:database/src/daos/todo/todo_dao_impl.dart';
import 'package:database/src/tables/todo_table.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sync/sync.dart';

part 'drift_database.g.dart';

// insert tables and daos here
@DriftDatabase(tables: [TodoTable], daos: [TodoDaoImpl])
class DriftLocalDatabase extends _$DriftLocalDatabase {
  DriftLocalDatabase([QueryExecutor? executor])
      : super(executor ?? _openConnection());

  // you should bump this number whenever you change or add a table definition.
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: (m, from, to) async {
        // disable foreign_keys before migrations
        await customStatement('PRAGMA foreign_keys = OFF');

        await transaction(() async {
          // put your migration logic here
        });

        // Assert that the schema is valid after migrations
        if (kDebugMode) {
          final wrongForeignKeys =
              await customSelect('PRAGMA foreign_key_check').get();
          assert(
            wrongForeignKeys.isEmpty,
            '${wrongForeignKeys.map((e) => e.data)}',
          );
        }
      },
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }
}

LazyDatabase _openConnection() {
  // const String schemaVersionKey = 'isar_schema_version';
  // final int currentSchemaVersion = DriftLocalDatabase
  //().schemaVersion;

  return LazyDatabase(() async {
    // final prefs = awa`it SharedPreferences.getInstance();
    // final schemaVersion = prefs.getInt(schemaVersionKey) ?? 0;
    final dbFolder = await getApplicationDocumentsDirectory();

    // if (schemaVersion < currentSchemaVersion) {
    //   logI(
    //     'Local database schema version is $schemaVersion, but '
    //     '$currentSchemaVersion is required. Clearing local database.',
    //   );
    //   await File(p.join(dbFolder.path, 'db.sqlite')).delete(recursive: true);
    //   await prefs.setInt(schemaVersionKey, currentSchemaVersion);
    // }

    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file, logStatements: true);
  });
}
