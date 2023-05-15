// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_todo.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLocalTodoCollection on Isar {
  IsarCollection<LocalTodo> get localTodos => this.collection();
}

const LocalTodoSchema = CollectionSchema(
  name: r'LocalTodo',
  id: 3883041102750916970,
  properties: {
    r'description': PropertySchema(
      id: 0,
      name: r'description',
      type: IsarType.string,
    ),
    r'isCompleted': PropertySchema(
      id: 1,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'localCreatedAt': PropertySchema(
      id: 2,
      name: r'localCreatedAt',
      type: IsarType.dateTime,
    ),
    r'localSyncStatus': PropertySchema(
      id: 3,
      name: r'localSyncStatus',
      type: IsarType.string,
      enumMap: _LocalTodolocalSyncStatusEnumValueMap,
    ),
    r'localUpdatedAt': PropertySchema(
      id: 4,
      name: r'localUpdatedAt',
      type: IsarType.dateTime,
    ),
    r'parentLocalId': PropertySchema(
      id: 5,
      name: r'parentLocalId',
      type: IsarType.long,
    ),
    r'parentRemoteId': PropertySchema(
      id: 6,
      name: r'parentRemoteId',
      type: IsarType.string,
    ),
    r'remoteId': PropertySchema(
      id: 7,
      name: r'remoteId',
      type: IsarType.string,
    ),
    r'tags': PropertySchema(
      id: 8,
      name: r'tags',
      type: IsarType.stringList,
    ),
    r'title': PropertySchema(
      id: 9,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _localTodoEstimateSize,
  serialize: _localTodoSerialize,
  deserialize: _localTodoDeserialize,
  deserializeProp: _localTodoDeserializeProp,
  idName: r'localId',
  indexes: {
    r'remoteId': IndexSchema(
      id: 6301175856541681032,
      name: r'remoteId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'remoteId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'localSyncStatus': IndexSchema(
      id: 1618236949765152158,
      name: r'localSyncStatus',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'localSyncStatus',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _localTodoGetId,
  getLinks: _localTodoGetLinks,
  attach: _localTodoAttach,
  version: '3.1.0+1',
);

int _localTodoEstimateSize(
  LocalTodo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.localSyncStatus.name.length * 3;
  {
    final value = object.parentRemoteId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.remoteId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.tags.length * 3;
  {
    for (var i = 0; i < object.tags.length; i++) {
      final value = object.tags[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _localTodoSerialize(
  LocalTodo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.description);
  writer.writeBool(offsets[1], object.isCompleted);
  writer.writeDateTime(offsets[2], object.localCreatedAt);
  writer.writeString(offsets[3], object.localSyncStatus.name);
  writer.writeDateTime(offsets[4], object.localUpdatedAt);
  writer.writeLong(offsets[5], object.parentLocalId);
  writer.writeString(offsets[6], object.parentRemoteId);
  writer.writeString(offsets[7], object.remoteId);
  writer.writeStringList(offsets[8], object.tags);
  writer.writeString(offsets[9], object.title);
}

LocalTodo _localTodoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalTodo();
  object.description = reader.readString(offsets[0]);
  object.isCompleted = reader.readBool(offsets[1]);
  object.localCreatedAt = reader.readDateTime(offsets[2]);
  object.localId = id;
  object.localSyncStatus = _LocalTodolocalSyncStatusValueEnumMap[
          reader.readStringOrNull(offsets[3])] ??
      SyncStatus.synced;
  object.localUpdatedAt = reader.readDateTime(offsets[4]);
  object.parentLocalId = reader.readLongOrNull(offsets[5]);
  object.parentRemoteId = reader.readStringOrNull(offsets[6]);
  object.remoteId = reader.readStringOrNull(offsets[7]);
  object.tags = reader.readStringList(offsets[8]) ?? [];
  object.title = reader.readString(offsets[9]);
  return object;
}

P _localTodoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (_LocalTodolocalSyncStatusValueEnumMap[
              reader.readStringOrNull(offset)] ??
          SyncStatus.synced) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringList(offset) ?? []) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _LocalTodolocalSyncStatusEnumValueMap = {
  r'synced': r'synced',
  r'created': r'created',
  r'updated': r'updated',
  r'deleted': r'deleted',
};
const _LocalTodolocalSyncStatusValueEnumMap = {
  r'synced': SyncStatus.synced,
  r'created': SyncStatus.created,
  r'updated': SyncStatus.updated,
  r'deleted': SyncStatus.deleted,
};

Id _localTodoGetId(LocalTodo object) {
  return object.localId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _localTodoGetLinks(LocalTodo object) {
  return [];
}

void _localTodoAttach(IsarCollection<dynamic> col, Id id, LocalTodo object) {
  object.localId = id;
}

extension LocalTodoQueryWhereSort
    on QueryBuilder<LocalTodo, LocalTodo, QWhere> {
  QueryBuilder<LocalTodo, LocalTodo, QAfterWhere> anyLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LocalTodoQueryWhere
    on QueryBuilder<LocalTodo, LocalTodo, QWhereClause> {
  QueryBuilder<LocalTodo, LocalTodo, QAfterWhereClause> localIdEqualTo(
      Id localId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: localId,
        upper: localId,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterWhereClause> localIdNotEqualTo(
      Id localId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: localId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: localId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: localId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: localId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterWhereClause> localIdGreaterThan(
      Id localId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: localId, includeLower: include),
      );
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterWhereClause> localIdLessThan(
      Id localId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: localId, includeUpper: include),
      );
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterWhereClause> localIdBetween(
    Id lowerLocalId,
    Id upperLocalId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerLocalId,
        includeLower: includeLower,
        upper: upperLocalId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterWhereClause> remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'remoteId',
        value: [null],
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterWhereClause> remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'remoteId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterWhereClause> remoteIdEqualTo(
      String? remoteId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'remoteId',
        value: [remoteId],
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterWhereClause> remoteIdNotEqualTo(
      String? remoteId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'remoteId',
              lower: [],
              upper: [remoteId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'remoteId',
              lower: [remoteId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'remoteId',
              lower: [remoteId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'remoteId',
              lower: [],
              upper: [remoteId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterWhereClause> localSyncStatusEqualTo(
      SyncStatus localSyncStatus) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'localSyncStatus',
        value: [localSyncStatus],
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterWhereClause>
      localSyncStatusNotEqualTo(SyncStatus localSyncStatus) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'localSyncStatus',
              lower: [],
              upper: [localSyncStatus],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'localSyncStatus',
              lower: [localSyncStatus],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'localSyncStatus',
              lower: [localSyncStatus],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'localSyncStatus',
              lower: [],
              upper: [localSyncStatus],
              includeUpper: false,
            ));
      }
    });
  }
}

extension LocalTodoQueryFilter
    on QueryBuilder<LocalTodo, LocalTodo, QFilterCondition> {
  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> isCompletedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      localCreatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localCreatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      localCreatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'localCreatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      localCreatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'localCreatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      localCreatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'localCreatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> localIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'localId',
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> localIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'localId',
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> localIdEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> localIdGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> localIdLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> localIdBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'localId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      localSyncStatusEqualTo(
    SyncStatus value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localSyncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      localSyncStatusGreaterThan(
    SyncStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'localSyncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      localSyncStatusLessThan(
    SyncStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'localSyncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      localSyncStatusBetween(
    SyncStatus lower,
    SyncStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'localSyncStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      localSyncStatusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'localSyncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      localSyncStatusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'localSyncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      localSyncStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'localSyncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      localSyncStatusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'localSyncStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      localSyncStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localSyncStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      localSyncStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'localSyncStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      localUpdatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localUpdatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      localUpdatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'localUpdatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      localUpdatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'localUpdatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      localUpdatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'localUpdatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      parentLocalIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parentLocalId',
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      parentLocalIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parentLocalId',
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      parentLocalIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentLocalId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      parentLocalIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parentLocalId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      parentLocalIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parentLocalId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      parentLocalIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parentLocalId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      parentRemoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parentRemoteId',
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      parentRemoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parentRemoteId',
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      parentRemoteIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentRemoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      parentRemoteIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parentRemoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      parentRemoteIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parentRemoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      parentRemoteIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parentRemoteId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      parentRemoteIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'parentRemoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      parentRemoteIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'parentRemoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      parentRemoteIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'parentRemoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      parentRemoteIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'parentRemoteId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      parentRemoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentRemoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      parentRemoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'parentRemoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> remoteIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> remoteIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> remoteIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> remoteIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remoteId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> remoteIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> remoteIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> remoteIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> remoteIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remoteId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> tagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      tagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> tagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> tagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      tagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> tagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> tagsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> tagsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> tagsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition>
      tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension LocalTodoQueryObject
    on QueryBuilder<LocalTodo, LocalTodo, QFilterCondition> {}

extension LocalTodoQueryLinks
    on QueryBuilder<LocalTodo, LocalTodo, QFilterCondition> {}

extension LocalTodoQuerySortBy on QueryBuilder<LocalTodo, LocalTodo, QSortBy> {
  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> sortByLocalCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localCreatedAt', Sort.asc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> sortByLocalCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localCreatedAt', Sort.desc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> sortByLocalSyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localSyncStatus', Sort.asc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> sortByLocalSyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localSyncStatus', Sort.desc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> sortByLocalUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localUpdatedAt', Sort.asc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> sortByLocalUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localUpdatedAt', Sort.desc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> sortByParentLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentLocalId', Sort.asc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> sortByParentLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentLocalId', Sort.desc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> sortByParentRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentRemoteId', Sort.asc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> sortByParentRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentRemoteId', Sort.desc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension LocalTodoQuerySortThenBy
    on QueryBuilder<LocalTodo, LocalTodo, QSortThenBy> {
  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> thenByLocalCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localCreatedAt', Sort.asc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> thenByLocalCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localCreatedAt', Sort.desc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> thenByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> thenByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> thenByLocalSyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localSyncStatus', Sort.asc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> thenByLocalSyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localSyncStatus', Sort.desc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> thenByLocalUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localUpdatedAt', Sort.asc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> thenByLocalUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localUpdatedAt', Sort.desc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> thenByParentLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentLocalId', Sort.asc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> thenByParentLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentLocalId', Sort.desc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> thenByParentRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentRemoteId', Sort.asc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> thenByParentRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentRemoteId', Sort.desc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension LocalTodoQueryWhereDistinct
    on QueryBuilder<LocalTodo, LocalTodo, QDistinct> {
  QueryBuilder<LocalTodo, LocalTodo, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QDistinct> distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QDistinct> distinctByLocalCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localCreatedAt');
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QDistinct> distinctByLocalSyncStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localSyncStatus',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QDistinct> distinctByLocalUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localUpdatedAt');
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QDistinct> distinctByParentLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parentLocalId');
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QDistinct> distinctByParentRemoteId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parentRemoteId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QDistinct> distinctByRemoteId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags');
    });
  }

  QueryBuilder<LocalTodo, LocalTodo, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension LocalTodoQueryProperty
    on QueryBuilder<LocalTodo, LocalTodo, QQueryProperty> {
  QueryBuilder<LocalTodo, int, QQueryOperations> localIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localId');
    });
  }

  QueryBuilder<LocalTodo, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<LocalTodo, bool, QQueryOperations> isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<LocalTodo, DateTime, QQueryOperations> localCreatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localCreatedAt');
    });
  }

  QueryBuilder<LocalTodo, SyncStatus, QQueryOperations>
      localSyncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localSyncStatus');
    });
  }

  QueryBuilder<LocalTodo, DateTime, QQueryOperations> localUpdatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localUpdatedAt');
    });
  }

  QueryBuilder<LocalTodo, int?, QQueryOperations> parentLocalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parentLocalId');
    });
  }

  QueryBuilder<LocalTodo, String?, QQueryOperations> parentRemoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parentRemoteId');
    });
  }

  QueryBuilder<LocalTodo, String?, QQueryOperations> remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<LocalTodo, List<String>, QQueryOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }

  QueryBuilder<LocalTodo, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}
