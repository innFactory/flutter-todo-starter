import 'package:core/core.dart';
import 'package:rxdart/rxdart.dart';

/// Extension methods for [Stream]s containing [Either]s.
extension StreamEitherX<L, R> on Stream<Either<L, R>> {
  /// If the [Either] is [Right] then change its value from type `R` to
  /// type `C` using function `f`.
  Stream<Either<L, C>> switchMapRight<C>(Stream<C> Function(R) f) =>
      switchMap((either) =>
          either.fold((l) => Stream.value(left(l)), (r) => f(r).map(right)));

  /// If the [Either] is [Right], then change its value from type `R` to
  /// type `C` using function `f`.
  Stream<Either<L, C>> mapRight<C>(C Function(R) f) =>
      map((either) => either.map(f));

  /// If the [Either] is [Left], then change its value from type `L` to
  /// type `C` using function `f`.
  Stream<Either<C, R>> mapLeft<C>(C Function(L) f) =>
      map((either) => either.mapLeft(f));

  /// If the Either is [Left], then return the result of `orElse`.
  Stream<Either<T, R>> orElse<T>(TaskEither<T, R> Function(L) f) =>
      asyncMap((either) => either.toTaskEither().orElse(f).run());

  /// Used to chain a [TaskEither] onto the Streams [Either].
  Stream<Either<L, T>> flatMap<T>(TaskEither<L, T> Function(R) f) =>
      asyncMap((either) => either.toTaskEither().flatMap(f).run());

  /// If the [Either] ist [Right], then map it to a new Stream using `f`.
  Stream<Either<L, C>> switchFlatMap<C>(Stream<Either<L, C>> Function(R) f) =>
      switchMap((value) => value.fold((l) => Stream.value(left(l)), f));
}
