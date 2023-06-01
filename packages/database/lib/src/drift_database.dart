import 'dart:io';

import 'package:database/src/daos/sync/last_synced_dao_impl.dart';
import 'package:database/src/daos/sync/sync_dao_impl.dart';
import 'package:database/src/daos/todo/todo_dao_impl.dart';
import 'package:database/src/tables/last_synced_table.dart';
import 'package:database/src/tables/sync_table.dart';
import 'package:database/src/tables/todo_table.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sync/sync.dart';

part 'drift_database.g.dart';

// insert tables and daos here
@DriftDatabase(tables: [
  TodoTable,
  SyncTable,
  LastSyncedTable,
], daos: [
  TodoDaoImpl,
  SyncDaoImpl,
  LastSyncedDaoImpl,
])
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
      // beforeOpen: (openingDetails) async {
      //   if (kDebugMode) {
      //     final m = Migrator(this);

      //     for (final table in allTables) {
      //       await m.deleteTable(table.actualTableName);
      //       await m.createTable(table);
      //     }
      //   }
      // },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();

    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file, logStatements: true);
  });
}
