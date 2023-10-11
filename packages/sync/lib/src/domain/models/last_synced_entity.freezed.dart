// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'last_synced_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LastSyncedEntity {
  LastSyncedEntityId? get localId => throw _privateConstructorUsedError;

  /// The Timestamp of the last sync process.
  DateTime? get lastSyncedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LastSyncedEntityCopyWith<LastSyncedEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LastSyncedEntityCopyWith<$Res> {
  factory $LastSyncedEntityCopyWith(
          LastSyncedEntity value, $Res Function(LastSyncedEntity) then) =
      _$LastSyncedEntityCopyWithImpl<$Res, LastSyncedEntity>;
  @useResult
  $Res call({LastSyncedEntityId? localId, DateTime? lastSyncedAt});
}

/// @nodoc
class _$LastSyncedEntityCopyWithImpl<$Res, $Val extends LastSyncedEntity>
    implements $LastSyncedEntityCopyWith<$Res> {
  _$LastSyncedEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = freezed,
    Object? lastSyncedAt = freezed,
  }) {
    return _then(_value.copyWith(
      localId: freezed == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as LastSyncedEntityId?,
      lastSyncedAt: freezed == lastSyncedAt
          ? _value.lastSyncedAt
          : lastSyncedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LastSyncedEntityImplCopyWith<$Res>
    implements $LastSyncedEntityCopyWith<$Res> {
  factory _$$LastSyncedEntityImplCopyWith(_$LastSyncedEntityImpl value,
          $Res Function(_$LastSyncedEntityImpl) then) =
      __$$LastSyncedEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LastSyncedEntityId? localId, DateTime? lastSyncedAt});
}

/// @nodoc
class __$$LastSyncedEntityImplCopyWithImpl<$Res>
    extends _$LastSyncedEntityCopyWithImpl<$Res, _$LastSyncedEntityImpl>
    implements _$$LastSyncedEntityImplCopyWith<$Res> {
  __$$LastSyncedEntityImplCopyWithImpl(_$LastSyncedEntityImpl _value,
      $Res Function(_$LastSyncedEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = freezed,
    Object? lastSyncedAt = freezed,
  }) {
    return _then(_$LastSyncedEntityImpl(
      localId: freezed == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as LastSyncedEntityId?,
      lastSyncedAt: freezed == lastSyncedAt
          ? _value.lastSyncedAt
          : lastSyncedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$LastSyncedEntityImpl implements _LastSyncedEntity {
  _$LastSyncedEntityImpl({this.localId, required this.lastSyncedAt});

  @override
  final LastSyncedEntityId? localId;

  /// The Timestamp of the last sync process.
  @override
  final DateTime? lastSyncedAt;

  @override
  String toString() {
    return 'LastSyncedEntity(localId: $localId, lastSyncedAt: $lastSyncedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LastSyncedEntityImpl &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.lastSyncedAt, lastSyncedAt) ||
                other.lastSyncedAt == lastSyncedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, localId, lastSyncedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LastSyncedEntityImplCopyWith<_$LastSyncedEntityImpl> get copyWith =>
      __$$LastSyncedEntityImplCopyWithImpl<_$LastSyncedEntityImpl>(
          this, _$identity);
}

abstract class _LastSyncedEntity implements LastSyncedEntity {
  factory _LastSyncedEntity(
      {final LastSyncedEntityId? localId,
      required final DateTime? lastSyncedAt}) = _$LastSyncedEntityImpl;

  @override
  LastSyncedEntityId? get localId;
  @override

  /// The Timestamp of the last sync process.
  DateTime? get lastSyncedAt;
  @override
  @JsonKey(ignore: true)
  _$$LastSyncedEntityImplCopyWith<_$LastSyncedEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
