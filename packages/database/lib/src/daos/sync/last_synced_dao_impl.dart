import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:database/src/common/utils.dart';
import 'package:database/src/daos/sync/last_synced_dao.dart';
import 'package:database/src/tables/last_synced_table.dart';
import 'package:sync/sync.dart';

part 'last_synced_dao_impl.g.dart';

@DriftAccessor()
class LastSyncedDaoImpl extends DatabaseAccessor<DriftLocalDatabase>
    with _$LastSyncedDaoImplMixin
    implements LastSyncedDao {
  LastSyncedDaoImpl(super.attachedDatabase);

  @override
  TaskEither<Failure, LocalLastSynced> createOrUpdate(
      LastSyncedTableCompanion lastSynced) {
    return runTransaction(
      () => transaction(
        () async {
          final lastSyncedLocalId =
              await into(tableInfo).insertOnConflictUpdate(
            lastSynced.copyWith(lastSyncedAt: Value(DateTime.now())),
          );

          final createdOrUpdatedLastSynced = (select(tableInfo)
                ..where((tbl) => tbl.localId.equals(lastSyncedLocalId)))
              .getSingle();

          return createdOrUpdatedLastSynced;
        },
      ),
    );
  }

  @override
  TaskEither<Failure, List<LocalLastSynced>> getLastSyncedTimestamps() {
    return runTransaction(
      () => transaction(
        () async {
          return tableInfo.select().get();
        },
      ),
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
  TaskEither<Failure, LocalLastSynced> getBySyncStatus(SyncStatus status) {
    return runTransaction(
      () => transaction(
        () async {
          return (select(tableInfo)
                ..where((tbl) => tbl.entityType.equals(status.name)))
              .getSingle();
        },
      ),
    );
  }
}
