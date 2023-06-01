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
      database: attachedDatabase,
      () async {
        return into(tableInfo).insertReturning(
          SyncMapper.toLocal(entity).copyWith(
            entityModifiedAt: Value(DateTime.now()),
          ),
          mode: InsertMode.insertOrReplace,
        );
      },
    ).map(SyncMapper.fromLocal);
  }

  @override
  TaskEither<Failure, List<SyncEntity>> getSyncEntities() {
    return runTransaction(
      database: attachedDatabase,
      () async {
        return select(tableInfo).get();
      },
    ).map((r) => r.map(SyncMapper.fromLocal).toList());
  }

  @override
  TaskEither<Failure, Unit> deleteSyncEntity(
    SyncEntityType type,
    int localId,
  ) {
    return runTransaction(
      database: attachedDatabase,
      () async {
        await (delete(tableInfo)
              ..where((t) =>
                  t.entityType.isValue(type.name) &
                  t.entityId.isValue(localId)))
            .go();

        return unit;
      },
    );
  }

  @override
  Stream<List<SyncEntity>> watchSyncEntities() {
    return tableInfo.select().watch().map(
          (event) => event.map(SyncMapper.fromLocal).toList(),
        );
  }

  TableInfo<SyncTable, LocalSync> get tableInfo => attachedDatabase.syncTable;

  @override
  TaskEither<Failure, SyncEntity> getSyncEntity(
    SyncEntityType type,
    int localId,
  ) {
    return runTransaction(
      database: attachedDatabase,
      () async => (tableInfo.select()
            ..where((t) =>
                t.entityType.isValue(type.name) & t.entityId.isValue(localId)))
          .getSingle(),
    ).map(SyncMapper.fromLocal);
  }
}
