// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Todo {
  TodoLocalId? get localId => throw _privateConstructorUsedError;
  TodoRemoteId? get remoteId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Set<String> get tags => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  TodoLocalId? get localParentId => throw _privateConstructorUsedError;
  TodoRemoteId? get remoteParentId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  SyncStatus get syncStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoCopyWith<Todo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoCopyWith<$Res> {
  factory $TodoCopyWith(Todo value, $Res Function(Todo) then) =
      _$TodoCopyWithImpl<$Res, Todo>;
  @useResult
  $Res call(
      {TodoLocalId? localId,
      TodoRemoteId? remoteId,
      String title,
      String description,
      Set<String> tags,
      bool isCompleted,
      TodoLocalId? localParentId,
      TodoRemoteId? remoteParentId,
      DateTime createdAt,
      DateTime updatedAt,
      SyncStatus syncStatus});
}

/// @nodoc
class _$TodoCopyWithImpl<$Res, $Val extends Todo>
    implements $TodoCopyWith<$Res> {
  _$TodoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = freezed,
    Object? remoteId = freezed,
    Object? title = null,
    Object? description = null,
    Object? tags = null,
    Object? isCompleted = null,
    Object? localParentId = freezed,
    Object? remoteParentId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? syncStatus = null,
  }) {
    return _then(_value.copyWith(
      localId: freezed == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as TodoLocalId?,
      remoteId: freezed == remoteId
          ? _value.remoteId
          : remoteId // ignore: cast_nullable_to_non_nullable
              as TodoRemoteId?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      localParentId: freezed == localParentId
          ? _value.localParentId
          : localParentId // ignore: cast_nullable_to_non_nullable
              as TodoLocalId?,
      remoteParentId: freezed == remoteParentId
          ? _value.remoteParentId
          : remoteParentId // ignore: cast_nullable_to_non_nullable
              as TodoRemoteId?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      syncStatus: null == syncStatus
          ? _value.syncStatus
          : syncStatus // ignore: cast_nullable_to_non_nullable
              as SyncStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodoCopyWith<$Res> implements $TodoCopyWith<$Res> {
  factory _$$_TodoCopyWith(_$_Todo value, $Res Function(_$_Todo) then) =
      __$$_TodoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TodoLocalId? localId,
      TodoRemoteId? remoteId,
      String title,
      String description,
      Set<String> tags,
      bool isCompleted,
      TodoLocalId? localParentId,
      TodoRemoteId? remoteParentId,
      DateTime createdAt,
      DateTime updatedAt,
      SyncStatus syncStatus});
}

/// @nodoc
class __$$_TodoCopyWithImpl<$Res> extends _$TodoCopyWithImpl<$Res, _$_Todo>
    implements _$$_TodoCopyWith<$Res> {
  __$$_TodoCopyWithImpl(_$_Todo _value, $Res Function(_$_Todo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = freezed,
    Object? remoteId = freezed,
    Object? title = null,
    Object? description = null,
    Object? tags = null,
    Object? isCompleted = null,
    Object? localParentId = freezed,
    Object? remoteParentId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? syncStatus = null,
  }) {
    return _then(_$_Todo(
      localId: freezed == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as TodoLocalId?,
      remoteId: freezed == remoteId
          ? _value.remoteId
          : remoteId // ignore: cast_nullable_to_non_nullable
              as TodoRemoteId?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      localParentId: freezed == localParentId
          ? _value.localParentId
          : localParentId // ignore: cast_nullable_to_non_nullable
              as TodoLocalId?,
      remoteParentId: freezed == remoteParentId
          ? _value.remoteParentId
          : remoteParentId // ignore: cast_nullable_to_non_nullable
              as TodoRemoteId?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      syncStatus: null == syncStatus
          ? _value.syncStatus
          : syncStatus // ignore: cast_nullable_to_non_nullable
              as SyncStatus,
    ));
  }
}

/// @nodoc

class _$_Todo implements _Todo {
  const _$_Todo(
      {required this.localId,
      required this.remoteId,
      required this.title,
      required this.description,
      required final Set<String> tags,
      required this.isCompleted,
      required this.localParentId,
      required this.remoteParentId,
      required this.createdAt,
      required this.updatedAt,
      required this.syncStatus})
      : _tags = tags;

  @override
  final TodoLocalId? localId;
  @override
  final TodoRemoteId? remoteId;
  @override
  final String title;
  @override
  final String description;
  final Set<String> _tags;
  @override
  Set<String> get tags {
    if (_tags is EqualUnmodifiableSetView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_tags);
  }

  @override
  final bool isCompleted;
  @override
  final TodoLocalId? localParentId;
  @override
  final TodoRemoteId? remoteParentId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final SyncStatus syncStatus;

  @override
  String toString() {
    return 'Todo(localId: $localId, remoteId: $remoteId, title: $title, description: $description, tags: $tags, isCompleted: $isCompleted, localParentId: $localParentId, remoteParentId: $remoteParentId, createdAt: $createdAt, updatedAt: $updatedAt, syncStatus: $syncStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Todo &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.remoteId, remoteId) ||
                other.remoteId == remoteId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.localParentId, localParentId) ||
                other.localParentId == localParentId) &&
            (identical(other.remoteParentId, remoteParentId) ||
                other.remoteParentId == remoteParentId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      localId,
      remoteId,
      title,
      description,
      const DeepCollectionEquality().hash(_tags),
      isCompleted,
      localParentId,
      remoteParentId,
      createdAt,
      updatedAt,
      syncStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoCopyWith<_$_Todo> get copyWith =>
      __$$_TodoCopyWithImpl<_$_Todo>(this, _$identity);
}

abstract class _Todo implements Todo {
  const factory _Todo(
      {required final TodoLocalId? localId,
      required final TodoRemoteId? remoteId,
      required final String title,
      required final String description,
      required final Set<String> tags,
      required final bool isCompleted,
      required final TodoLocalId? localParentId,
      required final TodoRemoteId? remoteParentId,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final SyncStatus syncStatus}) = _$_Todo;

  @override
  TodoLocalId? get localId;
  @override
  TodoRemoteId? get remoteId;
  @override
  String get title;
  @override
  String get description;
  @override
  Set<String> get tags;
  @override
  bool get isCompleted;
  @override
  TodoLocalId? get localParentId;
  @override
  TodoRemoteId? get remoteParentId;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  SyncStatus get syncStatus;
  @override
  @JsonKey(ignore: true)
  _$$_TodoCopyWith<_$_Todo> get copyWith => throw _privateConstructorUsedError;
}
