abstract base class Failure {
  const Failure(this.key, [this.exception, this.stackTrace]);

  final Object? exception;
  final StackTrace? stackTrace;
  final String key;
}

/// A failure that is thrown if a network resource was requested, but the device
/// is offline.
final class OfflineFailure extends Failure {
  const OfflineFailure() : super('offline');
}

final class NotFoundFailure extends Failure {
  const NotFoundFailure() : super('not_found');
}
