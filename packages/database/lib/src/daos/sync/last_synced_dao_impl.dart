import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:database/src/common/utils.dart';
import 'package:database/src/tables/last_synced_table.dart';
import 'package:sync/sync.dart';

part 'last_synced_dao_impl.g.dart';

@DriftAccessor()
class LastSyncedDaoImpl extends DatabaseAccessor<DriftLocalDatabase>
    with _$LastSyncedDaoImplMixin
    implements LastSyncedDao {
  LastSyncedDaoImpl(super.attachedDatabase);

  @override
  TaskEither<Failure, Unit> setLastSyncedTimestamp(
    SyncIdentifier syncIdentifier,
  ) {
    return runTransaction(
      database: attachedDatabase,
      () async {
        final entity = await (select(tableInfo)
              ..where((tbl) =>
                  tbl.syncIdentifier.equals(syncIdentifier.identifier)))
            .getSingleOrNull();

        final updatedEntity = entity?.let(
              (p0) => p0.copyWith(
                lastSyncedAt: Value(DateTime.now()),
              ),
            ) ??
            LastSyncedTableCompanion(
              syncIdentifier: Value(syncIdentifier.identifier),
              lastSyncedAt: Value(DateTime.now()),
            );

        final lastSyncedLocalId =
            await into(tableInfo).insertOnConflictUpdate(updatedEntity);

        return lastSyncedLocalId;
      },
    ).map((_) => unit);
  }

  @override
  TaskEither<Failure, List<LastSyncedEntity>> getLastSyncedTimestamps() {
    return runTransaction(
      database: attachedDatabase,
      () async {
        return tableInfo.select().get();
      },
    ).map(
      (r) => r.map(LastSyncedMapper.fromLocal).toList(),
    );
  }

  TableInfo<LastSyncedTable, LocalLastSynced> get tableInfo =>
      attachedDatabase.lastSyncedTable;

  @override
  TaskEither<Failure, LastSyncedEntity> getBySyncIdentifier(
    SyncIdentifier syncIdentifier,
  ) {
    return runTransaction(
      database: attachedDatabase,
      () async {
        return (select(tableInfo)
              ..where((tbl) =>
                  tbl.syncIdentifier.equals(syncIdentifier.identifier)))
            .getSingle();
      },
    ).map(LastSyncedMapper.fromLocal);
  }
}
