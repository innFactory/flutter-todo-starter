import 'package:app/auth/application/sign_in_form_controller.dart';
import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:forms/forms.dart';

class SignInFormView extends HookConsumerWidget {
  const SignInFormView({super.key, required this.onLoginSuccess});

  final VoidCallback onLoginSuccess;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maybeAuthError = useState<Failure?>(null);

    return ReactiveFormView<SignInFormModel, SignInForm>(
      provider: signInFormControllerProvider,
      focusBuilder: (form) => [form.emailControl, form.passwordControl],
      onSubmitFailure: (value) => maybeAuthError.value = value,
      onSubmitSuccess: (_) => onLoginSuccess(),
      builder: (formState) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ReactiveTextField(
                formControl: formState.form.emailControl,
                decoration: InputDecoration(
                  hintText: context.translate('email'),
                ),
              ),
              ReactiveTextField(
                formControl: formState.form.passwordControl,
                onSubmitted: (_) =>
                    ref.read(signInFormControllerProvider.notifier).submit(),
                decoration: InputDecoration(
                  hintText: context.translate('password'),
                ),
                obscureText: true,
              ),
              if (maybeAuthError.value != null) ...[
                Text(
                  switch (maybeAuthError.value!) {
                    InvalidCredentialsFailure() => 'Invalid Credentials',
                    _ => 'Unknown Error',
                  },
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 20),
              ],
              ElevatedButton(
                onPressed: () =>
                    ref.read(signInFormControllerProvider.notifier).submit(),
                child: const Text('submit'),
              ),
            ].separated(
              (index) => const SizedBox(height: 20),
            ),
          ),
        );
      },
    );
  }
}
