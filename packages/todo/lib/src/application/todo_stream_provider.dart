import 'package:core/core.dart';
import 'package:todo/todo.dart';

final todoStreamProvider = StreamProvider.autoDispose<List<Todo>>(
  (ref) {
    final todoRepository = ref.watch(todoRepositoryProvider);

    return todoRepository.watchTodos();
  },
  dependencies: [todoRepositoryProvider],
);

final todoWithSoftdeletedStreamProvider =
    StreamProvider.autoDispose<List<Todo>>(
  (ref) {
    final todoRepository = ref.watch(todoRepositoryProvider);

    return todoRepository.watchTodos(
      includeSoftDeleted: true,
    );
  },
  dependencies: [todoRepositoryProvider],
);
