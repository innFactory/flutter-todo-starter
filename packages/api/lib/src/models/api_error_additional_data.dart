part of 'api_error_response.dart';

@freezed
class ApiErrorAdditionalData with _$ApiErrorAdditionalData {
  const factory ApiErrorAdditionalData({
    required String? entityId,
    required String? value,
  }) = _ApiErrorAdditionalData;
}
