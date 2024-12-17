part of autocloud.sdk;

abstract class KeyValueDBProvider {
  static const String markhorReplayBuffersStore =
      "markhor/debugging/replay_buffers/entityId";

  /// Subclasses must call the [super.init] method to ensure accurate initialisation
  /// of the database with necessary collections and documents. Call the [init] method
  /// after the database has been initialised by the subclass.
  /// The methods of this class prefixed with "init" are called by this method.
  /// They should not be overriden or called during the remaining lifecycle of the application.
  @mustCallSuper
  Future<void> init() async {
    await initMarkhorCollections();
  }

  Future<void> initMarkhorCollections() async {
    if ((await getById(markhorReplayBuffersStore)) == null) {
      insertById(markhorReplayBuffersStore, <String, Object?>{});
    }
  }

  /// Fetches the corresponding object from the database, returning null if it does not exist.
  Future<T?> getById<T>(String id, [String? key]);

  Future<void> insertById(String id, Map<String, Object?> value);

  Future<void> updateById<T>(String id, String key, T value);
}
