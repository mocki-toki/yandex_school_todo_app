import 'package:core_presentation/core_presentation.dart';

class DesignTextStyle {
  const DesignTextStyle({
    required this.palette,
    this.defaultTextStyle,
  });

  final DesignPalette palette;
  final TextStyle? defaultTextStyle;

  TextStyle get font {
    return (defaultTextStyle ?? TextStyle()).copyWith(
      color: palette.colorLabelPrimary,
    );
  }

  TextStyle get largeTitle {
    return font.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 32,
      height: 38 / 32,
    );
  }

  TextStyle get title {
    return font.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 20,
      height: 32 / 20,
    );
  }

  TextStyle get button {
    return font.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height: 24 / 14,
    );
  }

  TextStyle get body {
    return font.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 20 / 16,
    );
  }

  TextStyle get subhead {
    return font.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 20 / 14,
    );
  }

  TextTheme get textTheme {
    return TextTheme(
      headlineLarge: largeTitle,
      headline6: title,
      button: button,
      bodyText1: body,
      bodyText2: subhead,
    );
  }
}
