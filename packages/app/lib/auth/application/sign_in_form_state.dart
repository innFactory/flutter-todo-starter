part of 'sign_in_form_controller.dart';

class SignInFormModel extends Equatable {
  const SignInFormModel({
    required this.email,
    required this.password,
  });

  const SignInFormModel.initial()
      : email = null,
        password = null;

  final String? email;
  final String? password;

  @override
  List<Object?> get props => [email, password];
}

class SignInForm extends TypedFormGroup<SignInFormModel> {
  SignInForm(SignInFormModel currentValue) : super(value: currentValue);

  final emailControl = FormControl<String>(
    validators: [Validators.required, Validators.minLength(1)],
  );

  final passwordControl = FormControl<String>(
    validators: [Validators.required, Validators.minLength(1)],
  );

  @override
  SignInFormModel toDomain(SignInFormModel previousValue) {
    return SignInFormModel(
      email: emailControl.value ?? '',
      password: passwordControl.value ?? '',
    );
  }
}
