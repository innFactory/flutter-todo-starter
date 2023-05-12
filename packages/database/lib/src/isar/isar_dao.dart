part of 'isar.dart';

abstract class IsarDao<T extends LocalBase> implements Dao<T> {
  const IsarDao({Isar? isar}) : _isar = isar;

  final Isar? _isar;

  Isar get isar => _isar ?? Isar.getInstance()!;

  IsarCollection<T> get isarCollection {
    try {
      return isar.collection<T>();
    } catch (e) {
      logWtf(
        'Could not get collection for type $T. '
        'Did you forget to register the Schema?',
        e,
      );
      rethrow;
    }
  }

  /// The Query to get all entities. Used by [getAll] and [watchAll].
  Query<T> get allQuery => isarCollection.where().build();

  @override
  TaskEither<Failure, Unit> hardDeleteNotInIds(Set<String> remoteIds) {
    return writeTxn(
      () async {
        final localRemoteIds = (await isarCollection
                .buildQuery<String?>(property: 'remoteId')
                .findAll())
            .whereNotNull()
            .toSet();
        final deletedIds = localRemoteIds.difference(remoteIds);

        if (deletedIds.isNotEmpty) {
          await isarCollection.buildQuery<dynamic>(
            whereClauses: [
              for (final id in deletedIds)
                IndexWhereClause.equalTo(
                  indexName: 'remoteId',
                  value: [id],
                ),
            ],
          ).deleteAll();
        }

        return right(unit);
      },
    );
  }

  @override
  TaskEither<Failure, T> createOrUpdate(T entity, {SyncStatus? syncStatus}) {
    return writeTxn(
      () async => right(
        await isarCollection.put(
          await _update(entity, syncStatus),
        ),
      ),
    ).flatMap(_getByLocalId);
  }

  @override
  TaskEither<Failure, int> createOrUpdateAll(
    Iterable<T> entities, {
    SyncStatus? syncStatus,
  }) {
    return writeTxn(
      () async => right(
        await isarCollection.putAll(
          await Future.wait(entities.map((e) => _update(e, syncStatus))),
        ),
      ),
    ).map((r) => r.length);
  }

  @override
  Selectable<T> findById(
      {bool includeSoftDeleted = false, String? remoteId, int? localId}) {
    if (remoteId == null && localId == null) {
      return Selectable.notFound();
    }

    return IsarSelectable.single(
      () => isarCollection
          .where()
          .idEqualTo(localId, remoteId)
          .filter()
          .optional(!includeSoftDeleted, (q) => q.notDeleted())
          .build(),
    );
  }

  @override
  Selectable<List<T>> findAll({
    required bool includeSoftDeleted,
    List<int>? localIds,
    List<String>? remoteIds,
  }) {
    if (localIds?.isEmpty != false && remoteIds?.isEmpty != false) {
      return Selectable.value([]);
    }

    return IsarSelectable.list(
      () => isarCollection
          .where()
          .optional(
            localIds != null,
            (q) => q.anyOf<int, T>(
              localIds!,
              (q, element) => q.idEqualTo(element, null),
            ),
          )
          .or()
          .optional(
            remoteIds != null,
            (q) => q.anyOf<String, T>(
              remoteIds!,
              (q, element) => q.idEqualTo(null, element),
            ),
          )
          .or()
          .optional(
            !includeSoftDeleted,
            (q) => q.localSyncStatusNotEqualTo(SyncStatus.deleted),
          )
          .filter()
          .optional(
            !includeSoftDeleted,
            (q) => q.notDeleted(),
          )
          .and()
          .optional(localIds != null, (q) => q.inId(null, localIds))
          .and()
          .optional(remoteIds != null, (q) => q.inId(remoteIds, null))
          .build(),
    );
  }

  @override
  Selectable<List<T>> findAllRequiringSync() {
    return IsarSelectable.list(
      () => isarCollection
          .where()
          .localSyncStatusNotEqualTo(SyncStatus.synced)
          .build(),
    );
  }

  @override
  TaskEither<Failure, Unit> deleteById({
    String? remoteId,
    int? localId,
    required bool softDelete,
  }) {
    return writeTxn<Unit>(() async {
      if (softDelete) {
        final entity = await isarCollection
            .where()
            .idEqualTo(localId, remoteId)
            .build()
            .findFirst();

        if (entity == null) {
          return left(Failures.notFound);
        }

        await isarCollection.put(await _update(entity, SyncStatus.deleted));
      } else {
        if (localId != null) {
          await isarCollection.delete(localId);
        } else if (remoteId != null) {
          await isarCollection.deleteByIndex('remoteId', [remoteId]);
        }
      }

      return right(unit);
    });
  }

  @override
  TaskEither<Failure, int> deleteByIds({
    Iterable<int>? localIds,
    Iterable<String>? remoteIds,
    required bool softDelete,
  }) {
    return writeTxn<int>(() async {
      if (softDelete) {
        final entities = await isarCollection
            .filter()
            .inId(remoteIds, localIds)
            .build()
            .findAll();

        if (entities.isEmpty) {
          return left(Failures.notFound);
        }

        await isarCollection.putAll(
          await Future.wait(
            entities.map((e) => _update(e, SyncStatus.deleted)),
          ),
        );

        return right(entities.length);
      } else {
        final localIdsToDelete = localIds?.toList() ?? [];
        final remoteIdsToDelete = remoteIds?.map((r) => [r]).toList() ?? [];

        final deletedLocal = await isarCollection.deleteAll(localIdsToDelete);
        final deletedRemote = await isarCollection.deleteAllByIndex(
            'remoteId', remoteIdsToDelete);

        return right(deletedLocal + deletedRemote);
      }
    });
  }

  @override
  TaskEither<Failure, Unit> replaceAll(Iterable<T> entities) {
    return writeTxn(() async {
      await isarCollection.clear();
      await isarCollection.putAll(entities.toList());
      return right(unit);
    });
  }

  TaskEither<Failure, R> txn<R>(
    Future<Either<Failure, R>> Function() action,
  ) {
    return TaskEither(() async {
      try {
        return isar.txn(action);
      } catch (e) {
        return left(Failures.database);
      }
    });
  }

  TaskEither<Failure, R> writeTxn<R>(
    Future<Either<Failure, R>> Function() action,
  ) {
    return TaskEither(() async {
      try {
        return isar.writeTxn(action);
      } catch (e) {
        return left(Failures.database);
      }
    });
  }

  TaskEither<Failure, T> _getByLocalId(int id) {
    return tryGetMaybeNotFound(() => isarCollection.get(id));
  }

  TaskEither<Failure, T> tryGetMaybeNotFound(
    FutureOr<T?> Function() get,
  ) {
    return TaskEither(() async {
      try {
        final result = await get();

        if (result == null) {
          return left(Failures.notFound);
        }

        return right(result);
      } catch (e) {
        return left(Failures.database);
      }
    });
  }

  Future<T> _update(T entity, SyncStatus? syncStatus) async {
    final local = await isarCollection
        .where()
        .idEqualTo(
          entity.localId,
          entity.remoteId,
        )
        .build()
        .findFirst();

    if (local != null) {
      entity.localSyncStatus = local.localSyncStatus;
      entity.localUpdatedAt = local.localUpdatedAt;
      entity.localCreatedAt = local.localCreatedAt;
      entity.localId = local.localId ?? entity.localId;
      entity.remoteId = local.remoteId ?? entity.remoteId;
    }

    entity.localSyncStatus = syncStatus ?? entity.localSyncStatus;

    if (syncStatus == null) {
      if (entity.remoteId == null) {
        entity.localSyncStatus = SyncStatus.created;
      } else {
        entity.localSyncStatus = SyncStatus.updated;
      }
    }

    if (entity.localSyncStatus == SyncStatus.created ||
        entity.localSyncStatus == SyncStatus.updated) {
      entity.localUpdatedAt = DateTime.now().toUtc();
    }

    if (entity.localId == null || entity.localId == Isar.autoIncrement) {
      entity.localCreatedAt = entity.localCreatedAt.toLocal();
    }

    return entity;
  }
}

extension CollectionFilterExtensions<T extends LocalBase>
    on QueryBuilder<T, T, QFilterCondition> {
  QueryBuilder<T, T, QAfterFilterCondition> inId(
    Iterable<String>? remoteIds,
    Iterable<int>? localIds,
  ) {
    return oneOf<dynamic, dynamic>(
      [...?remoteIds, ...?localIds],
      // ignore: invalid_use_of_protected_member
      (q, element) => QueryBuilder.apply(q, (query) {
        return query.addFilterCondition(FilterGroup.or([
          FilterCondition.equalTo(
            property: 'localId',
            value: element,
            caseSensitive: false,
          ),
          FilterCondition.equalTo(
            property: 'remoteId',
            value: element,
            caseSensitive: false,
          ),
        ]));
      }),
    );
  }

  QueryBuilder<T, T, QAfterFilterCondition> notDeleted() {
    return oneOf<SyncStatus, dynamic>(
      [SyncStatus.created, SyncStatus.updated, SyncStatus.synced],
      // ignore: invalid_use_of_protected_member
      (q, element) => QueryBuilder.apply(q, (query) {
        return query.addFilterCondition(FilterCondition.equalTo(
          property: 'localSyncStatus',
          value: element,
          caseSensitive: false,
        ));
      }),
    );
  }

  QueryBuilder<T, T, QAfterFilterCondition> localRemoteIdEqualTo(
    int? localId,
    String? remoteId,
    QueryBuilder<T, T, QAfterFilterCondition> Function(
      QueryBuilder<T, T, QFilterCondition> q,
      int localId,
    ) localIdQuery,
    QueryBuilder<T, T, QAfterFilterCondition> Function(
      QueryBuilder<T, T, QFilterCondition> q,
      String remoteId,
    ) remoteIdQuery,
  ) {
    return optional(
      localId != null,
      (q) => localIdQuery(this, localId!).or(),
    ).optional(
      remoteId != null,
      (q) => remoteIdQuery(this, remoteId!),
    );
  }
}

extension CollectionWhereExtensions<T extends LocalBase>
    on QueryBuilder<T, T, QWhereClause> {
  QueryBuilder<T, T, QAfterWhereClause> idEqualTo(
    int? localId,
    String? remoteId,
  ) {
    // ignore: invalid_use_of_protected_member
    return QueryBuilder.apply(this, (query) {
      if (localId == null && remoteId == null) {
        return query.addWhereClause(const IdWhereClause.equalTo(value: -1));
      }

      if (localId != null && localId != Isar.autoIncrement) {
        return query.addWhereClause(IdWhereClause.equalTo(value: localId));
      }

      if (remoteId != null) {
        return query.addWhereClause(IndexWhereClause.equalTo(
          indexName: 'remoteId',
          value: [remoteId],
        ));
      }

      return query;
    });
  }

  QueryBuilder<T, T, QAfterWhereClause> localRemoteIdEqualTo(
    String? remoteId,
    int? localId,
    QueryBuilder<T, T, QAfterWhereClause> Function(
      QueryBuilder<T, T, QWhereClause> q,
      int localId,
    ) localIdQuery,
    QueryBuilder<T, T, QAfterWhereClause> Function(
      QueryBuilder<T, T, QWhereClause> q,
      String remoteId,
    ) remoteIdQuery,
  ) {
    return optional(
      localId != null,
      (q) => localIdQuery(this, localId!).or(),
    ).optional(
      remoteId != null,
      (q) => remoteIdQuery(this, remoteId!),
    );
  }

  QueryBuilder<T, T, QAfterWhereClause> localSyncStatusEqualTo(
    SyncStatus localSyncStatus,
  ) {
    // ignore: invalid_use_of_protected_member
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: 'localSyncStatus',
        value: [localSyncStatus],
      ));
    });
  }

  QueryBuilder<T, T, QAfterWhereClause> localSyncStatusNotEqualTo(
    SyncStatus localSyncStatus,
  ) {
    // ignore: invalid_use_of_protected_member
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: 'localSyncStatus',
              lower: [],
              upper: [localSyncStatus],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: 'localSyncStatus',
              lower: [localSyncStatus],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: 'localSyncStatus',
              lower: [localSyncStatus],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: 'localSyncStatus',
              lower: [],
              upper: [localSyncStatus],
              includeUpper: false,
            ));
      }
    });
  }
}
