import 'package:core_presentation/core_presentation.dart';

// TODO: сделать провайдер для темы

CardTheme getCardTheme(Color color) {
  return CardTheme(
    color: color,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );
}

extension ColorsThemeDataExtension on ThemeData {
  bool get isLight => brightness == Brightness.light;
  Color get colorRed => isLight ? lightThemeColorRed : darkThemeColorRed;
  Color get colorGreen => isLight ? lightThemeColorGreen : darkThemeColorGreen;
  Color get colorBlue => isLight ? lightThemeColorBlue : darkThemeColorBlue;
  Color get colorGray => isLight ? lightThemeColorGray : darkThemeColorGray;
  Color get colorGrayLight =>
      isLight ? lightThemeColorGrayLight : darkThemeColorGrayLight;
  Color get colorWhite => isLight ? lightThemeColorWhite : darkThemeColorWhite;
}
