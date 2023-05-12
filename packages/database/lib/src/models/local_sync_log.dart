import 'package:core/core.dart';
import 'package:database/src/base/local_base.dart';
import 'package:database/src/isar/isar.dart';
import 'package:sync/sync.dart';

part 'local_sync_log.g.dart';

@collection
class LocalSyncLog extends LocalBase {
  @internal
  LocalSyncLog();

  LocalSyncLog.named({
    required super.localId,
    required this.entityType,
    required this.entityId,
    required this.entityModifiedAt,
    required this.status,
    this.executedAt,
    // ApiErrorResponse? apiErrorResponse,
  });
  // : apiErrorTimestamp = apiErrorResponse?.timestamp,
  //       apiErrorExceptionType = apiErrorResponse?.exceptionType,
  //       apiErrorMessage = apiErrorResponse?.message;

  @isarEnum
  late SyncEntityType entityType;
  late int entityId;
  @isarEnum
  late SyncStatus status;
  late DateTime entityModifiedAt;
  DateTime? executedAt;

  // DateTime? apiErrorTimestamp;
  // String? apiErrorExceptionType;
  // String? apiErrorMessage;
}
