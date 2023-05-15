import 'dart:io';

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
    return mapLeft<Failure>(identity).flatMap((response) {
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return TaskEither.right(response.data as T);
      }

      if (response.statusCode == HttpStatus.unauthorized) {
        return TaskEither.left(Failures.auth);
      }

      if (response.statusCode == HttpStatus.badRequest) {
        return TaskEither.left(Failures.api);
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

        return _errorToFailure(error);
      },
    );
  }

  /// Maps the `Future` to a `TaskEither`. Also implicitly converts the
  /// `Response<T>` to a `Right<T>` and any `Failure` to a `Left<Failure>`.
  ///
  /// See [TaskEitherApiExtension.mapResponse] for more information about the
  /// failure mapping.
  TaskEither<Failure, T> mapResponse() {
    return TaskEither.tryCatch(
      () => this,
      (error, stackTrace) {
        final failure = _errorToFailure(error);

        logE(
          'Failed to execute request ($failure)',
          error,
          stackTrace,
        );

        return failure;
      },
    ).mapResponse();
  }
}

Failure _errorToFailure(Object error) {
  if (error is! DioError) {
    return Failures.api;
  }

  if (error.error is Failure) {
    return error.error as Failure? ?? const Failures.api();
  } else {
    return Failures.api;
  }
}
