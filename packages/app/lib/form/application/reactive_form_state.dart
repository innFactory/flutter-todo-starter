part of 'reactive_form_controller.dart';

@freezed
class ReactiveFormState<Domain, Form extends TypedFormGroup<Domain>>
    with _$ReactiveFormState<Domain, Form> {
  const factory ReactiveFormState({
    required Form form,
    required bool isSubmitting,
    required bool isPristine,
    required bool isDisabled,
    required Either<Failure, Domain>? submitFailureOrSuccess,
  }) = ReactiveFormStateLoaded<Domain, Form>;

  factory ReactiveFormState.initial(Form form) => ReactiveFormState(
        form: form,
        isPristine: true,
        isSubmitting: false,
        isDisabled: false,
        submitFailureOrSuccess: null,
      );

  const factory ReactiveFormState.loading() =
      ReactiveFormStateLoading<Domain, Form>;

  const factory ReactiveFormState.error(Failure failure) =
      ReactiveFormStateError<Domain, Form>;

  const ReactiveFormState._();

  bool get isSubmitting => mapOrNull((value) => value.isSubmitting) ?? false;

  bool get isPristine => mapOrNull((value) => value.isPristine) ?? true;

  bool get isDisabled => mapOrNull((value) => value.isDisabled) ?? true;
}
