part of 'reactive_form_controller.dart';

@freezed
class ReactiveFormState<TFailure, TDomain,
        TFormGroup extends TypedFormGroup<TDomain>>
    with _$ReactiveFormState<TFailure, TDomain, TFormGroup> {
  const factory ReactiveFormState({
    required TFormGroup form,
    required bool isSubmitting,
    required bool isPristine,
    required bool isDisabled,
    required Either<TFailure, TDomain>? submitFailureOrSuccess,
  }) = ReactiveFormStateLoaded<TFailure, TDomain, TFormGroup>;

  factory ReactiveFormState.initial(TFormGroup form) => ReactiveFormState(
        form: form,
        isPristine: true,
        isSubmitting: false,
        isDisabled: false,
        submitFailureOrSuccess: null,
      );

  const factory ReactiveFormState.loading() =
      ReactiveFormStateLoading<TFailure, TDomain, TFormGroup>;

  const factory ReactiveFormState.error(TFailure failure) =
      ReactiveFormStateError<TFailure, TDomain, TFormGroup>;

  const ReactiveFormState._();

  bool get isSubmitting => mapOrNull((value) => value.isSubmitting) ?? false;

  bool get isPristine => mapOrNull((value) => value.isPristine) ?? true;

  bool get isDisabled => mapOrNull((value) => value.isDisabled) ?? true;
}
