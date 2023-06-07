import 'package:core/core.dart';
import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  LoggingInterceptor({
    required this.logRequest,
    required this.logSuccess,
    required this.logFailure,
  });

  void Function(dynamic object) logRequest;
  void Function(dynamic object) logSuccess;
  void Function(dynamic object) logFailure;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    logV(
      {
        'request': {
          'method': options.method,
          'url': options.uri,
          'headers': options.headers,
          'body': options.data,
        },
      },
    );
    handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    logV(
      {
        'response': {
          'method': response.requestOptions.method,
          'url': response.requestOptions.uri,
          'headers': response.headers,
          'code': response.statusCode,
          'body': response.data,
        },
      },
    );
    handler.next(response);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    logW(
      {
        'error': {
          'method': err.requestOptions.method,
          'url': err.requestOptions.uri,
          'headers': err.requestOptions.headers,
          'code': err.response?.statusCode,
          'body': err.response?.data,
        },
      },
    );
    handler.next(err);
  }
}
