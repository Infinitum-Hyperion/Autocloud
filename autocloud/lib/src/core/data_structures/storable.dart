part of autocloud.sdk.core;

/// Tools to enable native objects to be converted to and from JSON representations

mixin Storable<S> {
  S serialize();
}

extension StorableListUtils on List<Storable> {
  /// Serialize a list of [Storable]s
  List<Object?> toStorableList() => [for (final e in this) e.serialize()];
}

extension ListUtils<O> on List<O> {
  /// Convert a [List<O>] to [List<N>]
  List<N> listOf<N>(N Function(O) converter) => map(converter).toList();
}

extension JSONUtils on JSON {
  T get<T>(String key) => this[key] as T;

  List<Object?> getList(String key) => get<List<Object?>>(key);
}

extension DateTimeStorability on DateTime {
  int serialize() => millisecondsSinceEpoch;
  static DateTime deserialize(Object? storable) =>
      DateTime.fromMillisecondsSinceEpoch((storable as int));
}

extension DurationStorability on Duration {
  int serialize() => inMilliseconds;
  static Duration deserialize(Object? storable) =>
      Duration(milliseconds: (storable as int));
}
