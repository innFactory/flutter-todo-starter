enum SyncEntityType {
  todos;

  static const allValues = <SyncEntityType>[
    todos,
  ];
}

/// SyncIdentifier todos, todos_by_folder_123

sealed class SyncIdentifier {
  List<Object> get parameters;

  String get identifier => '${runtimeType.toString()}_${parameters.join('_')}';
}

final class TodoByFolderSyncIdentifier extends SyncIdentifier {
  final int folderId;

  TodoByFolderSyncIdentifier(this.folderId);

  @override
  List<Object> get parameters => [folderId];
}
