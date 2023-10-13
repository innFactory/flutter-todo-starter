import 'package:core/core.dart';
import 'package:core_dev/core_dev.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kv_store/kv_store.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  late MockFlutterSecureStorage mockStorage;
  late SecureKVStore store;

  setUp(() {
    mockStorage = MockFlutterSecureStorage();
    store = SecureKVStore(
      secureStorage: mockStorage,
    );
  });

  group('bool', () {
    test('should fail if stored value is not a bool', () async {
      // Arrange
      const key = 'test_key';
      when(() => mockStorage.read(key: key)).thenAnswer((_) async => 'test');

      // Act
      final result = await store.getBool(key).run();

      // Assert
      expect(result, isLeftOf(const InvalidTypeKVStoreFailure()));
      verify(() => mockStorage.read(key: key)).called(1);
    });

    test('should fail if key is not found', () async {
      // Arrange
      const key = 'test_key';
      when(() => mockStorage.read(key: key)).thenAnswer((_) async => null);

      // Act
      final result = await store.getBool(key).run();

      // Assert
      expect(result, isLeftOf(const KeyNotFoundKVStoreFailure()));
      verify(() => mockStorage.read(key: key)).called(1);
    });

    test('should read value', () async {
      // Arrange
      const key = 'test_key';
      const value = true;
      when(() => mockStorage.read(key: key))
          .thenAnswer((_) async => value.toString());

      // Act
      final result = await store.getBool(key).run();

      // Assert
      expect(result, isRightOf(value));
      verify(() => mockStorage.read(key: key)).called(1);
    });

    test('should write value', () async {
      // Arrange
      const key = 'test_key';
      const value = true;
      when(() => mockStorage.write(key: key, value: value.toString()))
          .thenAnswer((_) async => true);

      // Act
      final result = await store.setBool(key, value).run();

      // Assert
      expect(result, isRightOf(unit));
      verify(() => mockStorage.write(key: key, value: value.toString()))
          .called(1);
    });
  });

  group('string', () {
    test('should fail if key is not found', () async {
      // Arrange
      const key = 'test_key';
      when(() => mockStorage.read(key: key)).thenAnswer((_) async => null);

      // Act
      final result = await store.getString(key).run();

      // Assert
      expect(result, isLeftOf(const KeyNotFoundKVStoreFailure()));
      verify(() => mockStorage.read(key: key)).called(1);
    });

    test('should read value', () async {
      // Arrange
      const key = 'test_key';
      const value = 'test_value';
      when(() => mockStorage.read(key: key)).thenAnswer((_) async => value);

      // Act
      final result = await store.getString(key).run();

      // Assert
      expect(result, isRightOf(value));
      verify(() => mockStorage.read(key: key)).called(1);
    });

    test('should write value', () async {
      // Arrange
      const key = 'test_key';
      const value = 'test_value';
      when(() => mockStorage.write(key: key, value: value))
          .thenAnswer((_) async => true);

      // Act
      final result = await store.setString(key, value).run();

      // Assert
      expect(result, isRightOf(unit));
      verify(() => mockStorage.write(key: key, value: value)).called(1);
    });
  });

  group('int', () {
    test('should fail if stored value is not an int', () async {
      // Arrange
      const key = 'test_key';
      when(() => mockStorage.read(key: key)).thenAnswer((_) async => 'test');

      // Act
      final result = await store.getInt(key).run();

      // Assert
      expect(result, isLeftOf(const InvalidTypeKVStoreFailure()));
      verify(() => mockStorage.read(key: key)).called(1);
    });

    test('should fail if key is not found', () async {
      // Arrange
      const key = 'test_key';
      when(() => mockStorage.read(key: key)).thenAnswer((_) async => null);

      // Act
      final result = await store.getInt(key).run();

      // Assert
      expect(result, isLeftOf(const KeyNotFoundKVStoreFailure()));
      verify(() => mockStorage.read(key: key)).called(1);
    });

    test('should read value', () async {
      // Arrange
      const key = 'test_key';
      const value = 42;
      when(() => mockStorage.read(key: key))
          .thenAnswer((_) async => value.toString());

      // Act
      final result = await store.getInt(key).run();

      // Assert
      expect(result, isRightOf(value));
      verify(() => mockStorage.read(key: key)).called(1);
    });

    test('should write value', () async {
      // Arrange
      const key = 'test_key';
      const value = 42;
      when(() => mockStorage.write(key: key, value: value.toString()))
          .thenAnswer((_) async => true);

      // Act
      final result = await store.setInt(key, value).run();

      // Assert
      expect(result, isRightOf(unit));
      verify(() => mockStorage.write(key: key, value: value.toString()))
          .called(1);
    });
  });

  group('remove', () {
    test('should remove a value', () async {
      // Arrange
      const key = 'test_key';
      when(() => mockStorage.delete(key: key)).thenAnswer((_) async => true);

      // Act
      final result = await store.remove(key).run();

      // Assert
      expect(result, isRightOf(unit));
      verify(() => mockStorage.delete(key: key)).called(1);
    });
  });

  group('clear', () {
    test('should proxy clear to SharedPreferences', () async {
      // Arrange
      when(() => mockStorage.deleteAll()).thenAnswer((_) async => true);

      // Act
      final result = await store.clear().run();

      // Assert
      expect(result, isRightOf(unit));
      verify(() => mockStorage.deleteAll()).called(1);
    });

    test('should fail if clear fails', () async {
      // Arrange
      when(() => mockStorage.deleteAll()).thenThrow(Exception());

      // Act
      final result = await store.clear().run();

      // Assert
      expect(result, isLeftThat(isA<UnknownKVStoreFailure>()));
      verify(() => mockStorage.deleteAll()).called(1);
    });
  });
}
