import 'package:core/core.dart';
import 'package:kv_store/kv_store.dart';

/// Provides the currently active [Environment].
///
/// If the value is `null`, then the environment is still loading or actively
/// being changed.
final environmentProvider = StateProvider<Environment?>((ref) {
  {
    const kvStore = SimpleKVStore();

    kvStore.getString('environment').map((envString) {
      final env = Environment.values.firstWhere(
        (e) => e.name == envString,
        orElse: () => Environment.current,
      );
      Environment.current = env;
      ref.controller.state = env;

      return env;
    }).orElse((l) {
      final env = Environment.current;
      ref.controller.state = env;

      return tRight<Failure, Environment>(env);
    }).run();

    return null;
  }
});
