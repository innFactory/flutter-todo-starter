import 'package:app/auth/application/sign_in_form_controller.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:forms/forms.dart';

class SignInFormView extends HookConsumerWidget {
  const SignInFormView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maybeAuthError = useState<AuthFailure?>(null);

    return ReactiveFormView<SignInFormModel, SignInForm>(
      provider: signInFormControllerProvider,
      focusBuilder: (form) => [form.emailControl, form.passwordControl],
      onSubmitFailure: (value) => maybeAuthError.value = value as AuthFailure,
      builder: (formState) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ReactiveTextField(
                formControl: formState.form.emailControl,
              ),
              ReactiveTextField(
                formControl: formState.form.passwordControl,
                onSubmitted: (_) =>
                    ref.read(signInFormControllerProvider.notifier).submit(),
                obscureText: true,
              ),
              if (maybeAuthError.value != null)
                Text(
                  maybeAuthError.value!.translate(I18n.of(context)),
                  style: const TextStyle(color: Colors.red),
                ),
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
