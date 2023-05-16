import 'package:core/core.dart';

abstract class NetworkInfo {
  Stream<bool> get connectionStream;

  Future<bool> get isConnected;
}

extension NetworkInfoX on NetworkInfo {
  TaskEither<Failure, Unit> get onlineOrFailure {
    return TaskEither(() async {
      final isConnected = await this.isConnected;

      return isConnected.match(
        () => const Left(Failures.offline),
        () => const Right(unit),
      );
    });
  }

  TaskEither<L, R> flatMatch<L, R>({
    required TaskEither<L, R> Function() offline,
    required TaskEither<L, R> Function() online,
  }) {
    return TaskEither(() async {
      final isConnected = await this.isConnected;

      return isConnected.match(
        () => offline().run(),
        () => online().run(),
      );
    });
  }
}
