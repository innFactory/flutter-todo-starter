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
  TaskEither<Failure, LastSyncedEntity> createOrUpdate(
    LastSyncedEntity lastSynced,
  ) {
    return runTransaction(
      () => transaction(
        () async {
          return into(tableInfo).insertReturning(
            LastSyncedMapper.toLocal(lastSynced),
            mode: InsertMode.insertOrReplace,
          );
        },
      ),
    ).map(LastSyncedMapper.fromLocal);
  }

  @override
  TaskEither<Failure, LastSyncedEntity> getLastSyncEntityById(
    int localId,
  ) {
    return runTransaction(
      () => transaction(
        () async {
          final entity = await (select(tableInfo)
                ..where((tbl) => tbl.localId.equals(localId)))
              .getSingle();

          return entity;
        },
      ),
    ).map(LastSyncedMapper.fromLocal);
  }

  @override
  TaskEither<Failure, Unit> setLastSyncedTimestampForSyncEntityType(
    SyncEntityType entityType,
  ) {
    return runTransaction(
      () => transaction(
        () async {
          final entity = await (select(tableInfo)
                ..where((tbl) => tbl.entityType.equals(entityType.name)))
              .getSingleOrNull();

          final updatedEntity = entity?.let(
                (p0) => p0.copyWith(
                  lastSyncedAt: Value(DateTime.now()),
                ),
              ) ??
              LastSyncedMapper.toLocal(LastSyncedEntity.empty(
                entityType,
                DateTime.now(),
              ));

          final lastSyncedLocalId =
              await into(tableInfo).insertOnConflictUpdate(updatedEntity);

          return lastSyncedLocalId;
        },
      ),
    ).map((_) => unit);
  }

  @override
  TaskEither<Failure, List<LastSyncedEntity>> getLastSyncedTimestamps() {
    return runTransaction(
      () => transaction(
        () async {
          return tableInfo.select().get();
        },
      ),
    ).map(
      (r) => r.map(LastSyncedMapper.fromLocal).toList(),
    );
  }

  @override
  TaskEither<Failure, Unit> deleteById(int lastSyncedId) {
    return runTransaction(
      () => transaction(
        () async {
          await (delete(tableInfo)
                ..where((t) => t.localId.isValue(lastSyncedId)))
              .go();

          return unit;
        },
      ),
    );
  }

  TableInfo<LastSyncedTable, LocalLastSynced> get tableInfo =>
      attachedDatabase.lastSyncedTable;

  @override
  TaskEither<Failure, LastSyncedEntity> getBySyncEntityType(
    SyncEntityType entityType,
  ) {
    return runTransaction(
      () => transaction(
        () async {
          return (select(tableInfo)
                ..where((tbl) => tbl.entityType.equals(entityType.name)))
              .getSingle();
        },
      ),
    ).map(LastSyncedMapper.fromLocal);
  }
}
