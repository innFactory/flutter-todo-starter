part of 'sign_in_form_controller.dart';

class SignInFormModel extends Equatable {
  const SignInFormModel({
    required this.email,
    required this.password,
  });

  const SignInFormModel.initial()
      : email = 'email',
        password = 'password';

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}

class SignInForm extends TypedFormGroup<SignInFormModel> {
  SignInForm(SignInFormModel currentValue) : super(value: currentValue);

  late final emailControl = createControl(
    'emailControl',
    (value) => value.email,
  )(
    (value) => TypedFormControl<String>(
      value: value,
      validators: [
        Validators.required,
      ],
    ),
  );

  late final passwordControl = createControl(
    'passwordControl',
    (value) => value.password,
  )(
    (value) => TypedFormControl<String>(
      value: value,
      validators: [
        Validators.required,
      ],
    ),
  );

  @override
  SignInFormModel toDomain(SignInFormModel previousValue) {
    return SignInFormModel(
      email: emailControl.value,
      password: passwordControl.value,
    );
  }
}
