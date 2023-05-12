import 'package:database/src/data/sync_log/sync_log_dao.dart';
import 'package:database/src/isar/isar.dart';
import 'package:database/src/models/local_sync_log.dart';

class SyncLogDaoImpl extends IsarDao<LocalSyncLog> implements SyncLogDao {
  SyncLogDaoImpl({super.isar});
}
