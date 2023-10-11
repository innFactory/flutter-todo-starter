// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SyncEntity {
  /// The local id of the entity.
  int get entityLocalId => throw _privateConstructorUsedError;

  /// The type of entity that is represented by this sync entity.
  SyncEntityType get entityType => throw _privateConstructorUsedError;

  /// When this entity was modified locally.
  DateTime get modifiedAt => throw _privateConstructorUsedError;

  /// The error code that represents the failure of a failed sync attempt.
  String? get errorCode => throw _privateConstructorUsedError;

  /// Whether the changes that were made to the entity should be reverted.
  bool get revertChanges => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SyncEntityCopyWith<SyncEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncEntityCopyWith<$Res> {
  factory $SyncEntityCopyWith(
          SyncEntity value, $Res Function(SyncEntity) then) =
      _$SyncEntityCopyWithImpl<$Res, SyncEntity>;
  @useResult
  $Res call(
      {int entityLocalId,
      SyncEntityType entityType,
      DateTime modifiedAt,
      String? errorCode,
      bool revertChanges});
}

/// @nodoc
class _$SyncEntityCopyWithImpl<$Res, $Val extends SyncEntity>
    implements $SyncEntityCopyWith<$Res> {
  _$SyncEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityLocalId = null,
    Object? entityType = null,
    Object? modifiedAt = null,
    Object? errorCode = freezed,
    Object? revertChanges = null,
  }) {
    return _then(_value.copyWith(
      entityLocalId: null == entityLocalId
          ? _value.entityLocalId
          : entityLocalId // ignore: cast_nullable_to_non_nullable
              as int,
      entityType: null == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as SyncEntityType,
      modifiedAt: null == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      errorCode: freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      revertChanges: null == revertChanges
          ? _value.revertChanges
          : revertChanges // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SyncEntityImplCopyWith<$Res>
    implements $SyncEntityCopyWith<$Res> {
  factory _$$SyncEntityImplCopyWith(
          _$SyncEntityImpl value, $Res Function(_$SyncEntityImpl) then) =
      __$$SyncEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int entityLocalId,
      SyncEntityType entityType,
      DateTime modifiedAt,
      String? errorCode,
      bool revertChanges});
}

/// @nodoc
class __$$SyncEntityImplCopyWithImpl<$Res>
    extends _$SyncEntityCopyWithImpl<$Res, _$SyncEntityImpl>
    implements _$$SyncEntityImplCopyWith<$Res> {
  __$$SyncEntityImplCopyWithImpl(
      _$SyncEntityImpl _value, $Res Function(_$SyncEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityLocalId = null,
    Object? entityType = null,
    Object? modifiedAt = null,
    Object? errorCode = freezed,
    Object? revertChanges = null,
  }) {
    return _then(_$SyncEntityImpl(
      entityLocalId: null == entityLocalId
          ? _value.entityLocalId
          : entityLocalId // ignore: cast_nullable_to_non_nullable
              as int,
      entityType: null == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as SyncEntityType,
      modifiedAt: null == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      errorCode: freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      revertChanges: null == revertChanges
          ? _value.revertChanges
          : revertChanges // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SyncEntityImpl implements _SyncEntity {
  _$SyncEntityImpl(
      {required this.entityLocalId,
      required this.entityType,
      required this.modifiedAt,
      required this.errorCode,
      required this.revertChanges});

  /// The local id of the entity.
  @override
  final int entityLocalId;

  /// The type of entity that is represented by this sync entity.
  @override
  final SyncEntityType entityType;

  /// When this entity was modified locally.
  @override
  final DateTime modifiedAt;

  /// The error code that represents the failure of a failed sync attempt.
  @override
  final String? errorCode;

  /// Whether the changes that were made to the entity should be reverted.
  @override
  final bool revertChanges;

  @override
  String toString() {
    return 'SyncEntity(entityLocalId: $entityLocalId, entityType: $entityType, modifiedAt: $modifiedAt, errorCode: $errorCode, revertChanges: $revertChanges)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncEntityImpl &&
            (identical(other.entityLocalId, entityLocalId) ||
                other.entityLocalId == entityLocalId) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode) &&
            (identical(other.revertChanges, revertChanges) ||
                other.revertChanges == revertChanges));
  }

  @override
  int get hashCode => Object.hash(runtimeType, entityLocalId, entityType,
      modifiedAt, errorCode, revertChanges);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncEntityImplCopyWith<_$SyncEntityImpl> get copyWith =>
      __$$SyncEntityImplCopyWithImpl<_$SyncEntityImpl>(this, _$identity);
}

abstract class _SyncEntity implements SyncEntity {
  factory _SyncEntity(
      {required final int entityLocalId,
      required final SyncEntityType entityType,
      required final DateTime modifiedAt,
      required final String? errorCode,
      required final bool revertChanges}) = _$SyncEntityImpl;

  @override

  /// The local id of the entity.
  int get entityLocalId;
  @override

  /// The type of entity that is represented by this sync entity.
  SyncEntityType get entityType;
  @override

  /// When this entity was modified locally.
  DateTime get modifiedAt;
  @override

  /// The error code that represents the failure of a failed sync attempt.
  String? get errorCode;
  @override

  /// Whether the changes that were made to the entity should be reverted.
  bool get revertChanges;
  @override
  @JsonKey(ignore: true)
  _$$SyncEntityImplCopyWith<_$SyncEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
