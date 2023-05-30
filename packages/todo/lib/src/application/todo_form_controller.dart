import 'package:core/core.dart';
import 'package:forms/forms.dart';
import 'package:todo/todo.dart';

part 'todo_form.dart';

class TodoFormArgs extends Equatable {
  const TodoFormArgs({
    required this.localId,
    required this.remoteId,
  });

  final TodoLocalId? localId;
  final TodoRemoteId? remoteId;

  @override
  List<Object?> get props => [
        localId,
        remoteId,
      ];
}

final todoFormControllerProvider = StateNotifierProvider.autoDispose.family<
    TodoFormController, ReactiveFormState<Todo, TodoForm>, TodoFormArgs?>(
  (ref, args) {
    final todoRepository = ref.watch(todoRepositoryProvider);

    return TodoFormController(args: args, todoRepository: todoRepository);
  },
);

class TodoFormController extends ReactiveFormController<Todo, TodoForm> {
  TodoFormController({
    required TodoRepository todoRepository,
    required TodoFormArgs? args,
  })  : _todoRepository = todoRepository,
        _args = args;

  final TodoRepository _todoRepository;
  final TodoFormArgs? _args;

  @override
  TaskEither<Failure, Todo> get initialValue =>
      _args
          ?.let((id) => _todoRepository.getTodoById(id.localId, id.remoteId)) ??
      TaskEither.right(Todo.empty());

  @override
  TodoForm createForm(Todo value) => TodoForm(value);

  @override
  TaskEither<Failure, Todo> onSubmit(Todo value) {
    return _todoRepository.createOrUpdateTodo(value);
  }
}
