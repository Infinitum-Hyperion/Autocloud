part of autocloud.sdk.core;

abstract class Storable {
  const Storable();

  Object? toStorable();
}

abstract class SingleElement<N, S> extends Storable {
  final N native;

  const SingleElement(this.native);

  @override
  S toStorable();
}

abstract class StorableJson extends Storable {
  @override
  Object? toStorable() => toJson();

  Map<String, Object?> toJson();
}

class DateTimeStorable extends SingleElement<DateTime, String> {
  const DateTimeStorable(super.native);

  @override
  String toStorable() => native.toIso8601String();
}

class DurationStorable extends SingleElement<Duration, int> {
  const DurationStorable(super.native);

  @override
  int toStorable() => native.inMilliseconds;
}
