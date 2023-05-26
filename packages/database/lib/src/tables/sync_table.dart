import 'package:drift/drift.dart';
import 'package:sync/sync.dart';

@DataClassName('LocalSync')
class SyncTable extends Table {
  @override
  String get tableName => 'sync';

  IntColumn get localId => integer().autoIncrement()();

  IntColumn get entityId => integer()();
  DateTimeColumn get entityModifiedAt =>
      dateTime().withDefault(currentDateAndTime)();
  TextColumn get localSyncStatus => text()
      .map(const EnumNameConverter(SyncStatus.values))
      .withDefault(Constant(SyncStatus.created.name))();
  TextColumn get entityType => textEnum<SyncEntityType>()();
}
