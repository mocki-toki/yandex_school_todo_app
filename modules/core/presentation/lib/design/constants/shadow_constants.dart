import 'package:core_presentation/core_presentation.dart';

enum ShadowConstants {
  cardPart1(
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.12),
      offset: Offset(0, 2),
      blurRadius: 2,
    ),
  ),
  cardPart2(
    BoxShadow(
      color: Color.fromRGBO(6, 0, 0, 0.06),
      offset: Offset.zero,
      blurRadius: 2,
    ),
  ),
  selectMenuPart1(
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.2),
      offset: Offset(0, 1),
      blurRadius: 3,
    ),
  ),
  selectMenuPart2(
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.12),
      offset: Offset(0, 2),
      blurRadius: 2,
    ),
  );

  const ShadowConstants(this.boxShadow);

  final BoxShadow boxShadow;
}

enum ElevationConstants {
  zero(0),
  appBar(4);

  const ElevationConstants(this.value);

  final double value;
}
