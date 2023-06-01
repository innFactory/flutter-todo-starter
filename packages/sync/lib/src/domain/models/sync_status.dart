enum SyncStatus {
  /// The entity is up to date.
  synced,

  /// The entity has been created modified locally.
  modified,

  /// The entity has been deleted locally.
  deleted,
}
