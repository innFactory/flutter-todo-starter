import 'package:core/core.dart';

export 'package:fpdart/fpdart.dart' hide Reader, now, id;

Predicate<T> truePredicate<T>() => Predicate((_) => true);

/// Build a [TaskEither] that returns a `Right(right)`.
///
/// Shortcut for `TaskEither.right(r)`.
TaskEither<L, R> tRight<L, R>(R right) =>
    TaskEither(() async => Either.of(right));

/// Build a [TaskEither] that returns a `Left(left)`.
///
/// Shortcut for `TaskEither.left(l)`.
TaskEither<L, R> tLeft<L, R>(L left) => TaskEither(() async => Left(left));

extension TaskTaskEitherX<L, R> on Task<TaskEither<L, R>> {
  /// Run the [Task] and return the [TaskEither] inside.
  TaskEither<L, R> flatten() {
    return TaskEither(() async {
      final taskEither = await run();
      return taskEither.run();
    });
  }
}

TaskEither<L, R> traverseTaskEitherFold<L, R, A, B>(
  List<B> list,
  TaskEither<L, A> Function(B) f,
  Either<L, R> initialValue,
  Either<L, R> Function(Either<L, R> previous, Either<L, A> current) reduce,
) {
  return TaskEither(() async {
    final results = await Future.wait(list.map((e) => f(e).run()));
    return results.fold<Either<L, R>>(initialValue, reduce);
  });
}

extension FpdartNullable<T> on T? {
  /// Convert a nullable value to an [Either] with a [Failure] on the left.
  /// If the value is `null`, a [Failures.notFound] is returned.
  Either<Failure, T> getOrNotFound() {
    if (this == null) {
      return const Left(NotFoundFailure());
    }

    return Right(this as T);
  }
}

extension FpdartFutureNullable<T> on Future<T?> {
  /// Convert a nullable value to an [Either] with a [Failure] on the left.
  /// If the value is `null`, a [Failures.notFound] is returned.
  ///
  /// This method will not catch [Exception]s and is therefore a little unsafe.
  TaskEither<Failure, T> getOrNotFound() {
    return TaskEither(() async {
      final result = await this;

      if (result == null) {
        return const Left(NotFoundFailure());
      }

      return Right(result);
    });
  }
}
