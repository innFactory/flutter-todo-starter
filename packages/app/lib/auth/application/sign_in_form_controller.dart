import 'package:app/form/application/reactive_form_controller.dart';
import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'sign_in_form_state.dart';

final signInFormControllerProvider = StateNotifierProvider.autoDispose<
    SignInController, ReactiveFormState<SignInFormModel, SignInForm>>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);

    return SignInController(authRepository);
  },
  dependencies: [authRepositoryProvider],
);

class SignInController
    extends ReactiveFormController<SignInFormModel, SignInForm> {
  SignInController(this._authenticationRepository);

  final AuthRepository _authenticationRepository;

  @override
  TaskEither<Failure, SignInFormModel> get initialValue =>
      TaskEither.right(const SignInFormModel.initial());

  @override
  SignInForm createForm(SignInFormModel value) => SignInForm(value);

  @override
  TaskEither<Failure, SignInFormModel> onSubmit(SignInFormModel value) {
    return _authenticationRepository
        .signWithCredentials(
          value.email!,
          value.password!,
        )
        .map((r) => value);
  }
}
