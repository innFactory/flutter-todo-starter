enum SyncStatus {
  /// The entity is up to date.
  synced,

  /// The entity has been created locally and is not yet synced.
  created,

  /// The entity has been updated locally and is not yet synced.
  updated,

  /// The entity has been deleted locally and is not yet synced.
  deleted;
}
