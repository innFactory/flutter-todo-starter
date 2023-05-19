import 'package:core/core.dart';

abstract class Selectable<T> {
  const Selectable();

  factory Selectable.value(T value) {
    return _SelectableImpl<T>(
      get: () => TaskEither(() async => right(value)),
      watch: () => Stream.value(right(value)),
    );
  }

  factory Selectable.failure(Failure failure) = _FailureSelectable<T>;

  factory Selectable.notFound() => _FailureSelectable<T>(Failures.notFound);

  TaskEither<Failure, T> get();

  Stream<Either<Failure, T>> watch();
}

class _FailureSelectable<T> extends Selectable<T> {
  const _FailureSelectable(this.failure);

  final Failure failure;

  @override
  TaskEither<Failure, T> get() => TaskEither(() async => left(failure));

  @override
  Stream<Either<Failure, T>> watch() => Stream.value(left(failure));
}

class _SelectableImpl<T> implements Selectable<T> {
  const _SelectableImpl({
    required TaskEither<Failure, T> Function() get,
    required Stream<Either<Failure, T>> Function() watch,
  })  : _get = get,
        _watch = watch;

  final TaskEither<Failure, T> Function() _get;
  final Stream<Either<Failure, T>> Function() _watch;

  @override
  TaskEither<Failure, T> get() => _get();

  @override
  Stream<Either<Failure, T>> watch() => _watch();
}

extension SelectableX<T> on Selectable<T> {
  Selectable<R> map<R>(R Function(T) f) {
    return _SelectableImpl(
      get: () => get().map(f),
      watch: () => watch().map((either) => either.map(f)),
    );
  }

  Selectable<R> flatMap<R>(TaskEither<Failure, R> Function(T) f) {
    return _SelectableImpl(
      get: () => get().flatMap(f),
      watch: () =>
          watch().asyncMap((either) => either.toTaskEither().flatMap(f).run()),
    );
  }
}
