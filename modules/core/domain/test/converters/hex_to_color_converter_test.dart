import 'dart:ui';

import 'package:core_domain/core_domain.dart';
import 'package:test/test.dart';

void main() {
  test('HexToColorConverter: Convert HexColor to Color', () {
    final Color color = HexToColorConverter().fromJson('#3575a9');
    expect(color, equals(Color(0xFF3575A9)));

    final Color color2 = HexToColorConverter().fromJson('#902b16');
    expect(color2, equals(Color(0xFF902B16)));
  });

  test('HexToColorConverter: Convert Color to HexColor', () {
    final String hexColor = HexToColorConverter().toJson(Color(0xFF3575A9));
    expect(hexColor, equals('#3575a9'));

    final String hexColor2 = HexToColorConverter().toJson(Color(0xFF902B16));
    expect(hexColor2, equals('#902b16'));
  });
}
