import 'package:core/core.dart';
import 'package:rxdart/rxdart.dart';

/// Extension methods for [Stream]s containing [Either]s.
extension StreamEitherX<L, R> on Stream<Either<L, R>> {
  Stream<Either<L, S>> switchMapRight<S>(Stream<S> Function(R) f) =>
      switchMap((either) =>
          either.fold((l) => Stream.value(left(l)), (r) => f(r).map(right)));

  Stream<Either<L, T>> mapRight<T>(T Function(R) f) =>
      map((either) => either.map(f));

  Stream<Either<T, R>> mapLeft<T>(T Function(L) f) =>
      map((either) => either.mapLeft(f));

  Stream<Either<T, R>> orElse<T>(TaskEither<T, R> Function(L) f) =>
      asyncMap((either) => either.toTaskEither().orElse(f).run());

  Stream<Either<L, T>> flatMap<T>(TaskEither<L, T> Function(R) f) =>
      asyncMap((either) => either.toTaskEither().flatMap(f).run());

  Stream<Either<L, T>> switchFlatMap<T>(Stream<Either<L, T>> Function(R) f) =>
      switchMap((value) => value.fold((l) => Stream.value(left(l)), f));
}
