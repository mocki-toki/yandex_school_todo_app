class Revision {
  const Revision(this.value);

  final int value;

  @override
  operator ==(Object other) =>
      identical(this, other) ||
      other is Revision &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  operator >(Revision other) => value > other.value;
  operator <(Revision other) => value < other.value;
  operator >=(Revision other) => value >= other.value;
  operator <=(Revision other) => value <= other.value;
}
