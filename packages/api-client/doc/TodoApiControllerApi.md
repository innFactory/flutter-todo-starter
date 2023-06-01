# api_client.api.TodoApiControllerApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost:9000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createTodo**](TodoApiControllerApi.md#createtodo) | **POST** /v1/todos | 
[**deleteTodoById**](TodoApiControllerApi.md#deletetodobyid) | **DELETE** /v1/todos/{todoId} | 
[**getTodoById**](TodoApiControllerApi.md#gettodobyid) | **GET** /v1/todos/{todoId} | 
[**getTodos**](TodoApiControllerApi.md#gettodos) | **GET** /v1/todos | 
[**getTodosSync**](TodoApiControllerApi.md#gettodossync) | **GET** /v1/sync/todos | 
[**updateTodo**](TodoApiControllerApi.md#updatetodo) | **PATCH** /v1/todos/{todoId} | 


# **createTodo**
> CreateTodoResponseContent createTodo(todoCreation)



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getTodoApiControllerApi();
final TodoCreation todoCreation = {"title":"test","completed":false,"parentId":"dd155ffa-7ed7-4bd9-bbe2-d285f5fba5d9","description":"test","tags":["test"]}; // TodoCreation | 

try {
    final response = api.createTodo(todoCreation);
    print(response);
} catch on DioError (e) {
    print('Exception when calling TodoApiControllerApi->createTodo: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **todoCreation** | [**TodoCreation**](TodoCreation.md)|  | 

### Return type

[**CreateTodoResponseContent**](CreateTodoResponseContent.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteTodoById**
> deleteTodoById(todoId)



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getTodoApiControllerApi();
final String todoId = 9a65ceeb-f891-40a3-9814-266c306a54f6; // String | 

try {
    api.deleteTodoById(todoId);
} catch on DioError (e) {
    print('Exception when calling TodoApiControllerApi->deleteTodoById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **todoId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTodoById**
> GetTodoByIdResponseContent getTodoById(todoId)



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getTodoApiControllerApi();
final String todoId = 9a65ceeb-f891-40a3-9814-266c306a54f6; // String | 

try {
    final response = api.getTodoById(todoId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling TodoApiControllerApi->getTodoById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **todoId** | **String**|  | 

### Return type

[**GetTodoByIdResponseContent**](GetTodoByIdResponseContent.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTodos**
> List<TodoResponse> getTodos()



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getTodoApiControllerApi();

try {
    final response = api.getTodos();
    print(response);
} catch on DioError (e) {
    print('Exception when calling TodoApiControllerApi->getTodos: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List&lt;TodoResponse&gt;**](TodoResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTodosSync**
> GetTodosSyncResponseContent getTodosSync(timestamp)



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getTodoApiControllerApi();
final String timestamp = timestamp_example; // String | ISO Date With Time

try {
    final response = api.getTodosSync(timestamp);
    print(response);
} catch on DioError (e) {
    print('Exception when calling TodoApiControllerApi->getTodosSync: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **timestamp** | **String**| ISO Date With Time | [optional] 

### Return type

[**GetTodosSyncResponseContent**](GetTodosSyncResponseContent.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateTodo**
> UpdateTodoResponseContent updateTodo(todoId, todoUpdate)



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getTodoApiControllerApi();
final String todoId = 9a65ceeb-f891-40a3-9814-266c306a54f6; // String | 
final TodoUpdate todoUpdate = {"title":"test","completed":false,"parentId":"dd155ffa-7ed7-4bd9-bbe2-d285f5fba5d9","description":"test","tags":["test"]}; // TodoUpdate | 

try {
    final response = api.updateTodo(todoId, todoUpdate);
    print(response);
} catch on DioError (e) {
    print('Exception when calling TodoApiControllerApi->updateTodo: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **todoId** | **String**|  | 
 **todoUpdate** | [**TodoUpdate**](TodoUpdate.md)|  | 

### Return type

[**UpdateTodoResponseContent**](UpdateTodoResponseContent.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

