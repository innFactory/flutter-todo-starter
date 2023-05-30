import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:database/src/common/utils.dart';
import 'package:database/src/tables/sync_table.dart';
import 'package:sync/sync.dart';

part 'sync_dao_impl.g.dart';

@DriftAccessor()
class SyncDaoImpl extends DatabaseAccessor<DriftLocalDatabase>
    with _$SyncDaoImplMixin
    implements SyncDao {
  SyncDaoImpl(super.attachedDatabase);

  @override
  TaskEither<Failure, SyncEntity> createOrUpdate(SyncEntity entity) {
    return runTransaction(
      () => transaction(
        () async {
          return into(tableInfo).insertReturning(
            SyncMapper.toLocal(entity).copyWith(
              entityModifiedAt: Value(DateTime.now()),
            ),
            mode: InsertMode.insertOrReplace,
          );
        },
      ),
    ).map(SyncMapper.fromLocal);
  }

  @override
  TaskEither<Failure, List<SyncEntity>> getSyncEntities([
    List<SyncEntityType> syncEntityTypes = SyncEntityType.values,
  ]) {
    return runTransaction(
      () => transaction(
        () async {
          return (select(tableInfo)
                ..where(
                  (tbl) => tbl.entityType.isIn(
                    syncEntityTypes.map((e) => e.name),
                  ),
                ))
              .get();
        },
      ),
    ).map((r) => r.map(SyncMapper.fromLocal).toList());
  }

  @override
  TaskEither<Failure, SyncEntity> getSyncEntityById(SyncEntityId localId) {
    return runTransaction(
      () => transaction(
        () async {
          return (select(tableInfo)
                ..where((tbl) => tbl.localId.equals(localId.value)))
              .getSingle();
        },
      ),
    ).map((a) {
      return SyncMapper.fromLocal(a);
    });
  }

  @override
  TaskEither<Failure, Unit> deleteById(SyncEntityId syncId) {
    return runTransaction(
      () => transaction(
        () async {
          await (delete(tableInfo)
                ..where((t) => t.localId.isValue(syncId.value)))
              .go();

          return unit;
        },
      ),
    );
  }

  @override
  Stream<List<SyncEntity>> watchSyncEntities() {
    return tableInfo.select().watch().map(
          (event) => event.map(SyncMapper.fromLocal).toList(),
        );
  }

  TableInfo<SyncTable, LocalSync> get tableInfo => attachedDatabase.syncTable;
}
