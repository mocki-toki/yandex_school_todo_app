// ignore_for_file: unused_element

import 'package:flutter/services.dart';
import 'package:todo_app/core/presentation/presentation.dart';

// Support
const Color _colorSupportSeparator = Color(0x33FFFFFF);
const Color _colorSupportOverlay = Color(0x52000000);

// Label
const Color _colorLabelPrimary = Color(0xFFFFFFFF);
const Color _colorLabelSecondary = Color(0x99FFFFFF);
const Color _colorLabelTertiary = Color(0x66FFFFFF);
const Color _colorLabelDisable = Color(0x26FFFFFF);

// Color
const Color darkThemeColorRed = Color(0xFFFF453A);
const Color darkThemeColorGreen = Color(0xFF32D74B);
const Color darkThemeColorBlue = Color(0xFF0A84FF);
const Color darkThemeColorGray = Color(0xFF8E8E93);
const Color darkThemeColorGrayLight = Color(0xFF48484A);
const Color darkThemeColorWhite = Color(0xFFFFFFFF);

// Back
const Color _colorBackPrimary = Color(0xFF161618);
const Color _colorBackSecondary = Color(0xFF252528);
const Color _colorBackElevated = Color(0xFF3C3C3F);

final ThemeData darkThemeData = ThemeData(
  brightness: Brightness.dark,
  fontFamily: "Roboto",
  textTheme: getTextTheme(
    _colorLabelPrimary,
    _colorLabelSecondary,
    _colorLabelTertiary,
    _colorLabelDisable,
  ),
  primaryColor: darkThemeColorBlue,
  colorScheme: const ColorScheme.dark(
    secondary: darkThemeColorBlue,
    onSecondary: darkThemeColorWhite,
    primary: darkThemeColorBlue,
    surface: darkThemeColorBlue,
    onSurface: darkThemeColorWhite,
    onPrimary: darkThemeColorWhite,
  ),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
    ),
    foregroundColor: _colorLabelPrimary,
    backgroundColor: _colorBackSecondary,
  ),
  scaffoldBackgroundColor: _colorBackPrimary,
  iconTheme: const IconThemeData(color: _colorLabelTertiary),
  cardTheme: getCardTheme(_colorBackSecondary),
  dialogBackgroundColor: _colorBackSecondary,
  hintColor: _colorLabelTertiary,
  dividerColor: _colorSupportSeparator,
  disabledColor: _colorLabelDisable,
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return darkThemeColorBlue;
      }

      return _colorBackElevated;
    }),
    trackColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return darkThemeColorBlue.withOpacity(0.5);
      }
      return _colorSupportOverlay;
    }),
  ),
);
