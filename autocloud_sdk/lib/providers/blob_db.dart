part of autocloud.sdk;

abstract class BlobDBProvider {
  /// Subclasses must call the [super.init] method to ensure accurate initialisation
  /// of the database. Call the [init] method after the database has been initialised by the subclass.
  /// The methods of this class prefixed with "init" are called by this method.
  /// They should not be overriden or called during the remaining lifecycle of the application.
  @mustCallSuper
  Future<void> init() async {}

  Future<Uint8List?> get(String ref);
  Future<void> put(String ref, Uint8List data);
  Future<void> delete(String ref);
}
