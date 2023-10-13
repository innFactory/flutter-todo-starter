import 'package:core/core.dart';

/// Base class for failures in the [KVStore].
sealed class KVStoreFailure extends Failure {
  const KVStoreFailure(super.key, [super.exception, super.stackTrace]);
}

/// The requested key was not found in the store.
final class KeyNotFoundKVStoreFailure extends KVStoreFailure {
  const KeyNotFoundKVStoreFailure() : super('keyNotFoundKVStoreFailure');
}

/// The requested type does not match the stored type.
final class InvalidTypeKVStoreFailure extends KVStoreFailure {
  const InvalidTypeKVStoreFailure() : super('invalidTypeKVStoreFailure');
}

/// An unknown error occurred.
final class UnknownKVStoreFailure extends KVStoreFailure {
  const UnknownKVStoreFailure(
    this.error,
    this.stackT,
  ) : super('unknownKVStoreFailure', error, stackT);

  final Object error;
  final StackTrace stackT;
}
