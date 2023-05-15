import 'package:api/api.dart';
import 'package:api/src/logging_interceptor.dart';
import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

extension ApiClientFactory on Never {
  static ApiClient unauthenticated() => _build();

  static ApiClient _build() {
    final dio = Dio(
      BaseOptions(
        baseUrl: Environment.current.apiBaseUrl,
        headers: {
          'Accept-Encoding': 'gzip',
        },
      ),
    );

    dio.transformer = BackgroundTransformer();

    return ApiClient(
      dio: dio,
      interceptors: [
        RetryInterceptor(
          dio: dio,
          retryDelays: const [
            Duration(seconds: 1),
            Duration(seconds: 2),
            Duration(seconds: 3),
          ],
        ),
        LoggingInterceptor(
          logFailure: logE,
          logSuccess: logD,
          logRequest: logD,
        ),
      ],
    );
  }
}
