import 'package:core/core.dart';
import 'package:kv_store/src/kv_store_failure.dart';

abstract class KVStore {
  /// Returns the value associated with the [key] as a [String].
  @useResult
  TaskEither<KVStoreFailure, String> getString(String key);

  /// Returns the value associated with the [key] as a [bool].
  @useResult
  TaskEither<KVStoreFailure, bool> getBool(String key);

  /// Returns the value associated with the [key] as an [int].
  @useResult
  TaskEither<KVStoreFailure, int> getInt(String key);

  /// Sets the [value] associated with the [key] as a [String].
  @useResult
  TaskEither<KVStoreFailure, Unit> setString(String key, String value);

  /// Sets the [value] associated with the [key] as a [bool].
  @useResult
  // ignore: avoid_positional_boolean_parameters
  TaskEither<KVStoreFailure, Unit> setBool(String key, bool value);

  /// Sets the [value] associated with the [key] as an [int].
  @useResult
  TaskEither<KVStoreFailure, Unit> setInt(String key, int value);

  /// Removes the value associated with the [key].
  /// Will not fail if the [key] is not found.
  @useResult
  TaskEither<KVStoreFailure, Unit> remove(String key);

  /// Clears all keys & values.
  @useResult
  TaskEither<KVStoreFailure, Unit> clear();
}
