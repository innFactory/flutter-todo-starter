import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:forms/forms.dart';

part 'sign_in_form.dart';

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
  SignInController(this._authRepository);

  final AuthRepository _authRepository;

  @override
  TaskEither<Failure, SignInFormModel> get initialValue =>
      TaskEither.right(const SignInFormModel.initial());

  @override
  SignInForm createForm(SignInFormModel value) => SignInForm(value);

  @override
  TaskEither<Failure, SignInFormModel> onSubmit(SignInFormModel value) {
    return _authRepository
        .signWithCredentials(
          value.email,
          value.password,
        )
        .map((r) => value);
  }
}
