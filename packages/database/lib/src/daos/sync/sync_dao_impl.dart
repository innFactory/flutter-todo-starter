import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:database/src/common/utils.dart';
import 'package:database/src/daos/sync/sync_dao.dart';
import 'package:database/src/tables/sync_table.dart';

part 'sync_dao_impl.g.dart';

@DriftAccessor()
class SyncDaoImpl extends DatabaseAccessor<DriftLocalDatabase>
    with _$SyncDaoImplMixin
    implements SyncDao {
  SyncDaoImpl(super.attachedDatabase);

  @override
  TaskEither<Failure, LocalSync> createOrUpdate(SyncTableCompanion sync) {
    return runTransaction(
      () => transaction(
        () async {
          final syncLocalId = await into(tableInfo).insertOnConflictUpdate(
            sync.copyWith(executedAt: Value(DateTime.now())),
          );

          final createdOrUpdatedSync = (select(tableInfo)
                ..where((tbl) => tbl.localId.equals(syncLocalId)))
              .getSingle();

          return createdOrUpdatedSync;
        },
      ),
    );
  }

  @override
  TaskEither<Failure, List<LocalSync>> getSyncEntities() {
    return runTransaction(
      () => transaction(
        () async {
          return tableInfo.select().get();
        },
      ),
    );
  }

  @override
  TaskEither<Failure, Unit> deleteById(int syncId) {
    return runTransaction(
      () => transaction(
        () async {
          await (delete(tableInfo)..where((t) => t.localId.isValue(syncId)))
              .go();

          return unit;
        },
      ),
    );
  }

  @override
  TaskEither<Failure, int> deleteByEntityId(int localId) {
    return runTransaction(
      () => (delete(tableInfo)..where((tbl) => tbl.entityId.equals(localId)))
          .go(),
    );
  }

  TableInfo<SyncTable, LocalSync> get tableInfo => attachedDatabase.syncTable;
}
