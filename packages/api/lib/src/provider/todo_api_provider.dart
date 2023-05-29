import 'package:api/src/provider/api_client_provider.dart';
import 'package:api/src/todos/todo_api.dart';
import 'package:api/src/todos/todo_api_impl.dart';
import 'package:core/core.dart';

final todoApiProvider = Provider.autoDispose<TodoApi>(
  (ref) {
    final apiClient = ref.watch(apiClientProvider).getTodoApiControllerApi();

    return TodoApiImpl(apiClient);
  },
);
