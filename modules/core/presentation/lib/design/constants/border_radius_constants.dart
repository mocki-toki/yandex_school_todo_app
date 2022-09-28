import 'package:core_presentation/core_presentation.dart';

enum BorderRadiusConstants {
  checkbox(BorderRadius.all(Radius.circular(2))),
  selectMenu(BorderRadius.all(Radius.circular(2))),
  card(BorderRadius.all(Radius.circular(8)));

  const BorderRadiusConstants(this.borderRadius);

  final BorderRadius borderRadius;

  Radius get borderRadiusTop {
    assert(borderRadius.topLeft == borderRadius.topRight);
    return borderRadius.topLeft;
  }

  Radius get borderRadiusBottom {
    assert(borderRadius.bottomLeft == borderRadius.bottomRight);
    return borderRadius.bottomLeft;
  }

  Radius get borderRadiusLeft {
    assert(borderRadius.topLeft == borderRadius.bottomLeft);
    return borderRadius.topLeft;
  }

  Radius get borderRadiusRight {
    assert(borderRadius.topRight == borderRadius.bottomRight);
    return borderRadius.topRight;
  }
}
