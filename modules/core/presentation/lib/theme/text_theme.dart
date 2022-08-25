import 'package:core_presentation/core_presentation.dart';

TextTheme getTextTheme(
  Color primary,
  Color secondary,
  Color tertiary,
  Color disable,
) {
  return TextTheme(
    // Large title — 32/38
    headlineLarge: TextStyle(
      color: primary,
      fontWeight: FontWeight.w500,
      fontSize: 32,
      height: 38 / 32,
    ),

    // Title — 20/32
    headline6: TextStyle(
      color: primary,
      fontWeight: FontWeight.w500,
      fontSize: 20,
      height: 32 / 20,
    ),

    // Button — 14/24
    button: const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height: 24 / 14,
    ),

    // Body — 16/20
    bodyText1: const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 20 / 16,
    ),

    // Subhead — 14/20
    bodyText2: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 20 / 14,
      color: tertiary,
    ),
  );
}
