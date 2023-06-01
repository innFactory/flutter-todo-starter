import 'package:api/src/common/api_client_factory.dart';
import 'package:api_client/api_client.dart';
import 'package:core/core.dart';

final apiClientProvider = Provider.autoDispose<ApiClient>(
  (ref) {
    return ApiClientFactory.unauthenticated();
  },
);
