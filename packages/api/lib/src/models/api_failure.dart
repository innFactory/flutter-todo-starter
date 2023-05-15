import 'package:api/src/models/api_error_response.dart';
import 'package:core/core.dart';

class ApiFailure implements Failure {
  const ApiFailure([this.apiErrorResponse]);

  final ApiErrorResponse? apiErrorResponse;

  @override
  String get code => apiErrorResponse?.exceptionType ?? 'api';

  @override
  String translate(I18n i18n) {
    final responseErrorCode = apiErrorResponse?.exceptionType;

    if (responseErrorCode != null) {
      return i18n.translate('errors.backend.$responseErrorCode');
    }

    return i18n.translate('failures.api');
  }

  @override
  String toString() {
    return 'ApiFailure(errorResponse: $apiErrorResponse)';
  }
}
