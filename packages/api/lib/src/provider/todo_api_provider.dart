import 'package:api/src/provider/api_client_provider.dart';
import 'package:api/src/todos/todo_api.dart';
import 'package:api/src/todos/todo_api_impl.dart';
import 'package:core/core.dart';
import 'package:network_info/network_info.dart';

final todoApiProvider = Provider.autoDispose<TodoApi>(
  (ref) {
    final apiClient = ref.watch(apiClientProvider).getTodoApiControllerApi();
    final networkInfo = ref.watch(networkInfoProvider);

    return TodoApiImpl(apiClient, networkInfo);
  },
);
