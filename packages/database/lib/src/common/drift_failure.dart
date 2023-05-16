import 'package:core/core.dart';

class DriftFailure extends Failure {
  DriftFailure({
    this.error,
    this.stackTrace,
  });

  final Object? error;
  final StackTrace? stackTrace;

  @override
  String get code => throw UnimplementedError();

  @override
  String translate(I18n i18n) {
    // TODO: implement translate
    throw UnimplementedError();
  }
}
