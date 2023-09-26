part of autocloud.sdk.core;

class Table<S extends StorableJson> {
  final List<Record<S>> records = [];

  Table();

  void insert(Record<S> record) => records.add(record);
  Record<S> getAt(int index) => records[index];
}

class Record<S extends StorableJson> {
  final S object;

  const Record(this.object);

  Map toJson() => object.toJson();
}
