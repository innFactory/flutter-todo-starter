//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';
// ignore: unused_import
import 'dart:convert';

import 'package:api_client/src/deserialize.dart';
import 'package:api_client/src/model/create_todo_response_content.dart';
import 'package:api_client/src/model/get_todo_by_id_response_content.dart';
import 'package:api_client/src/model/get_todos_sync_response_content.dart';
import 'package:api_client/src/model/todo_creation.dart';
import 'package:api_client/src/model/todo_response.dart';
import 'package:api_client/src/model/todo_update.dart';
import 'package:api_client/src/model/update_todo_response_content.dart';
import 'package:dio/dio.dart';

class TodoApiControllerApi {
  const TodoApiControllerApi(this._dio);
  final Dio _dio;

  /// createTodo
  ///
  ///
  /// Parameters:
  /// * [todoCreation]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [CreateTodoResponseContent] as data
  /// Throws [DioError] if API call or serialization fails
  Future<Response<CreateTodoResponseContent>> createTodo({
    required TodoCreation todoCreation,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const path = '/v1/todos';
    final options = Options(
      method: 'POST',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    dynamic bodyData;

    try {
      bodyData = jsonEncode(todoCreation);
    } catch (error, stackTrace) {
      throw DioError(
        requestOptions: options.compose(
          _dio.options,
          path,
        ),
        error: error,
        stackTrace: stackTrace,
      );
    }

    final response = await _dio.request<Object>(
      path,
      data: bodyData,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    CreateTodoResponseContent responseData;

    try {
      responseData =
          deserialize<CreateTodoResponseContent, CreateTodoResponseContent>(
              response.data!, 'CreateTodoResponseContent');
    } catch (error, stackTrace) {
      throw DioError(
        requestOptions: response.requestOptions,
        response: response,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<CreateTodoResponseContent>(
      data: responseData,
      headers: response.headers,
      isRedirect: response.isRedirect,
      requestOptions: response.requestOptions,
      redirects: response.redirects,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  /// deleteTodoById
  ///
  ///
  /// Parameters:
  /// * [todoId]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future]
  /// Throws [DioError] if API call or serialization fails
  Future<Response<void>> deleteTodoById({
    required String todoId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final path = '/v1/todos/{todoId}'.replaceAll('{' 'todoId' '}', todoId);
    final options = Options(
      method: 'DELETE',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final response = await _dio.request<Object>(
      path,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    return response;
  }

  /// getTodoById
  ///
  ///
  /// Parameters:
  /// * [todoId]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetTodoByIdResponseContent] as data
  /// Throws [DioError] if API call or serialization fails
  Future<Response<GetTodoByIdResponseContent>> getTodoById({
    required String todoId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final path = '/v1/todos/{todoId}'.replaceAll('{' 'todoId' '}', todoId);
    final options = Options(
      method: 'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final response = await _dio.request<Object>(
      path,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    GetTodoByIdResponseContent responseData;

    try {
      responseData =
          deserialize<GetTodoByIdResponseContent, GetTodoByIdResponseContent>(
              response.data!, 'GetTodoByIdResponseContent');
    } catch (error, stackTrace) {
      throw DioError(
        requestOptions: response.requestOptions,
        response: response,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetTodoByIdResponseContent>(
      data: responseData,
      headers: response.headers,
      isRedirect: response.isRedirect,
      requestOptions: response.requestOptions,
      redirects: response.redirects,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  /// getTodos
  ///
  ///
  /// Parameters:
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [List<TodoResponse>] as data
  /// Throws [DioError] if API call or serialization fails
  Future<Response<List<TodoResponse>>> getTodos({
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const path = '/v1/todos';
    final options = Options(
      method: 'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final response = await _dio.request<Object>(
      path,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    List<TodoResponse> responseData;

    try {
      responseData = deserialize<List<TodoResponse>, TodoResponse>(
          response.data!, 'List<TodoResponse>');
    } catch (error, stackTrace) {
      throw DioError(
        requestOptions: response.requestOptions,
        response: response,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<List<TodoResponse>>(
      data: responseData,
      headers: response.headers,
      isRedirect: response.isRedirect,
      requestOptions: response.requestOptions,
      redirects: response.redirects,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  /// getTodosSync
  ///
  ///
  /// Parameters:
  /// * [timestamp] - ISO Date With Time
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetTodosSyncResponseContent] as data
  /// Throws [DioError] if API call or serialization fails
  Future<Response<GetTodosSyncResponseContent>> getTodosSync({
    String? timestamp,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const path = '/v1/sync/todos';
    final options = Options(
      method: 'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final queryParameters = <String, dynamic>{
      if (timestamp != null) 'timestamp': timestamp,
    };

    final response = await _dio.request<Object>(
      path,
      options: options,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    GetTodosSyncResponseContent responseData;

    try {
      responseData =
          deserialize<GetTodosSyncResponseContent, GetTodosSyncResponseContent>(
              response.data!, 'GetTodosSyncResponseContent');
    } catch (error, stackTrace) {
      throw DioError(
        requestOptions: response.requestOptions,
        response: response,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetTodosSyncResponseContent>(
      data: responseData,
      headers: response.headers,
      isRedirect: response.isRedirect,
      requestOptions: response.requestOptions,
      redirects: response.redirects,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  /// updateTodo
  ///
  ///
  /// Parameters:
  /// * [todoId]
  /// * [todoUpdate]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [UpdateTodoResponseContent] as data
  /// Throws [DioError] if API call or serialization fails
  Future<Response<UpdateTodoResponseContent>> updateTodo({
    required String todoId,
    required TodoUpdate todoUpdate,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final path = '/v1/todos/{todoId}'.replaceAll('{' 'todoId' '}', todoId);
    final options = Options(
      method: 'PATCH',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    dynamic bodyData;

    try {
      bodyData = jsonEncode(todoUpdate);
    } catch (error, stackTrace) {
      throw DioError(
        requestOptions: options.compose(
          _dio.options,
          path,
        ),
        error: error,
        stackTrace: stackTrace,
      );
    }

    final response = await _dio.request<Object>(
      path,
      data: bodyData,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    UpdateTodoResponseContent responseData;

    try {
      responseData =
          deserialize<UpdateTodoResponseContent, UpdateTodoResponseContent>(
              response.data!, 'UpdateTodoResponseContent');
    } catch (error, stackTrace) {
      throw DioError(
        requestOptions: response.requestOptions,
        response: response,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<UpdateTodoResponseContent>(
      data: responseData,
      headers: response.headers,
      isRedirect: response.isRedirect,
      requestOptions: response.requestOptions,
      redirects: response.redirects,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }
}
