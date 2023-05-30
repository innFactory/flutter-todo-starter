import 'package:drift/drift.dart';
import 'package:sync/sync.dart';

@DataClassName('LocalSync')
class SyncTable extends Table {
  @override
  String get tableName => 'sync';

  IntColumn get entityId => integer()();
  TextColumn get entityType => textEnum<SyncEntityType>()();
  DateTimeColumn get entityModifiedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>>? get primaryKey => {entityId, entityType};
}
