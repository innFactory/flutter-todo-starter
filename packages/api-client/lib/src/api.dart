//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:api_client/src/api/health_api_controller_api.dart';
import 'package:api_client/src/api/todo_api_controller_api.dart';
import 'package:api_client/src/auth/api_key_auth.dart';
import 'package:api_client/src/auth/basic_auth.dart';
import 'package:api_client/src/auth/bearer_auth.dart';
import 'package:api_client/src/auth/oauth.dart';
import 'package:dio/dio.dart';

class ApiClient {
  ApiClient({
    Dio? dio,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  }) : dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }
  static const String basePath = 'http://localhost:9000';

  final Dio dio;

  void setOAuthToken(String name, String token) {
    if (dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (dio.interceptors.firstWhere((i) => i is OAuthInterceptor)
              as OAuthInterceptor)
          .tokens[name] = token;
    }
  }

  void setBearerAuth(String name, String token) {
    if (dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor)
              as BearerAuthInterceptor)
          .tokens[name] = token;
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor)
              as BasicAuthInterceptor)
          .authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (dio.interceptors
                  .firstWhere((element) => element is ApiKeyAuthInterceptor)
              as ApiKeyAuthInterceptor)
          .apiKeys[name] = apiKey;
    }
  }

  /// Get HealthAPIControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  HealthAPIControllerApi getHealthAPIControllerApi() {
    return HealthAPIControllerApi(dio);
  }

  /// Get TodoApiControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  TodoApiControllerApi getTodoApiControllerApi() {
    return TodoApiControllerApi(dio);
  }
}
