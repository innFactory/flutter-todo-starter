import 'package:core/core.dart';
import 'package:dio/dio.dart';

extension TaskEitherApiExtension<F extends Failure, T>
    on TaskEither<F, Response<T>> {
  /// Maps the [Right<Response<T>>] to a [Right<T>].
  ///
  /// If the `statusCode` is between 200 and 299, the `data` is parsed to a [T].
  ///
  /// All other `statusCode`s are mapped to a [Left<Failure>].
  /// See [Failure.apiFailure(statusCode)] for more information.
  TaskEither<Failure, T> mapResponse() {
    return mapLeft<Failure>(id).flatMap((response) {
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return TaskEither.right(response.data as T);
      }

      return TaskEither.left(Failures.api);
    });
  }
}

extension TaskEitherFromFuture<T> on Future<Response<T>> {
  /// Converts the [Future<Response<T>>] to a
  /// [TaskEither<Failure, Response<T>>]. If the [Future] throws an
  /// [Exception], it is mapped to a [Left<Failure>].
  ///
  /// This ignores any API specified errors, use [mapResponse] to handle those.
  ///
  /// Shortcut for using [TaskEither.tryCatch].
  TaskEither<Failure, Response<T>> toTaskEither() {
    return TaskEither.tryCatch(
      () => this,
      (error, stackTrace) {
        logE(
          'Failed to execute request',
          error,
          stackTrace,
        );

        return Failures.api;
      },
    );
  }
}
