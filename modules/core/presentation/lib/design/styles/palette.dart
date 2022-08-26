import 'package:core_presentation/core_presentation.dart';

class DesignPalette {
  DesignPalette.light({
    required this.colorSupportSeparator,
    required this.colorSupportOverlay,
    required this.colorLabelPrimary,
    required this.colorLabelSecondary,
    required this.colorLabelTertiary,
    required this.colorLabelDisable,
    required this.colorRed,
    required this.colorGreen,
    required this.colorBlue,
    required this.colorGray,
    required this.colorGrayLight,
    required this.colorWhite,
    required this.colorBackPrimary,
    required this.colorBackSecondary,
    required this.colorBackElevated,
  }) : brightness = Brightness.light;

  DesignPalette.dark({
    required this.colorSupportSeparator,
    required this.colorSupportOverlay,
    required this.colorLabelPrimary,
    required this.colorLabelSecondary,
    required this.colorLabelTertiary,
    required this.colorLabelDisable,
    required this.colorRed,
    required this.colorGreen,
    required this.colorBlue,
    required this.colorGray,
    required this.colorGrayLight,
    required this.colorWhite,
    required this.colorBackPrimary,
    required this.colorBackSecondary,
    required this.colorBackElevated,
  }) : brightness = Brightness.dark;

  final Brightness brightness;

  // Support
  final Color colorSupportSeparator;
  final Color colorSupportOverlay;

  // Label
  final Color colorLabelPrimary;
  final Color colorLabelSecondary;
  final Color colorLabelTertiary;
  final Color colorLabelDisable;

  // Color
  final Color colorRed;
  final Color colorGreen;
  final Color colorBlue;
  final Color colorGray;
  final Color colorGrayLight;
  final Color colorWhite;

  // Back
  final Color colorBackPrimary;
  final Color colorBackSecondary;
  final Color colorBackElevated;
}
