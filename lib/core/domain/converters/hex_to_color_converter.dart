import 'dart:ui';

import 'package:todo_app/core/domain/domain.dart';

class HexToColorConverter implements JsonConverter<Color, String> {
  const HexToColorConverter();

  @override
  Color fromJson(String colorString) {
    return _getColorFromHex(colorString);
  }

  @override
  String toJson(Color color) => _getHexFromColor(color);
}

class HexToColorOrNullConverter implements JsonConverter<Color?, String?> {
  const HexToColorOrNullConverter();

  @override
  Color? fromJson(String? colorString) {
    return colorString == null ? null : _getColorFromHex(colorString);
  }

  @override
  String? toJson(Color? color) =>
      color == null ? null : _getHexFromColor(color);
}

Color _getColorFromHex(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor";
  }
  return Color(int.parse(hexColor, radix: 16));
}

String _getHexFromColor(Color color) {
  return "#${color.value.toRadixString(16).substring(2)}";
}
