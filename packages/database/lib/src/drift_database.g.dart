// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $TodoTableTable extends TodoTable
    with TableInfo<$TodoTableTable, LocalTodo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta =
      const VerificationMeta('localId');
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
      'local_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'UNIQUE ON CONFLICT REPLACE');
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<bool> isCompleted =
      GeneratedColumn<bool>('is_completed', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_completed" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _localParentIdMeta =
      const VerificationMeta('localParentId');
  @override
  late final GeneratedColumn<int> localParentId = GeneratedColumn<int>(
      'local_parent_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _remoteParentIdMeta =
      const VerificationMeta('remoteParentId');
  @override
  late final GeneratedColumn<String> remoteParentId = GeneratedColumn<String>(
      'remote_parent_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> tags =
      GeneratedColumn<String>('tags', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($TodoTableTable.$convertertags);
  static const VerificationMeta _localCreatedAtMeta =
      const VerificationMeta('localCreatedAt');
  @override
  late final GeneratedColumn<DateTime> localCreatedAt =
      GeneratedColumn<DateTime>('local_created_at', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: currentDateAndTime);
  static const VerificationMeta _localUpdatedAtMeta =
      const VerificationMeta('localUpdatedAt');
  @override
  late final GeneratedColumn<DateTime> localUpdatedAt =
      GeneratedColumn<DateTime>('local_updated_at', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: currentDateAndTime);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _localSyncStatusMeta =
      const VerificationMeta('localSyncStatus');
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, String>
      localSyncStatus = GeneratedColumn<String>(
              'local_sync_status', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: Constant(SyncStatus.created.name))
          .withConverter<SyncStatus>($TodoTableTable.$converterlocalSyncStatus);
  @override
  List<GeneratedColumn> get $columns => [
        localId,
        remoteId,
        title,
        description,
        isCompleted,
        localParentId,
        remoteParentId,
        tags,
        localCreatedAt,
        localUpdatedAt,
        createdAt,
        updatedAt,
        localSyncStatus
      ];
  @override
  String get aliasedName => _alias ?? 'todo';
  @override
  String get actualTableName => 'todo';
  @override
  VerificationContext validateIntegrity(Insertable<LocalTodo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(_localIdMeta,
          localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    } else if (isInserting) {
      context.missing(_isCompletedMeta);
    }
    if (data.containsKey('local_parent_id')) {
      context.handle(
          _localParentIdMeta,
          localParentId.isAcceptableOrUnknown(
              data['local_parent_id']!, _localParentIdMeta));
    }
    if (data.containsKey('remote_parent_id')) {
      context.handle(
          _remoteParentIdMeta,
          remoteParentId.isAcceptableOrUnknown(
              data['remote_parent_id']!, _remoteParentIdMeta));
    }
    context.handle(_tagsMeta, const VerificationResult.success());
    if (data.containsKey('local_created_at')) {
      context.handle(
          _localCreatedAtMeta,
          localCreatedAt.isAcceptableOrUnknown(
              data['local_created_at']!, _localCreatedAtMeta));
    }
    if (data.containsKey('local_updated_at')) {
      context.handle(
          _localUpdatedAtMeta,
          localUpdatedAt.isAcceptableOrUnknown(
              data['local_updated_at']!, _localUpdatedAtMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    context.handle(_localSyncStatusMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  LocalTodo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalTodo(
      localId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}local_id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed'])!,
      localParentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}local_parent_id']),
      remoteParentId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}remote_parent_id']),
      tags: $TodoTableTable.$convertertags.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])!),
      localCreatedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}local_created_at'])!,
      localUpdatedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}local_updated_at'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      localSyncStatus: $TodoTableTable.$converterlocalSyncStatus.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}local_sync_status'])!),
    );
  }

  @override
  $TodoTableTable createAlias(String alias) {
    return $TodoTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertertags =
      const TagsConverter();
  static JsonTypeConverter2<SyncStatus, String, String>
      $converterlocalSyncStatus = const EnumNameConverter(SyncStatus.values);
}

class LocalTodo extends DataClass implements Insertable<LocalTodo> {
  final int localId;
  final String? remoteId;
  final String title;
  final String description;
  final bool isCompleted;
  final int? localParentId;
  final String? remoteParentId;
  final List<String> tags;
  final DateTime localCreatedAt;
  final DateTime localUpdatedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final SyncStatus localSyncStatus;
  const LocalTodo(
      {required this.localId,
      this.remoteId,
      required this.title,
      required this.description,
      required this.isCompleted,
      this.localParentId,
      this.remoteParentId,
      required this.tags,
      required this.localCreatedAt,
      required this.localUpdatedAt,
      this.createdAt,
      this.updatedAt,
      required this.localSyncStatus});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['is_completed'] = Variable<bool>(isCompleted);
    if (!nullToAbsent || localParentId != null) {
      map['local_parent_id'] = Variable<int>(localParentId);
    }
    if (!nullToAbsent || remoteParentId != null) {
      map['remote_parent_id'] = Variable<String>(remoteParentId);
    }
    {
      final converter = $TodoTableTable.$convertertags;
      map['tags'] = Variable<String>(converter.toSql(tags));
    }
    map['local_created_at'] = Variable<DateTime>(localCreatedAt);
    map['local_updated_at'] = Variable<DateTime>(localUpdatedAt);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    {
      final converter = $TodoTableTable.$converterlocalSyncStatus;
      map['local_sync_status'] =
          Variable<String>(converter.toSql(localSyncStatus));
    }
    return map;
  }

  TodoTableCompanion toCompanion(bool nullToAbsent) {
    return TodoTableCompanion(
      localId: Value(localId),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      title: Value(title),
      description: Value(description),
      isCompleted: Value(isCompleted),
      localParentId: localParentId == null && nullToAbsent
          ? const Value.absent()
          : Value(localParentId),
      remoteParentId: remoteParentId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteParentId),
      tags: Value(tags),
      localCreatedAt: Value(localCreatedAt),
      localUpdatedAt: Value(localUpdatedAt),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      localSyncStatus: Value(localSyncStatus),
    );
  }

  factory LocalTodo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalTodo(
      localId: serializer.fromJson<int>(json['localId']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      localParentId: serializer.fromJson<int?>(json['localParentId']),
      remoteParentId: serializer.fromJson<String?>(json['remoteParentId']),
      tags: serializer.fromJson<List<String>>(json['tags']),
      localCreatedAt: serializer.fromJson<DateTime>(json['localCreatedAt']),
      localUpdatedAt: serializer.fromJson<DateTime>(json['localUpdatedAt']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      localSyncStatus: $TodoTableTable.$converterlocalSyncStatus
          .fromJson(serializer.fromJson<String>(json['localSyncStatus'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'remoteId': serializer.toJson<String?>(remoteId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'localParentId': serializer.toJson<int?>(localParentId),
      'remoteParentId': serializer.toJson<String?>(remoteParentId),
      'tags': serializer.toJson<List<String>>(tags),
      'localCreatedAt': serializer.toJson<DateTime>(localCreatedAt),
      'localUpdatedAt': serializer.toJson<DateTime>(localUpdatedAt),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'localSyncStatus': serializer.toJson<String>(
          $TodoTableTable.$converterlocalSyncStatus.toJson(localSyncStatus)),
    };
  }

  LocalTodo copyWith(
          {int? localId,
          Value<String?> remoteId = const Value.absent(),
          String? title,
          String? description,
          bool? isCompleted,
          Value<int?> localParentId = const Value.absent(),
          Value<String?> remoteParentId = const Value.absent(),
          List<String>? tags,
          DateTime? localCreatedAt,
          DateTime? localUpdatedAt,
          Value<DateTime?> createdAt = const Value.absent(),
          Value<DateTime?> updatedAt = const Value.absent(),
          SyncStatus? localSyncStatus}) =>
      LocalTodo(
        localId: localId ?? this.localId,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        title: title ?? this.title,
        description: description ?? this.description,
        isCompleted: isCompleted ?? this.isCompleted,
        localParentId:
            localParentId.present ? localParentId.value : this.localParentId,
        remoteParentId:
            remoteParentId.present ? remoteParentId.value : this.remoteParentId,
        tags: tags ?? this.tags,
        localCreatedAt: localCreatedAt ?? this.localCreatedAt,
        localUpdatedAt: localUpdatedAt ?? this.localUpdatedAt,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        localSyncStatus: localSyncStatus ?? this.localSyncStatus,
      );
  @override
  String toString() {
    return (StringBuffer('LocalTodo(')
          ..write('localId: $localId, ')
          ..write('remoteId: $remoteId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('localParentId: $localParentId, ')
          ..write('remoteParentId: $remoteParentId, ')
          ..write('tags: $tags, ')
          ..write('localCreatedAt: $localCreatedAt, ')
          ..write('localUpdatedAt: $localUpdatedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('localSyncStatus: $localSyncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      localId,
      remoteId,
      title,
      description,
      isCompleted,
      localParentId,
      remoteParentId,
      tags,
      localCreatedAt,
      localUpdatedAt,
      createdAt,
      updatedAt,
      localSyncStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalTodo &&
          other.localId == this.localId &&
          other.remoteId == this.remoteId &&
          other.title == this.title &&
          other.description == this.description &&
          other.isCompleted == this.isCompleted &&
          other.localParentId == this.localParentId &&
          other.remoteParentId == this.remoteParentId &&
          other.tags == this.tags &&
          other.localCreatedAt == this.localCreatedAt &&
          other.localUpdatedAt == this.localUpdatedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.localSyncStatus == this.localSyncStatus);
}

class TodoTableCompanion extends UpdateCompanion<LocalTodo> {
  final Value<int> localId;
  final Value<String?> remoteId;
  final Value<String> title;
  final Value<String> description;
  final Value<bool> isCompleted;
  final Value<int?> localParentId;
  final Value<String?> remoteParentId;
  final Value<List<String>> tags;
  final Value<DateTime> localCreatedAt;
  final Value<DateTime> localUpdatedAt;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<SyncStatus> localSyncStatus;
  const TodoTableCompanion({
    this.localId = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.localParentId = const Value.absent(),
    this.remoteParentId = const Value.absent(),
    this.tags = const Value.absent(),
    this.localCreatedAt = const Value.absent(),
    this.localUpdatedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.localSyncStatus = const Value.absent(),
  });
  TodoTableCompanion.insert({
    this.localId = const Value.absent(),
    this.remoteId = const Value.absent(),
    required String title,
    required String description,
    required bool isCompleted,
    this.localParentId = const Value.absent(),
    this.remoteParentId = const Value.absent(),
    required List<String> tags,
    this.localCreatedAt = const Value.absent(),
    this.localUpdatedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.localSyncStatus = const Value.absent(),
  })  : title = Value(title),
        description = Value(description),
        isCompleted = Value(isCompleted),
        tags = Value(tags);
  static Insertable<LocalTodo> custom({
    Expression<int>? localId,
    Expression<String>? remoteId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<bool>? isCompleted,
    Expression<int>? localParentId,
    Expression<String>? remoteParentId,
    Expression<String>? tags,
    Expression<DateTime>? localCreatedAt,
    Expression<DateTime>? localUpdatedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? localSyncStatus,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (remoteId != null) 'remote_id': remoteId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (localParentId != null) 'local_parent_id': localParentId,
      if (remoteParentId != null) 'remote_parent_id': remoteParentId,
      if (tags != null) 'tags': tags,
      if (localCreatedAt != null) 'local_created_at': localCreatedAt,
      if (localUpdatedAt != null) 'local_updated_at': localUpdatedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (localSyncStatus != null) 'local_sync_status': localSyncStatus,
    });
  }

  TodoTableCompanion copyWith(
      {Value<int>? localId,
      Value<String?>? remoteId,
      Value<String>? title,
      Value<String>? description,
      Value<bool>? isCompleted,
      Value<int?>? localParentId,
      Value<String?>? remoteParentId,
      Value<List<String>>? tags,
      Value<DateTime>? localCreatedAt,
      Value<DateTime>? localUpdatedAt,
      Value<DateTime?>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<SyncStatus>? localSyncStatus}) {
    return TodoTableCompanion(
      localId: localId ?? this.localId,
      remoteId: remoteId ?? this.remoteId,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      localParentId: localParentId ?? this.localParentId,
      remoteParentId: remoteParentId ?? this.remoteParentId,
      tags: tags ?? this.tags,
      localCreatedAt: localCreatedAt ?? this.localCreatedAt,
      localUpdatedAt: localUpdatedAt ?? this.localUpdatedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      localSyncStatus: localSyncStatus ?? this.localSyncStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (localParentId.present) {
      map['local_parent_id'] = Variable<int>(localParentId.value);
    }
    if (remoteParentId.present) {
      map['remote_parent_id'] = Variable<String>(remoteParentId.value);
    }
    if (tags.present) {
      final converter = $TodoTableTable.$convertertags;
      map['tags'] = Variable<String>(converter.toSql(tags.value));
    }
    if (localCreatedAt.present) {
      map['local_created_at'] = Variable<DateTime>(localCreatedAt.value);
    }
    if (localUpdatedAt.present) {
      map['local_updated_at'] = Variable<DateTime>(localUpdatedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (localSyncStatus.present) {
      final converter = $TodoTableTable.$converterlocalSyncStatus;
      map['local_sync_status'] =
          Variable<String>(converter.toSql(localSyncStatus.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoTableCompanion(')
          ..write('localId: $localId, ')
          ..write('remoteId: $remoteId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('localParentId: $localParentId, ')
          ..write('remoteParentId: $remoteParentId, ')
          ..write('tags: $tags, ')
          ..write('localCreatedAt: $localCreatedAt, ')
          ..write('localUpdatedAt: $localUpdatedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('localSyncStatus: $localSyncStatus')
          ..write(')'))
        .toString();
  }
}

abstract class _$DriftLocalDatabase extends GeneratedDatabase {
  _$DriftLocalDatabase(QueryExecutor e) : super(e);
  late final $TodoTableTable todoTable = $TodoTableTable(this);
  late final TodoDaoImpl todoDaoImpl = TodoDaoImpl(this as DriftLocalDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todoTable];
}
