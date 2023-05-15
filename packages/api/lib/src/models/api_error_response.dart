import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error_additional_data.dart';
part 'api_error_response.freezed.dart';
part 'api_error_response_exception_type.dart';

@freezed
class ApiErrorResponse with _$ApiErrorResponse {
  const factory ApiErrorResponse({
    required DateTime? timestamp,
    required String? exceptionType,
    required String? message,
    required ApiErrorAdditionalData? additionalData,
  }) = _ApiErrorResponse;
}
