import 'package:drift/drift.dart';

@DataClassName('LocalLastSynced')
class LastSyncedTable extends Table {
  @override
  String get tableName => 'last_synced';

  IntColumn get localId => integer().autoIncrement()();
  DateTimeColumn get lastSyncedAt => dateTime().nullable()();
  TextColumn get syncIdentifier => text().unique()();
}
