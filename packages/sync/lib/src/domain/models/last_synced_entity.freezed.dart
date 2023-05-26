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
  int? get id => throw _privateConstructorUsedError;

  /// The type of entity that is represented by this last synced entity.
  SyncEntityType get entityType => throw _privateConstructorUsedError;

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
  $Res call({int? id, SyncEntityType entityType, DateTime? lastSyncedAt});
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
    Object? id = freezed,
    Object? entityType = null,
    Object? lastSyncedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      entityType: null == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as SyncEntityType,
      lastSyncedAt: freezed == lastSyncedAt
          ? _value.lastSyncedAt
          : lastSyncedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LastSyncedEntityCopyWith<$Res>
    implements $LastSyncedEntityCopyWith<$Res> {
  factory _$$_LastSyncedEntityCopyWith(
          _$_LastSyncedEntity value, $Res Function(_$_LastSyncedEntity) then) =
      __$$_LastSyncedEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, SyncEntityType entityType, DateTime? lastSyncedAt});
}

/// @nodoc
class __$$_LastSyncedEntityCopyWithImpl<$Res>
    extends _$LastSyncedEntityCopyWithImpl<$Res, _$_LastSyncedEntity>
    implements _$$_LastSyncedEntityCopyWith<$Res> {
  __$$_LastSyncedEntityCopyWithImpl(
      _$_LastSyncedEntity _value, $Res Function(_$_LastSyncedEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? entityType = null,
    Object? lastSyncedAt = freezed,
  }) {
    return _then(_$_LastSyncedEntity(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      entityType: null == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as SyncEntityType,
      lastSyncedAt: freezed == lastSyncedAt
          ? _value.lastSyncedAt
          : lastSyncedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_LastSyncedEntity implements _LastSyncedEntity {
  _$_LastSyncedEntity(
      {required this.id, required this.entityType, required this.lastSyncedAt});

  @override
  final int? id;

  /// The type of entity that is represented by this last synced entity.
  @override
  final SyncEntityType entityType;

  /// The Timestamp of the last sync process.
  @override
  final DateTime? lastSyncedAt;

  @override
  String toString() {
    return 'LastSyncedEntity(id: $id, entityType: $entityType, lastSyncedAt: $lastSyncedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LastSyncedEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.lastSyncedAt, lastSyncedAt) ||
                other.lastSyncedAt == lastSyncedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, entityType, lastSyncedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LastSyncedEntityCopyWith<_$_LastSyncedEntity> get copyWith =>
      __$$_LastSyncedEntityCopyWithImpl<_$_LastSyncedEntity>(this, _$identity);
}

abstract class _LastSyncedEntity implements LastSyncedEntity {
  factory _LastSyncedEntity(
      {required final int? id,
      required final SyncEntityType entityType,
      required final DateTime? lastSyncedAt}) = _$_LastSyncedEntity;

  @override
  int? get id;
  @override

  /// The type of entity that is represented by this last synced entity.
  SyncEntityType get entityType;
  @override

  /// The Timestamp of the last sync process.
  DateTime? get lastSyncedAt;
  @override
  @JsonKey(ignore: true)
  _$$_LastSyncedEntityCopyWith<_$_LastSyncedEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
