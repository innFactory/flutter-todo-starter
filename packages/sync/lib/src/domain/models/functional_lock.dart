import 'package:core/core.dart';
import 'package:synchronized/synchronized.dart';

class FunctionalLock {
  FunctionalLock({bool reentrant = false}) : _lock = Lock(reentrant: reentrant);

  final Lock _lock;

  TaskEither<Failure, R> synchronized<R>(TaskEither<Failure, R> Function() f) {
    return TaskEither(() => _lock.synchronized(() => f().run()));
  }
}
