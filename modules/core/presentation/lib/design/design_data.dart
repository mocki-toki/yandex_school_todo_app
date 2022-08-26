import 'package:core_presentation/core_presentation.dart';

class DesignData {
  const DesignData({
    required this.styles,
    this.defaultTextStyle,
  });

  final DesignStyles styles;
  final TextStyle? defaultTextStyle;

  DesignTextStyle get textStyle {
    return DesignTextStyle(
      palette: styles.palette,
      defaultTextStyle: defaultTextStyle,
    );
  }

  ThemeData get themeData {
    return DesignThemeData(
      palette: styles.palette,
      designTextStyle: textStyle,
    ).themeData;
  }
}
