// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_error_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApiErrorResponse {
  DateTime? get timestamp => throw _privateConstructorUsedError;
  String? get exceptionType => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  ApiErrorAdditionalData? get additionalData =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApiErrorResponseCopyWith<ApiErrorResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiErrorResponseCopyWith<$Res> {
  factory $ApiErrorResponseCopyWith(
          ApiErrorResponse value, $Res Function(ApiErrorResponse) then) =
      _$ApiErrorResponseCopyWithImpl<$Res, ApiErrorResponse>;
  @useResult
  $Res call(
      {DateTime? timestamp,
      String? exceptionType,
      String? message,
      ApiErrorAdditionalData? additionalData});

  $ApiErrorAdditionalDataCopyWith<$Res>? get additionalData;
}

/// @nodoc
class _$ApiErrorResponseCopyWithImpl<$Res, $Val extends ApiErrorResponse>
    implements $ApiErrorResponseCopyWith<$Res> {
  _$ApiErrorResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = freezed,
    Object? exceptionType = freezed,
    Object? message = freezed,
    Object? additionalData = freezed,
  }) {
    return _then(_value.copyWith(
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      exceptionType: freezed == exceptionType
          ? _value.exceptionType
          : exceptionType // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalData: freezed == additionalData
          ? _value.additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as ApiErrorAdditionalData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ApiErrorAdditionalDataCopyWith<$Res>? get additionalData {
    if (_value.additionalData == null) {
      return null;
    }

    return $ApiErrorAdditionalDataCopyWith<$Res>(_value.additionalData!,
        (value) {
      return _then(_value.copyWith(additionalData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ApiErrorResponseCopyWith<$Res>
    implements $ApiErrorResponseCopyWith<$Res> {
  factory _$$_ApiErrorResponseCopyWith(
          _$_ApiErrorResponse value, $Res Function(_$_ApiErrorResponse) then) =
      __$$_ApiErrorResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? timestamp,
      String? exceptionType,
      String? message,
      ApiErrorAdditionalData? additionalData});

  @override
  $ApiErrorAdditionalDataCopyWith<$Res>? get additionalData;
}

/// @nodoc
class __$$_ApiErrorResponseCopyWithImpl<$Res>
    extends _$ApiErrorResponseCopyWithImpl<$Res, _$_ApiErrorResponse>
    implements _$$_ApiErrorResponseCopyWith<$Res> {
  __$$_ApiErrorResponseCopyWithImpl(
      _$_ApiErrorResponse _value, $Res Function(_$_ApiErrorResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = freezed,
    Object? exceptionType = freezed,
    Object? message = freezed,
    Object? additionalData = freezed,
  }) {
    return _then(_$_ApiErrorResponse(
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      exceptionType: freezed == exceptionType
          ? _value.exceptionType
          : exceptionType // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalData: freezed == additionalData
          ? _value.additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as ApiErrorAdditionalData?,
    ));
  }
}

/// @nodoc

class _$_ApiErrorResponse implements _ApiErrorResponse {
  const _$_ApiErrorResponse(
      {required this.timestamp,
      required this.exceptionType,
      required this.message,
      required this.additionalData});

  @override
  final DateTime? timestamp;
  @override
  final String? exceptionType;
  @override
  final String? message;
  @override
  final ApiErrorAdditionalData? additionalData;

  @override
  String toString() {
    return 'ApiErrorResponse(timestamp: $timestamp, exceptionType: $exceptionType, message: $message, additionalData: $additionalData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiErrorResponse &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.exceptionType, exceptionType) ||
                other.exceptionType == exceptionType) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.additionalData, additionalData) ||
                other.additionalData == additionalData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, timestamp, exceptionType, message, additionalData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiErrorResponseCopyWith<_$_ApiErrorResponse> get copyWith =>
      __$$_ApiErrorResponseCopyWithImpl<_$_ApiErrorResponse>(this, _$identity);
}

abstract class _ApiErrorResponse implements ApiErrorResponse {
  const factory _ApiErrorResponse(
          {required final DateTime? timestamp,
          required final String? exceptionType,
          required final String? message,
          required final ApiErrorAdditionalData? additionalData}) =
      _$_ApiErrorResponse;

  @override
  DateTime? get timestamp;
  @override
  String? get exceptionType;
  @override
  String? get message;
  @override
  ApiErrorAdditionalData? get additionalData;
  @override
  @JsonKey(ignore: true)
  _$$_ApiErrorResponseCopyWith<_$_ApiErrorResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ApiErrorAdditionalData {
  String? get entityId => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApiErrorAdditionalDataCopyWith<ApiErrorAdditionalData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiErrorAdditionalDataCopyWith<$Res> {
  factory $ApiErrorAdditionalDataCopyWith(ApiErrorAdditionalData value,
          $Res Function(ApiErrorAdditionalData) then) =
      _$ApiErrorAdditionalDataCopyWithImpl<$Res, ApiErrorAdditionalData>;
  @useResult
  $Res call({String? entityId, String? value});
}

/// @nodoc
class _$ApiErrorAdditionalDataCopyWithImpl<$Res,
        $Val extends ApiErrorAdditionalData>
    implements $ApiErrorAdditionalDataCopyWith<$Res> {
  _$ApiErrorAdditionalDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityId = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      entityId: freezed == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApiErrorAdditionalDataCopyWith<$Res>
    implements $ApiErrorAdditionalDataCopyWith<$Res> {
  factory _$$_ApiErrorAdditionalDataCopyWith(_$_ApiErrorAdditionalData value,
          $Res Function(_$_ApiErrorAdditionalData) then) =
      __$$_ApiErrorAdditionalDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? entityId, String? value});
}

/// @nodoc
class __$$_ApiErrorAdditionalDataCopyWithImpl<$Res>
    extends _$ApiErrorAdditionalDataCopyWithImpl<$Res,
        _$_ApiErrorAdditionalData>
    implements _$$_ApiErrorAdditionalDataCopyWith<$Res> {
  __$$_ApiErrorAdditionalDataCopyWithImpl(_$_ApiErrorAdditionalData _value,
      $Res Function(_$_ApiErrorAdditionalData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityId = freezed,
    Object? value = freezed,
  }) {
    return _then(_$_ApiErrorAdditionalData(
      entityId: freezed == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ApiErrorAdditionalData implements _ApiErrorAdditionalData {
  const _$_ApiErrorAdditionalData(
      {required this.entityId, required this.value});

  @override
  final String? entityId;
  @override
  final String? value;

  @override
  String toString() {
    return 'ApiErrorAdditionalData(entityId: $entityId, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiErrorAdditionalData &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, entityId, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiErrorAdditionalDataCopyWith<_$_ApiErrorAdditionalData> get copyWith =>
      __$$_ApiErrorAdditionalDataCopyWithImpl<_$_ApiErrorAdditionalData>(
          this, _$identity);
}

abstract class _ApiErrorAdditionalData implements ApiErrorAdditionalData {
  const factory _ApiErrorAdditionalData(
      {required final String? entityId,
      required final String? value}) = _$_ApiErrorAdditionalData;

  @override
  String? get entityId;
  @override
  String? get value;
  @override
  @JsonKey(ignore: true)
  _$$_ApiErrorAdditionalDataCopyWith<_$_ApiErrorAdditionalData> get copyWith =>
      throw _privateConstructorUsedError;
}
