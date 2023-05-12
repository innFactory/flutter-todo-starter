// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_sync_log.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLocalSyncLogCollection on Isar {
  IsarCollection<LocalSyncLog> get localSyncLogs => this.collection();
}

const LocalSyncLogSchema = CollectionSchema(
  name: r'LocalSyncLog',
  id: 506610662870163816,
  properties: {
    r'apiErrorExceptionType': PropertySchema(
      id: 0,
      name: r'apiErrorExceptionType',
      type: IsarType.string,
    ),
    r'apiErrorMessage': PropertySchema(
      id: 1,
      name: r'apiErrorMessage',
      type: IsarType.string,
    ),
    r'apiErrorTimestamp': PropertySchema(
      id: 2,
      name: r'apiErrorTimestamp',
      type: IsarType.dateTime,
    ),
    r'entityId': PropertySchema(
      id: 3,
      name: r'entityId',
      type: IsarType.long,
    ),
    r'entityModifiedAt': PropertySchema(
      id: 4,
      name: r'entityModifiedAt',
      type: IsarType.dateTime,
    ),
    r'entityType': PropertySchema(
      id: 5,
      name: r'entityType',
      type: IsarType.string,
      enumMap: _LocalSyncLogentityTypeEnumValueMap,
    ),
    r'executedAt': PropertySchema(
      id: 6,
      name: r'executedAt',
      type: IsarType.dateTime,
    ),
    r'localCreatedAt': PropertySchema(
      id: 7,
      name: r'localCreatedAt',
      type: IsarType.dateTime,
    ),
    r'localSyncStatus': PropertySchema(
      id: 8,
      name: r'localSyncStatus',
      type: IsarType.string,
      enumMap: _LocalSyncLoglocalSyncStatusEnumValueMap,
    ),
    r'localUpdatedAt': PropertySchema(
      id: 9,
      name: r'localUpdatedAt',
      type: IsarType.dateTime,
    ),
    r'remoteId': PropertySchema(
      id: 10,
      name: r'remoteId',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 11,
      name: r'status',
      type: IsarType.string,
      enumMap: _LocalSyncLogstatusEnumValueMap,
    )
  },
  estimateSize: _localSyncLogEstimateSize,
  serialize: _localSyncLogSerialize,
  deserialize: _localSyncLogDeserialize,
  deserializeProp: _localSyncLogDeserializeProp,
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
  getId: _localSyncLogGetId,
  getLinks: _localSyncLogGetLinks,
  attach: _localSyncLogAttach,
  version: '3.1.0+1',
);

int _localSyncLogEstimateSize(
  LocalSyncLog object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.apiErrorExceptionType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.apiErrorMessage;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.entityType.name.length * 3;
  bytesCount += 3 + object.localSyncStatus.name.length * 3;
  {
    final value = object.remoteId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.status.name.length * 3;
  return bytesCount;
}

void _localSyncLogSerialize(
  LocalSyncLog object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.apiErrorExceptionType);
  writer.writeString(offsets[1], object.apiErrorMessage);
  writer.writeDateTime(offsets[2], object.apiErrorTimestamp);
  writer.writeLong(offsets[3], object.entityId);
  writer.writeDateTime(offsets[4], object.entityModifiedAt);
  writer.writeString(offsets[5], object.entityType.name);
  writer.writeDateTime(offsets[6], object.executedAt);
  writer.writeDateTime(offsets[7], object.localCreatedAt);
  writer.writeString(offsets[8], object.localSyncStatus.name);
  writer.writeDateTime(offsets[9], object.localUpdatedAt);
  writer.writeString(offsets[10], object.remoteId);
  writer.writeString(offsets[11], object.status.name);
}

LocalSyncLog _localSyncLogDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalSyncLog();
  object.apiErrorExceptionType = reader.readStringOrNull(offsets[0]);
  object.apiErrorMessage = reader.readStringOrNull(offsets[1]);
  object.apiErrorTimestamp = reader.readDateTimeOrNull(offsets[2]);
  object.entityId = reader.readLong(offsets[3]);
  object.entityModifiedAt = reader.readDateTime(offsets[4]);
  object.entityType = _LocalSyncLogentityTypeValueEnumMap[
          reader.readStringOrNull(offsets[5])] ??
      SyncEntityType.room;
  object.executedAt = reader.readDateTimeOrNull(offsets[6]);
  object.localCreatedAt = reader.readDateTime(offsets[7]);
  object.localId = id;
  object.localSyncStatus = _LocalSyncLoglocalSyncStatusValueEnumMap[
          reader.readStringOrNull(offsets[8])] ??
      SyncStatus.synced;
  object.localUpdatedAt = reader.readDateTime(offsets[9]);
  object.remoteId = reader.readStringOrNull(offsets[10]);
  object.status =
      _LocalSyncLogstatusValueEnumMap[reader.readStringOrNull(offsets[11])] ??
          SyncStatus.synced;
  return object;
}

P _localSyncLogDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (_LocalSyncLogentityTypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          SyncEntityType.room) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (_LocalSyncLoglocalSyncStatusValueEnumMap[
              reader.readStringOrNull(offset)] ??
          SyncStatus.synced) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (_LocalSyncLogstatusValueEnumMap[
              reader.readStringOrNull(offset)] ??
          SyncStatus.synced) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _LocalSyncLogentityTypeEnumValueMap = {
  r'room': r'room',
  r'contact': r'contact',
  r'project': r'project',
  r'participant': r'participant',
  r'participantGroup': r'participantGroup',
  r'note': r'note',
  r'topic': r'topic',
  r'participantList': r'participantList',
  r'recordings': r'recordings',
  r'recordingWeatherInfo': r'recordingWeatherInfo',
  r'planContainer': r'planContainer',
  r'siteInfo': r'siteInfo',
  r'planState': r'planState',
  r'currentUser': r'currentUser',
  r'settings': r'settings',
  r'report': r'report',
  r'tenantUser': r'tenantUser',
  r'tenantAccount': r'tenantAccount',
  r'attachment': r'attachment',
  r'reportTemplate': r'reportTemplate',
  r'favorite': r'favorite',
  r'calendarEvent': r'calendarEvent',
};
const _LocalSyncLogentityTypeValueEnumMap = {
  r'room': SyncEntityType.room,
  r'contact': SyncEntityType.contact,
  r'project': SyncEntityType.project,
  r'participant': SyncEntityType.participant,
  r'participantGroup': SyncEntityType.participantGroup,
  r'note': SyncEntityType.note,
  r'topic': SyncEntityType.topic,
  r'participantList': SyncEntityType.participantList,
  r'recordings': SyncEntityType.recordings,
  r'recordingWeatherInfo': SyncEntityType.recordingWeatherInfo,
  r'planContainer': SyncEntityType.planContainer,
  r'siteInfo': SyncEntityType.siteInfo,
  r'planState': SyncEntityType.planState,
  r'currentUser': SyncEntityType.currentUser,
  r'settings': SyncEntityType.settings,
  r'report': SyncEntityType.report,
  r'tenantUser': SyncEntityType.tenantUser,
  r'tenantAccount': SyncEntityType.tenantAccount,
  r'attachment': SyncEntityType.attachment,
  r'reportTemplate': SyncEntityType.reportTemplate,
  r'favorite': SyncEntityType.favorite,
  r'calendarEvent': SyncEntityType.calendarEvent,
};
const _LocalSyncLoglocalSyncStatusEnumValueMap = {
  r'synced': r'synced',
  r'created': r'created',
  r'updated': r'updated',
  r'deleted': r'deleted',
};
const _LocalSyncLoglocalSyncStatusValueEnumMap = {
  r'synced': SyncStatus.synced,
  r'created': SyncStatus.created,
  r'updated': SyncStatus.updated,
  r'deleted': SyncStatus.deleted,
};
const _LocalSyncLogstatusEnumValueMap = {
  r'synced': r'synced',
  r'created': r'created',
  r'updated': r'updated',
  r'deleted': r'deleted',
};
const _LocalSyncLogstatusValueEnumMap = {
  r'synced': SyncStatus.synced,
  r'created': SyncStatus.created,
  r'updated': SyncStatus.updated,
  r'deleted': SyncStatus.deleted,
};

Id _localSyncLogGetId(LocalSyncLog object) {
  return object.localId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _localSyncLogGetLinks(LocalSyncLog object) {
  return [];
}

void _localSyncLogAttach(
    IsarCollection<dynamic> col, Id id, LocalSyncLog object) {
  object.localId = id;
}

extension LocalSyncLogQueryWhereSort
    on QueryBuilder<LocalSyncLog, LocalSyncLog, QWhere> {
  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterWhere> anyLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LocalSyncLogQueryWhere
    on QueryBuilder<LocalSyncLog, LocalSyncLog, QWhereClause> {
  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterWhereClause> localIdEqualTo(
      Id localId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: localId,
        upper: localId,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterWhereClause> localIdNotEqualTo(
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

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterWhereClause>
      localIdGreaterThan(Id localId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: localId, includeLower: include),
      );
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterWhereClause> localIdLessThan(
      Id localId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: localId, includeUpper: include),
      );
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterWhereClause> localIdBetween(
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

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterWhereClause> remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'remoteId',
        value: [null],
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterWhereClause>
      remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'remoteId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterWhereClause> remoteIdEqualTo(
      String? remoteId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'remoteId',
        value: [remoteId],
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterWhereClause>
      remoteIdNotEqualTo(String? remoteId) {
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

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterWhereClause>
      localSyncStatusEqualTo(SyncStatus localSyncStatus) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'localSyncStatus',
        value: [localSyncStatus],
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterWhereClause>
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

extension LocalSyncLogQueryFilter
    on QueryBuilder<LocalSyncLog, LocalSyncLog, QFilterCondition> {
  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorExceptionTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'apiErrorExceptionType',
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorExceptionTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'apiErrorExceptionType',
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorExceptionTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apiErrorExceptionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorExceptionTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'apiErrorExceptionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorExceptionTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'apiErrorExceptionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorExceptionTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'apiErrorExceptionType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorExceptionTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'apiErrorExceptionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorExceptionTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'apiErrorExceptionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorExceptionTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'apiErrorExceptionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorExceptionTypeMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'apiErrorExceptionType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorExceptionTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apiErrorExceptionType',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorExceptionTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'apiErrorExceptionType',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorMessageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'apiErrorMessage',
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorMessageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'apiErrorMessage',
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorMessageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apiErrorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorMessageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'apiErrorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorMessageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'apiErrorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorMessageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'apiErrorMessage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorMessageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'apiErrorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorMessageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'apiErrorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorMessageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'apiErrorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorMessageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'apiErrorMessage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorMessageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apiErrorMessage',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorMessageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'apiErrorMessage',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorTimestampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'apiErrorTimestamp',
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorTimestampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'apiErrorTimestamp',
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorTimestampEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apiErrorTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorTimestampGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'apiErrorTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorTimestampLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'apiErrorTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      apiErrorTimestampBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'apiErrorTimestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      entityIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      entityIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entityId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      entityIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entityId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      entityIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entityId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      entityModifiedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityModifiedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      entityModifiedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entityModifiedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      entityModifiedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entityModifiedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      entityModifiedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entityModifiedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      entityTypeEqualTo(
    SyncEntityType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      entityTypeGreaterThan(
    SyncEntityType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      entityTypeLessThan(
    SyncEntityType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      entityTypeBetween(
    SyncEntityType lower,
    SyncEntityType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entityType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      entityTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      entityTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      entityTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      entityTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'entityType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      entityTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityType',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      entityTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'entityType',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      executedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'executedAt',
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      executedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'executedAt',
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      executedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'executedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      executedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'executedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      executedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'executedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      executedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'executedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      localCreatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localCreatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
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

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
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

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
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

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      localIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'localId',
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      localIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'localId',
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      localIdEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      localIdGreaterThan(
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

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      localIdLessThan(
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

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      localIdBetween(
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

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
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

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
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

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
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

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
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

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
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

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
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

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      localSyncStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'localSyncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      localSyncStatusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'localSyncStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      localSyncStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localSyncStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      localSyncStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'localSyncStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      localUpdatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localUpdatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
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

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
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

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
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

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      remoteIdEqualTo(
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

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      remoteIdGreaterThan(
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

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      remoteIdLessThan(
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

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      remoteIdBetween(
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

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      remoteIdStartsWith(
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

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      remoteIdEndsWith(
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

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      remoteIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      remoteIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remoteId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition> statusEqualTo(
    SyncStatus value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      statusGreaterThan(
    SyncStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      statusLessThan(
    SyncStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition> statusBetween(
    SyncStatus lower,
    SyncStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition> statusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }
}

extension LocalSyncLogQueryObject
    on QueryBuilder<LocalSyncLog, LocalSyncLog, QFilterCondition> {}

extension LocalSyncLogQueryLinks
    on QueryBuilder<LocalSyncLog, LocalSyncLog, QFilterCondition> {}

extension LocalSyncLogQuerySortBy
    on QueryBuilder<LocalSyncLog, LocalSyncLog, QSortBy> {
  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      sortByApiErrorExceptionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiErrorExceptionType', Sort.asc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      sortByApiErrorExceptionTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiErrorExceptionType', Sort.desc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      sortByApiErrorMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiErrorMessage', Sort.asc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      sortByApiErrorMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiErrorMessage', Sort.desc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      sortByApiErrorTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiErrorTimestamp', Sort.asc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      sortByApiErrorTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiErrorTimestamp', Sort.desc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy> sortByEntityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityId', Sort.asc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy> sortByEntityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityId', Sort.desc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      sortByEntityModifiedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityModifiedAt', Sort.asc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      sortByEntityModifiedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityModifiedAt', Sort.desc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy> sortByEntityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.asc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      sortByEntityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.desc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy> sortByExecutedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'executedAt', Sort.asc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      sortByExecutedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'executedAt', Sort.desc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      sortByLocalCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localCreatedAt', Sort.asc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      sortByLocalCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localCreatedAt', Sort.desc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      sortByLocalSyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localSyncStatus', Sort.asc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      sortByLocalSyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localSyncStatus', Sort.desc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      sortByLocalUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localUpdatedAt', Sort.asc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      sortByLocalUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localUpdatedAt', Sort.desc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy> sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy> sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension LocalSyncLogQuerySortThenBy
    on QueryBuilder<LocalSyncLog, LocalSyncLog, QSortThenBy> {
  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      thenByApiErrorExceptionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiErrorExceptionType', Sort.asc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      thenByApiErrorExceptionTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiErrorExceptionType', Sort.desc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      thenByApiErrorMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiErrorMessage', Sort.asc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      thenByApiErrorMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiErrorMessage', Sort.desc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      thenByApiErrorTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiErrorTimestamp', Sort.asc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      thenByApiErrorTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiErrorTimestamp', Sort.desc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy> thenByEntityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityId', Sort.asc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy> thenByEntityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityId', Sort.desc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      thenByEntityModifiedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityModifiedAt', Sort.asc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      thenByEntityModifiedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityModifiedAt', Sort.desc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy> thenByEntityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.asc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      thenByEntityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.desc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy> thenByExecutedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'executedAt', Sort.asc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      thenByExecutedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'executedAt', Sort.desc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      thenByLocalCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localCreatedAt', Sort.asc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      thenByLocalCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localCreatedAt', Sort.desc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy> thenByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy> thenByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      thenByLocalSyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localSyncStatus', Sort.asc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      thenByLocalSyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localSyncStatus', Sort.desc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      thenByLocalUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localUpdatedAt', Sort.asc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy>
      thenByLocalUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localUpdatedAt', Sort.desc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy> thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy> thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension LocalSyncLogQueryWhereDistinct
    on QueryBuilder<LocalSyncLog, LocalSyncLog, QDistinct> {
  QueryBuilder<LocalSyncLog, LocalSyncLog, QDistinct>
      distinctByApiErrorExceptionType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'apiErrorExceptionType',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QDistinct> distinctByApiErrorMessage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'apiErrorMessage',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QDistinct>
      distinctByApiErrorTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'apiErrorTimestamp');
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QDistinct> distinctByEntityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entityId');
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QDistinct>
      distinctByEntityModifiedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entityModifiedAt');
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QDistinct> distinctByEntityType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entityType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QDistinct> distinctByExecutedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'executedAt');
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QDistinct>
      distinctByLocalCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localCreatedAt');
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QDistinct> distinctByLocalSyncStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localSyncStatus',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QDistinct>
      distinctByLocalUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localUpdatedAt');
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QDistinct> distinctByRemoteId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalSyncLog, LocalSyncLog, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }
}

extension LocalSyncLogQueryProperty
    on QueryBuilder<LocalSyncLog, LocalSyncLog, QQueryProperty> {
  QueryBuilder<LocalSyncLog, int, QQueryOperations> localIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localId');
    });
  }

  QueryBuilder<LocalSyncLog, String?, QQueryOperations>
      apiErrorExceptionTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'apiErrorExceptionType');
    });
  }

  QueryBuilder<LocalSyncLog, String?, QQueryOperations>
      apiErrorMessageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'apiErrorMessage');
    });
  }

  QueryBuilder<LocalSyncLog, DateTime?, QQueryOperations>
      apiErrorTimestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'apiErrorTimestamp');
    });
  }

  QueryBuilder<LocalSyncLog, int, QQueryOperations> entityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entityId');
    });
  }

  QueryBuilder<LocalSyncLog, DateTime, QQueryOperations>
      entityModifiedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entityModifiedAt');
    });
  }

  QueryBuilder<LocalSyncLog, SyncEntityType, QQueryOperations>
      entityTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entityType');
    });
  }

  QueryBuilder<LocalSyncLog, DateTime?, QQueryOperations> executedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'executedAt');
    });
  }

  QueryBuilder<LocalSyncLog, DateTime, QQueryOperations>
      localCreatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localCreatedAt');
    });
  }

  QueryBuilder<LocalSyncLog, SyncStatus, QQueryOperations>
      localSyncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localSyncStatus');
    });
  }

  QueryBuilder<LocalSyncLog, DateTime, QQueryOperations>
      localUpdatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localUpdatedAt');
    });
  }

  QueryBuilder<LocalSyncLog, String?, QQueryOperations> remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<LocalSyncLog, SyncStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}
