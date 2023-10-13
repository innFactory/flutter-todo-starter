import 'package:core/core.dart';
import 'package:kv_store/src/kv_store.dart';
import 'package:kv_store/src/kv_store_failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef SharedPreferencesProvider = Future<SharedPreferences> Function();

class SimpleKVStore implements KVStore {
  const SimpleKVStore({
    SharedPreferencesProvider sharedPreferences = SharedPreferences.getInstance,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferencesProvider _sharedPreferences;

  @override
  TaskEither<KVStoreFailure, Unit> clear() {
    return _tryPrefs((prefs) async {
      await prefs.clear();

      return right(unit);
    });
  }

  @override
  TaskEither<KVStoreFailure, bool> getBool(String key) {
    return _tryPrefs((prefs) async {
      try {
        final value = prefs.getBool(key);

        return value == null
            ? left(const KeyNotFoundKVStoreFailure())
            : right(value);
      } catch (e) {
        return left(const InvalidTypeKVStoreFailure());
      }
    });
  }

  @override
  TaskEither<KVStoreFailure, int> getInt(String key) {
    return _tryPrefs((prefs) async {
      try {
        final value = prefs.getInt(key);

        return value == null
            ? left(const KeyNotFoundKVStoreFailure())
            : Right(value);
      } catch (e) {
        return left(const InvalidTypeKVStoreFailure());
      }
    });
  }

  @override
  TaskEither<KVStoreFailure, String> getString(String key) {
    return _tryPrefs((prefs) async {
      try {
        final value = prefs.getString(key);

        return value == null
            ? left(const KeyNotFoundKVStoreFailure())
            : right(value);
      } catch (e) {
        return left(const InvalidTypeKVStoreFailure());
      }
    });
  }

  @override
  TaskEither<KVStoreFailure, Unit> remove(String key) {
    return _tryPrefs((prefs) async {
      await prefs.remove(key);

      return right(unit);
    });
  }

  @override
  TaskEither<KVStoreFailure, Unit> setBool(String key, bool value) {
    return _tryPrefs((prefs) async {
      await prefs.setBool(key, value);

      return right(unit);
    });
  }

  @override
  TaskEither<KVStoreFailure, Unit> setInt(String key, int value) {
    return _tryPrefs((prefs) async {
      await prefs.setInt(key, value);

      return const Right(unit);
    });
  }

  @override
  TaskEither<KVStoreFailure, Unit> setString(String key, String value) {
    return _tryPrefs((prefs) async {
      await prefs.setString(key, value);

      return right(unit);
    });
  }

  TaskEither<KVStoreFailure, T> _tryPrefs<T>(
    Future<Either<KVStoreFailure, T>> Function(SharedPreferences prefs) fn,
  ) {
    return TaskEither(() async {
      try {
        final prefs = await _sharedPreferences();

        return await fn(prefs);
      } catch (error, stackTrace) {
        return left(UnknownKVStoreFailure(error, stackTrace));
      }
    });
  }
}
