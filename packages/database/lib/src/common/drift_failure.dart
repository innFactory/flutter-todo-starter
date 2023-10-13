import 'package:core/core.dart';

final class DriftFailure extends Failure {
  DriftFailure([this.error, this.stackT])
      : super(
          'driftFailure',
          error,
          stackT,
        );

  final Object? error;
  final StackTrace? stackT;
}
