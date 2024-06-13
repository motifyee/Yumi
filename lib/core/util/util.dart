class Unique {
  final int creationTime;
  const Unique(this.creationTime);

  @override
  bool operator ==(Object other) {
    return (other is Unique) && creationTime == other.creationTime;
  }

  @override
  int get hashCode => creationTime;
}

Unique unique() => Unique(DateTime.now().microsecondsSinceEpoch);

bool isNumeric(String? s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}
