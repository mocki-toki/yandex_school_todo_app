import 'package:core_presentation/core_presentation.dart';

class MarginDivider extends Divider {
  const MarginDivider(
    this.margin, {
    super.key,
    super.color,
    super.endIndent,
    super.indent,
    super.thickness,
  }) : super(height: 0);

  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Divider(
        height: height,
        color: color,
        endIndent: endIndent,
        indent: indent,
        thickness: thickness,
      ),
    );
  }
}
