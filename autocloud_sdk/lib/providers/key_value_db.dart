part of autocloud.sdk;

abstract class KeyValueDBProvider {
  static const KVDBObjectIdentityProvider markhorReplayBuffersStore =
      KVDBObjectIdentityProvider(
    collection: 'markhor',
    doc: 'debugging',
    nested: KVDBObjectIdentityProvider(
      collection: 'replay_buffers',
      doc: 'entityId',
    ),
  );

  /// Subclasses must call the [super.init] method to ensure accurate initialisation
  /// of the database with necessary collections and documents. Call the [init] method
  /// after the database has been initialised by the subclass.
  /// The methods of this class prefixed with "init" are called by this method.
  /// They should not be overriden or called during the remaining lifecycle of the application.
  @mustCallSuper
  Future<void> init() async {
    await initMarkhorCollections();
  }

  Future<void> initMarkhorCollections() async =>
      insertById(markhorReplayBuffersStore, <String, Object?>{});

  /// Fetches the corresponding object from the database, returning null if it does not exist.
  Future<T?> getById<T>(KVDBObjectIdentityProvider id);

  /// Stores a new object in the database at the specified [id]. The [id.key] property
  /// should be null (either for this [id] if there are no nested IDs,
  /// or the innermost nested ID object otherwise).
  Future<void> insertById(
      KVDBObjectIdentityProvider id, Map<String, Object?> value);

  /// Updates or inserts the specified key-value pair in an existing object. The [id.key]
  /// property should not be null (either for this [id] if there are no nested IDs,
  /// or the innermost nested ID object otherwise).
  Future<void> updateById<T>(KVDBObjectIdentityProvider id, T value);
}

/// This class provides an ID interface for objects stored in the [KeyValueDBProvider].
/// It is intended that the [KVDBObjectIdentityProvider] is passed to database operations
/// when referring to object locations/paths. Instances of this class referring to the
/// same document are guaranteed to have the same [toString] result. Hence, this forms the
/// basis of comparisons via the [==] operator. A [KVDBObjectIdentityProvider] can be compared
/// for equality directly to a [String] form of another [KVDBObjectIdentityProvider], since
/// the [==] operator has been overriden to allow for this.
class KVDBObjectIdentityProvider {
  final String collection;
  final String doc;
  final String? key;
  final KVDBObjectIdentityProvider? nested;

  const KVDBObjectIdentityProvider({
    required this.collection,
    required this.doc,
    this.key,
    this.nested,
  });

  KVDBObjectIdentityProvider appendId(KVDBObjectIdentityProvider nestedItem) =>
      KVDBObjectIdentityProvider(
        collection: collection,
        doc: doc,
        nested: nestedItem,
      );

  KVDBObjectIdentityProvider appendField(String key) =>
      KVDBObjectIdentityProvider(
        collection: collection,
        doc: doc,
        key: key,
      );

  @override
  String toString() =>
      "$collection/$doc${key != null ? '.$key' : ''}${nested != null ? '/$nested' : ''}";

  @override
  int get hashCode => toString().hashCode;

  @override
  bool operator ==(Object other) => other is KVDBObjectIdentityProvider
      ? other.toString() == toString()
      : other is String
          ? other == toString()
          : false;
}
