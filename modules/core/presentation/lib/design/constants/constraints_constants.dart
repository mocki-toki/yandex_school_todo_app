import 'package:core_presentation/core_presentation.dart';

enum ConstraintsConstants {
  multiLineTextField(BoxConstraints(minHeight: 104)),
  selectMenu(BoxConstraints(minWidth: 144));

  const ConstraintsConstants(this.boxConstraints);

  final BoxConstraints boxConstraints;
}
