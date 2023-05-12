import 'package:database/database.dart';
import 'package:database/src/data/sync_log/sync_log_dao_impl.dart';
import 'package:isar/isar.dart';

abstract class SyncLogDao implements Dao<LocalSyncLog> {
  factory SyncLogDao({Isar? isar}) = SyncLogDaoImpl;
}
