import 'package:core_presentation/core_presentation.dart';

enum DeviceFormFactor {
  phone,
  tablet(contentMaxWidth: 800);

  const DeviceFormFactor({this.contentMaxWidth = double.infinity});

  final double contentMaxWidth;
}

extension DeviceFormFactorExtension on DeviceFormFactor {
  EdgeInsets getPaddingForScrollView(BuildContext context) {
    final side = context.mediaQuery.size.width - contentMaxWidth;
    return EdgeInsets.symmetric(horizontal: side / 2);
  }
}
