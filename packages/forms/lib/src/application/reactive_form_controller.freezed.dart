// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reactive_form_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReactiveFormState<Domain, Form extends TypedFormGroup<Domain>> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Form form, bool isSubmitting, bool isPristine,
            bool isDisabled, Either<Failure, Domain>? submitFailureOrSuccess)
        $default, {
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Form form, bool isSubmitting, bool isPristine,
            bool isDisabled, Either<Failure, Domain>? submitFailureOrSuccess)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Form form, bool isSubmitting, bool isPristine,
            bool isDisabled, Either<Failure, Domain>? submitFailureOrSuccess)?
        $default, {
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ReactiveFormStateLoaded<Domain, Form> value) $default, {
    required TResult Function(ReactiveFormStateLoading<Domain, Form> value)
        loading,
    required TResult Function(ReactiveFormStateError<Domain, Form> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(ReactiveFormStateLoaded<Domain, Form> value)? $default, {
    TResult? Function(ReactiveFormStateLoading<Domain, Form> value)? loading,
    TResult? Function(ReactiveFormStateError<Domain, Form> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ReactiveFormStateLoaded<Domain, Form> value)? $default, {
    TResult Function(ReactiveFormStateLoading<Domain, Form> value)? loading,
    TResult Function(ReactiveFormStateError<Domain, Form> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReactiveFormStateCopyWith<Domain,
    Form extends TypedFormGroup<Domain>, $Res> {
  factory $ReactiveFormStateCopyWith(ReactiveFormState<Domain, Form> value,
          $Res Function(ReactiveFormState<Domain, Form>) then) =
      _$ReactiveFormStateCopyWithImpl<Domain, Form, $Res,
          ReactiveFormState<Domain, Form>>;
}

/// @nodoc
class _$ReactiveFormStateCopyWithImpl<
        Domain,
        Form extends TypedFormGroup<Domain>,
        $Res,
        $Val extends ReactiveFormState<Domain, Form>>
    implements $ReactiveFormStateCopyWith<Domain, Form, $Res> {
  _$ReactiveFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ReactiveFormStateLoadedCopyWith<Domain,
    Form extends TypedFormGroup<Domain>, $Res> {
  factory _$$ReactiveFormStateLoadedCopyWith(
          _$ReactiveFormStateLoaded<Domain, Form> value,
          $Res Function(_$ReactiveFormStateLoaded<Domain, Form>) then) =
      __$$ReactiveFormStateLoadedCopyWithImpl<Domain, Form, $Res>;
  @useResult
  $Res call(
      {Form form,
      bool isSubmitting,
      bool isPristine,
      bool isDisabled,
      Either<Failure, Domain>? submitFailureOrSuccess});
}

/// @nodoc
class __$$ReactiveFormStateLoadedCopyWithImpl<Domain,
        Form extends TypedFormGroup<Domain>, $Res>
    extends _$ReactiveFormStateCopyWithImpl<Domain, Form, $Res,
        _$ReactiveFormStateLoaded<Domain, Form>>
    implements _$$ReactiveFormStateLoadedCopyWith<Domain, Form, $Res> {
  __$$ReactiveFormStateLoadedCopyWithImpl(
      _$ReactiveFormStateLoaded<Domain, Form> _value,
      $Res Function(_$ReactiveFormStateLoaded<Domain, Form>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
    Object? isSubmitting = null,
    Object? isPristine = null,
    Object? isDisabled = null,
    Object? submitFailureOrSuccess = freezed,
  }) {
    return _then(_$ReactiveFormStateLoaded<Domain, Form>(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as Form,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isPristine: null == isPristine
          ? _value.isPristine
          : isPristine // ignore: cast_nullable_to_non_nullable
              as bool,
      isDisabled: null == isDisabled
          ? _value.isDisabled
          : isDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      submitFailureOrSuccess: freezed == submitFailureOrSuccess
          ? _value.submitFailureOrSuccess
          : submitFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Either<Failure, Domain>?,
    ));
  }
}

/// @nodoc

class _$ReactiveFormStateLoaded<Domain, Form extends TypedFormGroup<Domain>>
    extends ReactiveFormStateLoaded<Domain, Form> {
  const _$ReactiveFormStateLoaded(
      {required this.form,
      required this.isSubmitting,
      required this.isPristine,
      required this.isDisabled,
      required this.submitFailureOrSuccess})
      : super._();

  @override
  final Form form;
  @override
  final bool isSubmitting;
  @override
  final bool isPristine;
  @override
  final bool isDisabled;
  @override
  final Either<Failure, Domain>? submitFailureOrSuccess;

  @override
  String toString() {
    return 'ReactiveFormState<$Domain, $Form>(form: $form, isSubmitting: $isSubmitting, isPristine: $isPristine, isDisabled: $isDisabled, submitFailureOrSuccess: $submitFailureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReactiveFormStateLoaded<Domain, Form> &&
            const DeepCollectionEquality().equals(other.form, form) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.isPristine, isPristine) ||
                other.isPristine == isPristine) &&
            (identical(other.isDisabled, isDisabled) ||
                other.isDisabled == isDisabled) &&
            (identical(other.submitFailureOrSuccess, submitFailureOrSuccess) ||
                other.submitFailureOrSuccess == submitFailureOrSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(form),
      isSubmitting,
      isPristine,
      isDisabled,
      submitFailureOrSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReactiveFormStateLoadedCopyWith<Domain, Form,
          _$ReactiveFormStateLoaded<Domain, Form>>
      get copyWith => __$$ReactiveFormStateLoadedCopyWithImpl<Domain, Form,
          _$ReactiveFormStateLoaded<Domain, Form>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Form form, bool isSubmitting, bool isPristine,
            bool isDisabled, Either<Failure, Domain>? submitFailureOrSuccess)
        $default, {
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
  }) {
    return $default(
        form, isSubmitting, isPristine, isDisabled, submitFailureOrSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Form form, bool isSubmitting, bool isPristine,
            bool isDisabled, Either<Failure, Domain>? submitFailureOrSuccess)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(Failure failure)? error,
  }) {
    return $default?.call(
        form, isSubmitting, isPristine, isDisabled, submitFailureOrSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Form form, bool isSubmitting, bool isPristine,
            bool isDisabled, Either<Failure, Domain>? submitFailureOrSuccess)?
        $default, {
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
          form, isSubmitting, isPristine, isDisabled, submitFailureOrSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ReactiveFormStateLoaded<Domain, Form> value) $default, {
    required TResult Function(ReactiveFormStateLoading<Domain, Form> value)
        loading,
    required TResult Function(ReactiveFormStateError<Domain, Form> value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(ReactiveFormStateLoaded<Domain, Form> value)? $default, {
    TResult? Function(ReactiveFormStateLoading<Domain, Form> value)? loading,
    TResult? Function(ReactiveFormStateError<Domain, Form> value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ReactiveFormStateLoaded<Domain, Form> value)? $default, {
    TResult Function(ReactiveFormStateLoading<Domain, Form> value)? loading,
    TResult Function(ReactiveFormStateError<Domain, Form> value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class ReactiveFormStateLoaded<Domain,
        Form extends TypedFormGroup<Domain>>
    extends ReactiveFormState<Domain, Form> {
  const factory ReactiveFormStateLoaded(
          {required final Form form,
          required final bool isSubmitting,
          required final bool isPristine,
          required final bool isDisabled,
          required final Either<Failure, Domain>? submitFailureOrSuccess}) =
      _$ReactiveFormStateLoaded<Domain, Form>;
  const ReactiveFormStateLoaded._() : super._();

  Form get form;
  bool get isSubmitting;
  bool get isPristine;
  bool get isDisabled;
  Either<Failure, Domain>? get submitFailureOrSuccess;
  @JsonKey(ignore: true)
  _$$ReactiveFormStateLoadedCopyWith<Domain, Form,
          _$ReactiveFormStateLoaded<Domain, Form>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReactiveFormStateLoadingCopyWith<Domain,
    Form extends TypedFormGroup<Domain>, $Res> {
  factory _$$ReactiveFormStateLoadingCopyWith(
          _$ReactiveFormStateLoading<Domain, Form> value,
          $Res Function(_$ReactiveFormStateLoading<Domain, Form>) then) =
      __$$ReactiveFormStateLoadingCopyWithImpl<Domain, Form, $Res>;
}

/// @nodoc
class __$$ReactiveFormStateLoadingCopyWithImpl<Domain,
        Form extends TypedFormGroup<Domain>, $Res>
    extends _$ReactiveFormStateCopyWithImpl<Domain, Form, $Res,
        _$ReactiveFormStateLoading<Domain, Form>>
    implements _$$ReactiveFormStateLoadingCopyWith<Domain, Form, $Res> {
  __$$ReactiveFormStateLoadingCopyWithImpl(
      _$ReactiveFormStateLoading<Domain, Form> _value,
      $Res Function(_$ReactiveFormStateLoading<Domain, Form>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReactiveFormStateLoading<Domain, Form extends TypedFormGroup<Domain>>
    extends ReactiveFormStateLoading<Domain, Form> {
  const _$ReactiveFormStateLoading() : super._();

  @override
  String toString() {
    return 'ReactiveFormState<$Domain, $Form>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReactiveFormStateLoading<Domain, Form>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Form form, bool isSubmitting, bool isPristine,
            bool isDisabled, Either<Failure, Domain>? submitFailureOrSuccess)
        $default, {
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Form form, bool isSubmitting, bool isPristine,
            bool isDisabled, Either<Failure, Domain>? submitFailureOrSuccess)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Form form, bool isSubmitting, bool isPristine,
            bool isDisabled, Either<Failure, Domain>? submitFailureOrSuccess)?
        $default, {
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ReactiveFormStateLoaded<Domain, Form> value) $default, {
    required TResult Function(ReactiveFormStateLoading<Domain, Form> value)
        loading,
    required TResult Function(ReactiveFormStateError<Domain, Form> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(ReactiveFormStateLoaded<Domain, Form> value)? $default, {
    TResult? Function(ReactiveFormStateLoading<Domain, Form> value)? loading,
    TResult? Function(ReactiveFormStateError<Domain, Form> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ReactiveFormStateLoaded<Domain, Form> value)? $default, {
    TResult Function(ReactiveFormStateLoading<Domain, Form> value)? loading,
    TResult Function(ReactiveFormStateError<Domain, Form> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ReactiveFormStateLoading<Domain,
        Form extends TypedFormGroup<Domain>>
    extends ReactiveFormState<Domain, Form> {
  const factory ReactiveFormStateLoading() =
      _$ReactiveFormStateLoading<Domain, Form>;
  const ReactiveFormStateLoading._() : super._();
}

/// @nodoc
abstract class _$$ReactiveFormStateErrorCopyWith<Domain,
    Form extends TypedFormGroup<Domain>, $Res> {
  factory _$$ReactiveFormStateErrorCopyWith(
          _$ReactiveFormStateError<Domain, Form> value,
          $Res Function(_$ReactiveFormStateError<Domain, Form>) then) =
      __$$ReactiveFormStateErrorCopyWithImpl<Domain, Form, $Res>;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class __$$ReactiveFormStateErrorCopyWithImpl<Domain,
        Form extends TypedFormGroup<Domain>, $Res>
    extends _$ReactiveFormStateCopyWithImpl<Domain, Form, $Res,
        _$ReactiveFormStateError<Domain, Form>>
    implements _$$ReactiveFormStateErrorCopyWith<Domain, Form, $Res> {
  __$$ReactiveFormStateErrorCopyWithImpl(
      _$ReactiveFormStateError<Domain, Form> _value,
      $Res Function(_$ReactiveFormStateError<Domain, Form>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$ReactiveFormStateError<Domain, Form>(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$ReactiveFormStateError<Domain, Form extends TypedFormGroup<Domain>>
    extends ReactiveFormStateError<Domain, Form> {
  const _$ReactiveFormStateError(this.failure) : super._();

  @override
  final Failure failure;

  @override
  String toString() {
    return 'ReactiveFormState<$Domain, $Form>.error(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReactiveFormStateError<Domain, Form> &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReactiveFormStateErrorCopyWith<Domain, Form,
          _$ReactiveFormStateError<Domain, Form>>
      get copyWith => __$$ReactiveFormStateErrorCopyWithImpl<Domain, Form,
          _$ReactiveFormStateError<Domain, Form>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Form form, bool isSubmitting, bool isPristine,
            bool isDisabled, Either<Failure, Domain>? submitFailureOrSuccess)
        $default, {
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Form form, bool isSubmitting, bool isPristine,
            bool isDisabled, Either<Failure, Domain>? submitFailureOrSuccess)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Form form, bool isSubmitting, bool isPristine,
            bool isDisabled, Either<Failure, Domain>? submitFailureOrSuccess)?
        $default, {
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ReactiveFormStateLoaded<Domain, Form> value) $default, {
    required TResult Function(ReactiveFormStateLoading<Domain, Form> value)
        loading,
    required TResult Function(ReactiveFormStateError<Domain, Form> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(ReactiveFormStateLoaded<Domain, Form> value)? $default, {
    TResult? Function(ReactiveFormStateLoading<Domain, Form> value)? loading,
    TResult? Function(ReactiveFormStateError<Domain, Form> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ReactiveFormStateLoaded<Domain, Form> value)? $default, {
    TResult Function(ReactiveFormStateLoading<Domain, Form> value)? loading,
    TResult Function(ReactiveFormStateError<Domain, Form> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ReactiveFormStateError<Domain,
        Form extends TypedFormGroup<Domain>>
    extends ReactiveFormState<Domain, Form> {
  const factory ReactiveFormStateError(final Failure failure) =
      _$ReactiveFormStateError<Domain, Form>;
  const ReactiveFormStateError._() : super._();

  Failure get failure;
  @JsonKey(ignore: true)
  _$$ReactiveFormStateErrorCopyWith<Domain, Form,
          _$ReactiveFormStateError<Domain, Form>>
      get copyWith => throw _privateConstructorUsedError;
}
