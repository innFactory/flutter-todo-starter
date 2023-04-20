import 'package:core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Provides the currently active [Environment].
///
/// If the value is `null`, then the environment is still loading or actively
/// being changed.
final environmentProvider = StateProvider<Environment?>((ref) {
  SharedPreferences.getInstance().then((prefs) {
    final env = Environment.values.firstWhere(
      (e) => e.name == prefs.getString('environment'),
      orElse: () => Environment.current,
    );
    Environment.current = env;
    ref.controller.state = env;
  });

  return null;
});
