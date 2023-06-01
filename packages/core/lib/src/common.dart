import 'package:core/core.dart';

extension TX<T> on T? {
  @pragma('vm:prefer-inline')
  R fold<R>(R Function() ifNone, R Function(T t) ifSome) =>
      this == null ? ifNone() : ifSome(this as T);
}

extension SetX<T> on Set<T> {
  /// Returns a new set with the given [input] added or removed.
  Set<T> toggle(T element) =>
      contains(element) ? difference({element}) : union({element});
}

extension EnumX<T extends Enum> on T {
  T next(List<T> values) {
    final index = values.indexOf(this);
    return values[(index + 1) % values.length];
  }
}

extension IterableX<T> on Iterable<T> {
  /// Returns a Map where the keys are the result of applying [key] to each
  /// element of the Iterable, and the value is the corresponding element.
  /// If any two elements use the same key, the last one will be used.
  Map<K, T> groupBy<K>(K Function(T element) key) {
    final map = <K, T>{};
    for (final element in this) {
      map[key(element)] = element;
    }
    return map;
  }
}

extension MapX<K, V> on Map<K, V> {
  Map<V, K> get reverse =>
      {for (final entry in entries) entry.value: entry.key};
}

extension StreamEitherX<L, R> on Stream<Either<L, R>> {
  Stream<Either<L, S>> switchMapEither<S>(Stream<S> Function(R r) ifRight) =>
      switchMap((either) => either.fold(
          (l) => Stream.value(left(l)), (r) => ifRight(r).map(right)));

  Stream<Either<L, T>> mapRight<T>(T Function(R) block) =>
      map((either) => either.map(block));

  Stream<Either<T, R>> mapLeft<T>(T Function(L) block) =>
      map((either) => either.mapLeft(block));

  Stream<Either<T, R>> orElse<T>(TaskEither<T, R> Function(L) block) =>
      asyncMap((either) => either.toTaskEither().orElse(block).run());

  Stream<Either<L, T>> flatMap<T>(TaskEither<L, T> Function(R) block) =>
      asyncMap((either) => either.toTaskEither().flatMap(block).run());

  Stream<Either<L, T>> switchFlatMap<T>(
          Stream<Either<L, T>> Function(R) block) =>
      switchMap(
        (value) => value.fold(
          (l) => Stream.value(left(l)),
          block,
        ),
      );
}

extension StreamX<T> on Stream<T> {
  Stream<T> shareValueSeededNullable(T? seedValue) =>
      seedValue == null ? this : shareValueSeeded(seedValue);
}
