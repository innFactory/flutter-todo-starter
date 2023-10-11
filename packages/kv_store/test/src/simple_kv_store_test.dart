import 'package:core/core.dart';
import 'package:core_dev/core_dev.dart';
import 'package:kv_store/kv_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late MockSharedPreferences mockPrefs;
  late SimpleKVStore store;

  setUp(() {
    mockPrefs = MockSharedPreferences();
    store = SimpleKVStore(
      sharedPreferences: () => Future.sync(() => mockPrefs),
    );
  });

  group('bool', () {
    test('should fail if stored value is not a bool', () async {
      // Arrange
      const key = 'test_key';
      when(() => mockPrefs.getBool(key)).thenThrow(Exception());

      // Act
      final result = await store.getBool(key).run();

      // Assert
      expect(result, isLeftOf(const InvalidTypeKVStoreFailure()));
      verify(() => mockPrefs.getBool(key)).called(1);
    });

    test('should fail if key is not found', () async {
      // Arrange
      const key = 'test_key';
      when(() => mockPrefs.getBool(key)).thenReturn(null);

      // Act
      final result = await store.getBool(key).run();

      // Assert
      expect(result, isLeftOf(const KeyNotFoundKVStoreFailure()));
      verify(() => mockPrefs.getBool(key)).called(1);
    });

    test('should read value', () async {
      // Arrange
      const key = 'test_key';
      const value = true;
      when(() => mockPrefs.getBool(key)).thenReturn(value);

      // Act
      final result = await store.getBool(key).run();

      // Assert
      expect(result, isRightOf(value));
      verify(() => mockPrefs.getBool(key)).called(1);
    });

    test('should write value', () async {
      // Arrange
      const key = 'test_key';
      const value = true;
      when(() => mockPrefs.setBool(key, value)).thenAnswer((_) async => true);

      // Act
      final result = await store.setBool(key, value).run();

      // Assert
      expect(result, isRightOf(unit));
      verify(() => mockPrefs.setBool(key, value)).called(1);
    });
  });

  group('string', () {
    test('should fail if stored value is not a string', () async {
      // Arrange
      const key = 'test_key';
      when(() => mockPrefs.getString(key)).thenThrow(Exception());

      // Act
      final result = await store.getString(key).run();

      // Assert
      expect(result, isLeftOf(const InvalidTypeKVStoreFailure()));
      verify(() => mockPrefs.getString(key)).called(1);
    });

    test('should fail if key is not found', () async {
      // Arrange
      const key = 'test_key';
      when(() => mockPrefs.getString(key)).thenReturn(null);

      // Act
      final result = await store.getString(key).run();

      // Assert
      expect(result, isLeftOf(const KeyNotFoundKVStoreFailure()));
      verify(() => mockPrefs.getString(key)).called(1);
    });

    test('should read value', () async {
      // Arrange
      const key = 'test_key';
      const value = 'test_value';
      when(() => mockPrefs.getString(key)).thenReturn(value);

      // Act
      final result = await store.getString(key).run();

      // Assert
      expect(result, isRightOf(value));
      verify(() => mockPrefs.getString(key)).called(1);
    });

    test('should write value', () async {
      // Arrange
      const key = 'test_key';
      const value = 'test_value';
      when(() => mockPrefs.setString(key, value)).thenAnswer((_) async => true);

      // Act
      final result = await store.setString(key, value).run();

      // Assert
      expect(result, isRightOf(unit));
      verify(() => mockPrefs.setString(key, value)).called(1);
    });
  });

  group('int', () {
    test('should fail if stored value is not an int', () async {
      // Arrange
      const key = 'test_key';
      when(() => mockPrefs.getInt(key)).thenThrow(Exception());

      // Act
      final result = await store.getInt(key).run();

      // Assert
      expect(result, isLeftOf(const InvalidTypeKVStoreFailure()));
      verify(() => mockPrefs.getInt(key)).called(1);
    });

    test('should fail if key is not found', () async {
      // Arrange
      const key = 'test_key';
      when(() => mockPrefs.getInt(key)).thenReturn(null);

      // Act
      final result = await store.getInt(key).run();

      // Assert
      expect(result, isLeftOf(const KeyNotFoundKVStoreFailure()));
      verify(() => mockPrefs.getInt(key)).called(1);
    });

    test('should read value', () async {
      // Arrange
      const key = 'test_key';
      const value = 42;
      when(() => mockPrefs.getInt(key)).thenReturn(value);

      // Act
      final result = await store.getInt(key).run();

      // Assert
      expect(result, isRightOf(value));
      verify(() => mockPrefs.getInt(key)).called(1);
    });

    test('should write value', () async {
      // Arrange
      const key = 'test_key';
      const value = 42;
      when(() => mockPrefs.setInt(key, value)).thenAnswer((_) async => true);

      // Act
      final result = await store.setInt(key, value).run();

      // Assert
      expect(result, isRightOf(unit));
      verify(() => mockPrefs.setInt(key, value)).called(1);
    });
  });

  group('remove', () {
    test('should remove a value', () async {
      // Arrange
      const key = 'test_key';
      when(() => mockPrefs.remove(key)).thenAnswer((_) async => true);

      // Act
      final result = await store.remove(key).run();

      // Assert
      expect(result, isRightOf(unit));
      verify(() => mockPrefs.remove(key)).called(1);
    });
  });

  group('clear', () {
    test('should proxy clear to SharedPreferences', () async {
      // Arrange
      when(() => mockPrefs.clear()).thenAnswer((_) async => true);

      // Act
      final result = await store.clear().run();

      // Assert
      expect(result, isRightOf(unit));
      verify(() => mockPrefs.clear()).called(1);
    });

    test('should fail if clear fails', () async {
      // Arrange
      when(() => mockPrefs.clear()).thenThrow(Exception());

      // Act
      final result = await store.clear().run();

      // Assert
      expect(result, isLeftThat(isA<UnknownKVStoreFailure>()));
      verify(() => mockPrefs.clear()).called(1);
    });
  });
}
