import 'package:drift/drift.dart';
import 'package:sync/sync.dart';

@DataClassName('LocalTodo')
class TodoTable extends Table {
  @override
  String get tableName => 'todo';

  IntColumn get localId => integer().autoIncrement()();
  TextColumn get remoteId => text().nullable().unique()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  BoolColumn get isCompleted => boolean()();
  IntColumn get localParentId => integer().nullable()();
  TextColumn get remoteParentId => text().nullable()();
  TextColumn get tags => text().map(const TagsConverter())();
  DateTimeColumn get localCreatedAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get localUpdatedAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
  TextColumn get localSyncStatus =>
      textEnum<SyncStatus>().withDefault(Constant(SyncStatus.modified.name))();
}

class TagsConverter extends TypeConverter<List<String>, String> {
  const TagsConverter();

  @override
  List<String> fromSql(String fromDb) => fromDb.split(',');

  @override
  String toSql(List<String> value) => value.join(',');
}
