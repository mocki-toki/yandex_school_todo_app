import 'package:core_presentation/core_presentation.dart';
import 'package:flutter/services.dart';

class DesignThemeData {
  const DesignThemeData({
    required this.palette,
    required this.designTextStyle,
  });

  final DesignPalette palette;
  final DesignTextStyle designTextStyle;

  bool get isDark => palette.brightness == Brightness.dark;

  ThemeData get themeData {
    return ThemeData(
      brightness: palette.brightness,
      textTheme: designTextStyle.textTheme,
      primaryColor: palette.colorBlue,
      colorScheme: _getColorScheme(),
      appBarTheme: _getAppBarTheme(),
      scaffoldBackgroundColor: palette.colorBackPrimary,
      iconTheme: _getIconTheme(),
      textButtonTheme: _textButtonTheme(),
      dialogBackgroundColor: palette.colorBackSecondary,
      hintColor: palette.colorLabelTertiary,
      dividerColor: palette.colorSupportSeparator,
      disabledColor: palette.colorLabelDisable,
      switchTheme: _getSwitchTheme(),
      listTileTheme: _listTileTheme(),
    );
  }

  ListTileThemeData _listTileTheme() {
    return ListTileThemeData(minLeadingWidth: 0);
  }

  TextButtonThemeData _textButtonTheme() {
    return TextButtonThemeData(
      style: ButtonStyle(
          padding: MaterialStateProperty.all(
        EdgeInsetsConstants.appBarElementPadding.edgeInsets,
      )),
    );
  }

  ColorScheme _getColorScheme() {
    if (!isDark) {
      return ColorScheme.light().copyWith(
        secondary: palette.colorBlue,
        onSecondary: palette.colorWhite,
        primary: palette.colorBlue,
      );
    } else {
      return ColorScheme.dark().copyWith(
        secondary: palette.colorBlue,
        onSecondary: palette.colorWhite,
        primary: palette.colorBlue,
        surface: palette.colorBlue,
        onSurface: palette.colorWhite,
        onPrimary: palette.colorWhite,
      );
    }
  }

  AppBarTheme _getAppBarTheme() {
    return AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: palette.brightness,
        statusBarIconBrightness: !isDark
            ? Brightness.dark
            : Brightness.light, // TODO: работает криво
        statusBarColor: Colors.transparent,
      ),
      foregroundColor: palette.colorLabelPrimary,
      backgroundColor:
          isDark ? palette.colorBackSecondary : palette.colorBackPrimary,
    );
  }

  IconThemeData _getIconTheme() {
    return IconThemeData(
      color: palette.colorLabelTertiary,
      size: 24,
    );
  }

  SwitchThemeData _getSwitchTheme() {
    return SwitchThemeData(
      thumbColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return palette.colorBlue;
        }

        return palette.colorBackElevated;
      }),
      trackColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return palette.colorBlue.withOpacity(0.5);
        }
        return palette.colorSupportOverlay;
      }),
    );
  }
}
