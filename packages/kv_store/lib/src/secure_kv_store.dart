import 'package:core/core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kv_store/kv_store.dart';

class SecureKVStore implements KVStore {
  const SecureKVStore({
    FlutterSecureStorage secureStorage = const FlutterSecureStorage(),
  }) : _secureStorage = secureStorage;

  final FlutterSecureStorage _secureStorage;

  @override
  TaskEither<KVStoreFailure, bool> getBool(String key) {
    return _tryCatch(() async {
      final value = await _secureStorage.read(key: key);

      if (value == null) {
        return left(const KeyNotFoundKVStoreFailure());
      }

      if (value == 'true') {
        return right(true);
      } else if (value == 'false') {
        return right(false);
      } else {
        return left(const InvalidTypeKVStoreFailure());
      }
    });
  }

  @override
  TaskEither<KVStoreFailure, Unit> clear() {
    return _tryCatch(() async {
      await _secureStorage.deleteAll();
      return right(unit);
    });
  }

  @override
  TaskEither<KVStoreFailure, int> getInt(String key) {
    return _tryCatch(() async {
      final value = await _secureStorage.read(key: key);

      if (value == null) {
        return left(const KeyNotFoundKVStoreFailure());
      }

      try {
        return Right(int.parse(value));
      } on FormatException {
        return left(const InvalidTypeKVStoreFailure());
      }
    });
  }

  @override
  TaskEither<KVStoreFailure, String> getString(String key) {
    return _tryCatch(() async {
      final value = await _secureStorage.read(key: key);

      if (value == null) {
        return left(const KeyNotFoundKVStoreFailure());
      }

      return Right(value);
    });
  }

  @override
  TaskEither<KVStoreFailure, Unit> remove(String key) {
    return _tryCatch(() async {
      await _secureStorage.delete(key: key);
      return right(unit);
    });
  }

  @override
  TaskEither<KVStoreFailure, Unit> setBool(String key, bool value) {
    return _tryCatch(() async {
      await _secureStorage.write(key: key, value: value.toString());
      return right(unit);
    });
  }

  @override
  TaskEither<KVStoreFailure, Unit> setInt(String key, int value) {
    return _tryCatch(() async {
      await _secureStorage.write(key: key, value: value.toString());
      return right(unit);
    });
  }

  @override
  TaskEither<KVStoreFailure, Unit> setString(String key, String value) {
    return _tryCatch(() async {
      await _secureStorage.write(key: key, value: value);
      return right(unit);
    });
  }

  TaskEither<KVStoreFailure, T> _tryCatch<T>(
    Future<Either<KVStoreFailure, T>> Function() fn,
  ) {
    return TaskEither(() async {
      try {
        return await fn();
      } catch (error, stackTrace) {
        return left(UnknownKVStoreFailure(error, stackTrace));
      }
    });
  }
}
