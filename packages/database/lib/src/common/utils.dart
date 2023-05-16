import 'package:core/core.dart';
import 'package:database/src/common/drift_failure.dart';

TaskEither<Failure, TR> runTransaction<TR>(Future<TR> Function() transaction) {
  return TaskEither.tryCatch(
    () => transaction(),
    (error, stackTrace) => DriftFailure(
      error: error,
      stackTrace: stackTrace,
    ),
  );
}
