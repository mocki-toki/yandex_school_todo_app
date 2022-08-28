enum DurationConstants {
  standartAnimation(Duration(milliseconds: 100)),
  longAnimation(Duration(milliseconds: 500)),
  swipeAnimation(Duration(milliseconds: 200));

  const DurationConstants(this.duration);

  final Duration duration;
}
