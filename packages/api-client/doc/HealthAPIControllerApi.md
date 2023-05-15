# api_client.api.HealthAPIControllerApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost:9000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**liveness**](HealthAPIControllerApi.md#liveness) | **GET** /liveness | 
[**ping**](HealthAPIControllerApi.md#ping) | **GET** / | 
[**readiness**](HealthAPIControllerApi.md#readiness) | **GET** /readiness | 


# **liveness**
> liveness()



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getHealthAPIControllerApi();

try {
    api.liveness();
} catch on DioError (e) {
    print('Exception when calling HealthAPIControllerApi->liveness: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ping**
> ping()



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getHealthAPIControllerApi();

try {
    api.ping();
} catch on DioError (e) {
    print('Exception when calling HealthAPIControllerApi->ping: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readiness**
> readiness()



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getHealthAPIControllerApi();

try {
    api.readiness();
} catch on DioError (e) {
    print('Exception when calling HealthAPIControllerApi->readiness: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

