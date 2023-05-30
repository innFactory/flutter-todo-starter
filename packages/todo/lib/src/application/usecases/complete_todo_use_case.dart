import 'package:core/core.dart';
import 'package:todo/src/domain/models/todo.dart';
import 'package:todo/src/domain/provider/todo_repository_provider.dart';
import 'package:todo/src/domain/todo_repository.dart';

final completeTodoUseCaseProvider = Provider.autoDispose<CompleteTodoUseCase>(
  (ref) {
    final todoRepository = ref.watch(todoRepositoryProvider);

    return CompleteTodoUseCase(todoRepository: todoRepository);
  },
  dependencies: [todoRepositoryProvider],
);

class CompleteTodoUseCase {
  const CompleteTodoUseCase({
    required this.todoRepository,
  });

  final TodoRepository todoRepository;

  TaskEither<Failure, Unit> toggleTodo(Todo todo) {
    return todoRepository
        .createOrUpdateTodo(
          todo.copyWith(isCompleted: !todo.isCompleted),
        )
        .map((r) => unit);
  }
}
