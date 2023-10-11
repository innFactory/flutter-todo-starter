import 'package:core/core.dart';

final class ApiFailure extends Failure with EquatableMixin {
  const ApiFailure({
    required this.statusCode,
  }) : super(
          'apiFailure',
          statusCode,
        );

  final int? statusCode;

  @override
  List<Object?> get props => [statusCode];
}
