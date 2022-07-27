// ignore_for_file: unused_element

import 'package:flutter/services.dart';
import 'package:todo_app/core/presentation/presentation.dart';

// Support
const Color _colorSupportSeparator = Color(0x33000000);
const Color _colorSupportOverlay = Color(0x0F000000);

// Label
const Color _colorLabelPrimary = Color(0xFF000000);
const Color _colorLabelSecondary = Color(0x99000000);
const Color _colorLabelTertiary = Color(0x4D000000);
const Color _colorLabelDisable = Color(0x26000000);

// Color
const Color lightThemeColorRed = Color(0xFFFF3B30);
const Color lightThemeColorGreen = Color(0xFF34C759);
const Color lightThemeColorBlue = Color(0xFF007AFF);
const Color lightThemeColorGray = Color(0xFF8E8E93);
const Color lightThemeColorGrayLight = Color(0xFFD1D1D6);
const Color lightThemeColorWhite = Color(0xFFFFFFFF);

// Back
const Color _colorBackPrimary = Color(0xFFF7F6F2);
const Color _colorBackSecondary = Color(0xFFFFFFFF);
const Color _colorBackElevated = Color(0xFFFFFFFF);

final ThemeData lightThemeData = ThemeData(
  brightness: Brightness.light,
  fontFamily: "Roboto",
  textTheme: getTextTheme(
    _colorLabelPrimary,
    _colorLabelSecondary,
    _colorLabelTertiary,
    _colorLabelDisable,
  ),
  primaryColor: lightThemeColorBlue,
  colorScheme: const ColorScheme.light(
    secondary: lightThemeColorBlue,
    onSecondary: lightThemeColorWhite,
    primary: lightThemeColorBlue,
  ),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
    foregroundColor: _colorLabelPrimary,
    backgroundColor: _colorBackPrimary,
  ),
  scaffoldBackgroundColor: _colorBackPrimary,
  iconTheme: const IconThemeData(color: _colorLabelTertiary),
  cardTheme: getCardTheme(_colorBackSecondary),
  hintColor: _colorLabelTertiary,
  dividerColor: _colorSupportSeparator,
  disabledColor: _colorLabelDisable,
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return lightThemeColorBlue;
      }

      return _colorBackElevated;
    }),
    trackColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return lightThemeColorBlue.withOpacity(0.5);
      }
      return _colorSupportOverlay;
    }),
  ),
);
