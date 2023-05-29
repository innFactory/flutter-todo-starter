sealed class SyncIdentifier {
  const SyncIdentifier();

  List<String> get parameters => [];

  String get identifier => '${runtimeType.toString()}_${parameters.join('_')}';
}

final class TodoSyncIdentifier extends SyncIdentifier {
  const TodoSyncIdentifier();

  @override
  List<String> get parameters => [];
}
