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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReactiveFormState<TFailure, TDomain,
    TFormGroup extends TypedFormGroup<TDomain>> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(TFormGroup form, bool isSubmitting, bool isPristine,
            bool isDisabled, Either<TFailure, TDomain>? submitFailureOrSuccess)
        $default, {
    required TResult Function() loading,
    required TResult Function(TFailure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(TFormGroup form, bool isSubmitting, bool isPristine,
            bool isDisabled, Either<TFailure, TDomain>? submitFailureOrSuccess)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(TFailure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(TFormGroup form, bool isSubmitting, bool isPristine,
            bool isDisabled, Either<TFailure, TDomain>? submitFailureOrSuccess)?
        $default, {
    TResult Function()? loading,
    TResult Function(TFailure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(
            ReactiveFormStateLoaded<TFailure, TDomain, TFormGroup> value)
        $default, {
    required TResult Function(
            ReactiveFormStateLoading<TFailure, TDomain, TFormGroup> value)
        loading,
    required TResult Function(
            ReactiveFormStateError<TFailure, TDomain, TFormGroup> value)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(
            ReactiveFormStateLoaded<TFailure, TDomain, TFormGroup> value)?
        $default, {
    TResult? Function(
            ReactiveFormStateLoading<TFailure, TDomain, TFormGroup> value)?
        loading,
    TResult? Function(
            ReactiveFormStateError<TFailure, TDomain, TFormGroup> value)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(
            ReactiveFormStateLoaded<TFailure, TDomain, TFormGroup> value)?
        $default, {
    TResult Function(
            ReactiveFormStateLoading<TFailure, TDomain, TFormGroup> value)?
        loading,
    TResult Function(
            ReactiveFormStateError<TFailure, TDomain, TFormGroup> value)?
        error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReactiveFormStateCopyWith<TFailure, TDomain,
    TFormGroup extends TypedFormGroup<TDomain>, $Res> {
  factory $ReactiveFormStateCopyWith(
      ReactiveFormState<TFailure, TDomain, TFormGroup> value,
      $Res Function(ReactiveFormState<TFailure, TDomain, TFormGroup>)
          then) = _$ReactiveFormStateCopyWithImpl<TFailure, TDomain, TFormGroup,
      $Res, ReactiveFormState<TFailure, TDomain, TFormGroup>>;
}

/// @nodoc
class _$ReactiveFormStateCopyWithImpl<
        TFailure,
        TDomain,
        TFormGroup extends TypedFormGroup<TDomain>,
        $Res,
        $Val extends ReactiveFormState<TFailure, TDomain, TFormGroup>>
    implements $ReactiveFormStateCopyWith<TFailure, TDomain, TFormGroup, $Res> {
  _$ReactiveFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ReactiveFormStateLoadedImplCopyWith<TFailure, TDomain,
    TFormGroup extends TypedFormGroup<TDomain>, $Res> {
  factory _$$ReactiveFormStateLoadedImplCopyWith(
      _$ReactiveFormStateLoadedImpl<TFailure, TDomain, TFormGroup> value,
      $Res Function(
              _$ReactiveFormStateLoadedImpl<TFailure, TDomain, TFormGroup>)
          then) = __$$ReactiveFormStateLoadedImplCopyWithImpl<TFailure, TDomain,
      TFormGroup, $Res>;
  @useResult
  $Res call(
      {TFormGroup form,
      bool isSubmitting,
      bool isPristine,
      bool isDisabled,
      Either<TFailure, TDomain>? submitFailureOrSuccess});
}

/// @nodoc
class __$$ReactiveFormStateLoadedImplCopyWithImpl<TFailure, TDomain,
        TFormGroup extends TypedFormGroup<TDomain>, $Res>
    extends _$ReactiveFormStateCopyWithImpl<TFailure, TDomain, TFormGroup, $Res,
        _$ReactiveFormStateLoadedImpl<TFailure, TDomain, TFormGroup>>
    implements
        _$$ReactiveFormStateLoadedImplCopyWith<TFailure, TDomain, TFormGroup,
            $Res> {
  __$$ReactiveFormStateLoadedImplCopyWithImpl(
      _$ReactiveFormStateLoadedImpl<TFailure, TDomain, TFormGroup> _value,
      $Res Function(
              _$ReactiveFormStateLoadedImpl<TFailure, TDomain, TFormGroup>)
          _then)
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
    return _then(_$ReactiveFormStateLoadedImpl<TFailure, TDomain, TFormGroup>(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as TFormGroup,
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
              as Either<TFailure, TDomain>?,
    ));
  }
}

/// @nodoc

class _$ReactiveFormStateLoadedImpl<TFailure, TDomain,
        TFormGroup extends TypedFormGroup<TDomain>>
    extends ReactiveFormStateLoaded<TFailure, TDomain, TFormGroup> {
  const _$ReactiveFormStateLoadedImpl(
      {required this.form,
      required this.isSubmitting,
      required this.isPristine,
      required this.isDisabled,
      required this.submitFailureOrSuccess})
      : super._();

  @override
  final TFormGroup form;
  @override
  final bool isSubmitting;
  @override
  final bool isPristine;
  @override
  final bool isDisabled;
  @override
  final Either<TFailure, TDomain>? submitFailureOrSuccess;

  @override
  String toString() {
    return 'ReactiveFormState<$TFailure, $TDomain, $TFormGroup>(form: $form, isSubmitting: $isSubmitting, isPristine: $isPristine, isDisabled: $isDisabled, submitFailureOrSuccess: $submitFailureOrSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReactiveFormStateLoadedImpl<TFailure, TDomain,
                TFormGroup> &&
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
  _$$ReactiveFormStateLoadedImplCopyWith<TFailure, TDomain, TFormGroup,
          _$ReactiveFormStateLoadedImpl<TFailure, TDomain, TFormGroup>>
      get copyWith => __$$ReactiveFormStateLoadedImplCopyWithImpl<
              TFailure,
              TDomain,
              TFormGroup,
              _$ReactiveFormStateLoadedImpl<TFailure, TDomain, TFormGroup>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(TFormGroup form, bool isSubmitting, bool isPristine,
            bool isDisabled, Either<TFailure, TDomain>? submitFailureOrSuccess)
        $default, {
    required TResult Function() loading,
    required TResult Function(TFailure failure) error,
  }) {
    return $default(
        form, isSubmitting, isPristine, isDisabled, submitFailureOrSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(TFormGroup form, bool isSubmitting, bool isPristine,
            bool isDisabled, Either<TFailure, TDomain>? submitFailureOrSuccess)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(TFailure failure)? error,
  }) {
    return $default?.call(
        form, isSubmitting, isPristine, isDisabled, submitFailureOrSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(TFormGroup form, bool isSubmitting, bool isPristine,
            bool isDisabled, Either<TFailure, TDomain>? submitFailureOrSuccess)?
        $default, {
    TResult Function()? loading,
    TResult Function(TFailure failure)? error,
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
    TResult Function(
            ReactiveFormStateLoaded<TFailure, TDomain, TFormGroup> value)
        $default, {
    required TResult Function(
            ReactiveFormStateLoading<TFailure, TDomain, TFormGroup> value)
        loading,
    required TResult Function(
            ReactiveFormStateError<TFailure, TDomain, TFormGroup> value)
        error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(
            ReactiveFormStateLoaded<TFailure, TDomain, TFormGroup> value)?
        $default, {
    TResult? Function(
            ReactiveFormStateLoading<TFailure, TDomain, TFormGroup> value)?
        loading,
    TResult? Function(
            ReactiveFormStateError<TFailure, TDomain, TFormGroup> value)?
        error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(
            ReactiveFormStateLoaded<TFailure, TDomain, TFormGroup> value)?
        $default, {
    TResult Function(
            ReactiveFormStateLoading<TFailure, TDomain, TFormGroup> value)?
        loading,
    TResult Function(
            ReactiveFormStateError<TFailure, TDomain, TFormGroup> value)?
        error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class ReactiveFormStateLoaded<TFailure, TDomain,
        TFormGroup extends TypedFormGroup<TDomain>>
    extends ReactiveFormState<TFailure, TDomain, TFormGroup> {
  const factory ReactiveFormStateLoaded(
          {required final TFormGroup form,
          required final bool isSubmitting,
          required final bool isPristine,
          required final bool isDisabled,
          required final Either<TFailure, TDomain>? submitFailureOrSuccess}) =
      _$ReactiveFormStateLoadedImpl<TFailure, TDomain, TFormGroup>;
  const ReactiveFormStateLoaded._() : super._();

  TFormGroup get form;
  bool get isSubmitting;
  bool get isPristine;
  bool get isDisabled;
  Either<TFailure, TDomain>? get submitFailureOrSuccess;
  @JsonKey(ignore: true)
  _$$ReactiveFormStateLoadedImplCopyWith<TFailure, TDomain, TFormGroup,
          _$ReactiveFormStateLoadedImpl<TFailure, TDomain, TFormGroup>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReactiveFormStateLoadingImplCopyWith<TFailure, TDomain,
    TFormGroup extends TypedFormGroup<TDomain>, $Res> {
  factory _$$ReactiveFormStateLoadingImplCopyWith(
      _$ReactiveFormStateLoadingImpl<TFailure, TDomain, TFormGroup> value,
      $Res Function(
              _$ReactiveFormStateLoadingImpl<TFailure, TDomain, TFormGroup>)
          then) = __$$ReactiveFormStateLoadingImplCopyWithImpl<TFailure,
      TDomain, TFormGroup, $Res>;
}

/// @nodoc
class __$$ReactiveFormStateLoadingImplCopyWithImpl<TFailure, TDomain,
        TFormGroup extends TypedFormGroup<TDomain>, $Res>
    extends _$ReactiveFormStateCopyWithImpl<TFailure, TDomain, TFormGroup, $Res,
        _$ReactiveFormStateLoadingImpl<TFailure, TDomain, TFormGroup>>
    implements
        _$$ReactiveFormStateLoadingImplCopyWith<TFailure, TDomain, TFormGroup,
            $Res> {
  __$$ReactiveFormStateLoadingImplCopyWithImpl(
      _$ReactiveFormStateLoadingImpl<TFailure, TDomain, TFormGroup> _value,
      $Res Function(
              _$ReactiveFormStateLoadingImpl<TFailure, TDomain, TFormGroup>)
          _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReactiveFormStateLoadingImpl<TFailure, TDomain,
        TFormGroup extends TypedFormGroup<TDomain>>
    extends ReactiveFormStateLoading<TFailure, TDomain, TFormGroup> {
  const _$ReactiveFormStateLoadingImpl() : super._();

  @override
  String toString() {
    return 'ReactiveFormState<$TFailure, $TDomain, $TFormGroup>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReactiveFormStateLoadingImpl<TFailure, TDomain,
                TFormGroup>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(TFormGroup form, bool isSubmitting, bool isPristine,
            bool isDisabled, Either<TFailure, TDomain>? submitFailureOrSuccess)
        $default, {
    required TResult Function() loading,
    required TResult Function(TFailure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(TFormGroup form, bool isSubmitting, bool isPristine,
            bool isDisabled, Either<TFailure, TDomain>? submitFailureOrSuccess)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(TFailure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(TFormGroup form, bool isSubmitting, bool isPristine,
            bool isDisabled, Either<TFailure, TDomain>? submitFailureOrSuccess)?
        $default, {
    TResult Function()? loading,
    TResult Function(TFailure failure)? error,
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
    TResult Function(
            ReactiveFormStateLoaded<TFailure, TDomain, TFormGroup> value)
        $default, {
    required TResult Function(
            ReactiveFormStateLoading<TFailure, TDomain, TFormGroup> value)
        loading,
    required TResult Function(
            ReactiveFormStateError<TFailure, TDomain, TFormGroup> value)
        error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(
            ReactiveFormStateLoaded<TFailure, TDomain, TFormGroup> value)?
        $default, {
    TResult? Function(
            ReactiveFormStateLoading<TFailure, TDomain, TFormGroup> value)?
        loading,
    TResult? Function(
            ReactiveFormStateError<TFailure, TDomain, TFormGroup> value)?
        error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(
            ReactiveFormStateLoaded<TFailure, TDomain, TFormGroup> value)?
        $default, {
    TResult Function(
            ReactiveFormStateLoading<TFailure, TDomain, TFormGroup> value)?
        loading,
    TResult Function(
            ReactiveFormStateError<TFailure, TDomain, TFormGroup> value)?
        error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ReactiveFormStateLoading<TFailure, TDomain,
        TFormGroup extends TypedFormGroup<TDomain>>
    extends ReactiveFormState<TFailure, TDomain, TFormGroup> {
  const factory ReactiveFormStateLoading() =
      _$ReactiveFormStateLoadingImpl<TFailure, TDomain, TFormGroup>;
  const ReactiveFormStateLoading._() : super._();
}

/// @nodoc
abstract class _$$ReactiveFormStateErrorImplCopyWith<TFailure, TDomain,
    TFormGroup extends TypedFormGroup<TDomain>, $Res> {
  factory _$$ReactiveFormStateErrorImplCopyWith(
      _$ReactiveFormStateErrorImpl<TFailure, TDomain, TFormGroup> value,
      $Res Function(_$ReactiveFormStateErrorImpl<TFailure, TDomain, TFormGroup>)
          then) = __$$ReactiveFormStateErrorImplCopyWithImpl<TFailure, TDomain,
      TFormGroup, $Res>;
  @useResult
  $Res call({TFailure failure});
}

/// @nodoc
class __$$ReactiveFormStateErrorImplCopyWithImpl<TFailure, TDomain,
        TFormGroup extends TypedFormGroup<TDomain>, $Res>
    extends _$ReactiveFormStateCopyWithImpl<TFailure, TDomain, TFormGroup, $Res,
        _$ReactiveFormStateErrorImpl<TFailure, TDomain, TFormGroup>>
    implements
        _$$ReactiveFormStateErrorImplCopyWith<TFailure, TDomain, TFormGroup,
            $Res> {
  __$$ReactiveFormStateErrorImplCopyWithImpl(
      _$ReactiveFormStateErrorImpl<TFailure, TDomain, TFormGroup> _value,
      $Res Function(_$ReactiveFormStateErrorImpl<TFailure, TDomain, TFormGroup>)
          _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_$ReactiveFormStateErrorImpl<TFailure, TDomain, TFormGroup>(
      freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as TFailure,
    ));
  }
}

/// @nodoc

class _$ReactiveFormStateErrorImpl<TFailure, TDomain,
        TFormGroup extends TypedFormGroup<TDomain>>
    extends ReactiveFormStateError<TFailure, TDomain, TFormGroup> {
  const _$ReactiveFormStateErrorImpl(this.failure) : super._();

  @override
  final TFailure failure;

  @override
  String toString() {
    return 'ReactiveFormState<$TFailure, $TDomain, $TFormGroup>.error(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReactiveFormStateErrorImpl<TFailure, TDomain,
                TFormGroup> &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReactiveFormStateErrorImplCopyWith<TFailure, TDomain, TFormGroup,
          _$ReactiveFormStateErrorImpl<TFailure, TDomain, TFormGroup>>
      get copyWith => __$$ReactiveFormStateErrorImplCopyWithImpl<
              TFailure,
              TDomain,
              TFormGroup,
              _$ReactiveFormStateErrorImpl<TFailure, TDomain, TFormGroup>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(TFormGroup form, bool isSubmitting, bool isPristine,
            bool isDisabled, Either<TFailure, TDomain>? submitFailureOrSuccess)
        $default, {
    required TResult Function() loading,
    required TResult Function(TFailure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(TFormGroup form, bool isSubmitting, bool isPristine,
            bool isDisabled, Either<TFailure, TDomain>? submitFailureOrSuccess)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(TFailure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(TFormGroup form, bool isSubmitting, bool isPristine,
            bool isDisabled, Either<TFailure, TDomain>? submitFailureOrSuccess)?
        $default, {
    TResult Function()? loading,
    TResult Function(TFailure failure)? error,
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
    TResult Function(
            ReactiveFormStateLoaded<TFailure, TDomain, TFormGroup> value)
        $default, {
    required TResult Function(
            ReactiveFormStateLoading<TFailure, TDomain, TFormGroup> value)
        loading,
    required TResult Function(
            ReactiveFormStateError<TFailure, TDomain, TFormGroup> value)
        error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(
            ReactiveFormStateLoaded<TFailure, TDomain, TFormGroup> value)?
        $default, {
    TResult? Function(
            ReactiveFormStateLoading<TFailure, TDomain, TFormGroup> value)?
        loading,
    TResult? Function(
            ReactiveFormStateError<TFailure, TDomain, TFormGroup> value)?
        error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(
            ReactiveFormStateLoaded<TFailure, TDomain, TFormGroup> value)?
        $default, {
    TResult Function(
            ReactiveFormStateLoading<TFailure, TDomain, TFormGroup> value)?
        loading,
    TResult Function(
            ReactiveFormStateError<TFailure, TDomain, TFormGroup> value)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ReactiveFormStateError<TFailure, TDomain,
        TFormGroup extends TypedFormGroup<TDomain>>
    extends ReactiveFormState<TFailure, TDomain, TFormGroup> {
  const factory ReactiveFormStateError(final TFailure failure) =
      _$ReactiveFormStateErrorImpl<TFailure, TDomain, TFormGroup>;
  const ReactiveFormStateError._() : super._();

  TFailure get failure;
  @JsonKey(ignore: true)
  _$$ReactiveFormStateErrorImplCopyWith<TFailure, TDomain, TFormGroup,
          _$ReactiveFormStateErrorImpl<TFailure, TDomain, TFormGroup>>
      get copyWith => throw _privateConstructorUsedError;
}
