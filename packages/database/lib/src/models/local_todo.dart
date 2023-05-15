import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:isar/isar.dart';

part 'local_todo.g.dart';

@collection
class LocalTodo extends LocalBase {
  @protected
  LocalTodo();

  LocalTodo.named({
    required super.localId,
    required super.remoteId,
    super.localUpdatedAt,
    super.localCreatedAt,
    super.localSyncStatus,
    required this.title,
    required this.description,
    required this.tags,
    required this.isCompleted,
    this.parentLocalId,
    this.parentRemoteId,
  });

  late String title;
  late String description;
  List<String> tags = [];
  late bool isCompleted;
  int? parentLocalId;
  String? parentRemoteId;
}
