part of 'isar.dart';

abstract class IsarSelectable<T> implements Selectable<T> {
  static IsarSelectable<T> single<T>(Query<T> Function() query) =>
      _IsarSelectableSingle(query);

  static IsarSelectable<List<T>> list<T>(Query<T> Function() query) =>
      _IsarSelectableList(query);

  static IsarSelectable<T> stream<T>(Stream<T> Function() stream) =>
      _IsarSelectableStream(stream);
}

class _IsarSelectableList<T> implements IsarSelectable<List<T>> {
  _IsarSelectableList(this._query);

  final Query<T> Function() _query;

  @override
  TaskEither<Failure, List<T>> get() {
    return TaskEither.tryCatch(
      () async => _query().findAll(),
      (error, stackTrace) => Failures.database,
    );
  }

  @override
  Stream<Either<Failure, List<T>>> watch() {
    try {
      return _query()
          .watch(fireImmediately: true)
          .distinct((previous, current) =>
              const DeepCollectionEquality().equals(previous, current))
          .map(right);
    } catch (e) {
      return Stream.value(left(Failures.database));
    }
  }
}

class _IsarSelectableSingle<T> implements IsarSelectable<T> {
  _IsarSelectableSingle(this._query);

  final Query<T> Function() _query;

  @override
  TaskEither<Failure, T> get() {
    return TaskEither.flatten(
      TaskEither.tryCatch(
        () async => Either.fromNullable(
          await _query().findFirst(),
          () => Failures.notFound,
        ).toTaskEither(),
        (error, stackTrace) => Failures.database,
      ),
    );
  }

  @override
  Stream<Either<Failure, T>> watch() {
    try {
      return _query()
          .watchLazy(fireImmediately: true)
          .asyncMap((_) => get().run());
    } catch (e) {
      return Stream.value(left(Failures.database));
    }
  }
}

class _IsarSelectableStream<T> implements IsarSelectable<T> {
  _IsarSelectableStream(this._stream);

  final Stream<T> Function() _stream;

  @override
  TaskEither<Failure, T> get() {
    return TaskEither.tryCatch(
      () => _stream().first,
      (error, stackTrace) => Failures.database,
    );
  }

  @override
  Stream<Either<Failure, T>> watch() {
    return _stream().transform(
      StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          sink.add(right(data));
        },
        handleError: (error, stackTrace, sink) {
          sink.add(left(Failures.database));
        },
      ),
    );
  }
}
