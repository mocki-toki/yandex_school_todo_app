import 'package:core_presentation/core_presentation.dart';

enum EdgeInsetsConstants {
  expandedAppBarPadding(EdgeInsets.fromLTRB(60, 50, 3, 16)),
  listCardMargin(EdgeInsets.fromLTRB(8, 2, 8, 90)),
  listCardPadding(EdgeInsets.symmetric(vertical: 8)),
  listCardItemPadding(EdgeInsets.symmetric(horizontal: 19, vertical: 14)),
  swipeIconPadding(EdgeInsets.symmetric(horizontal: 27)),
  cardMargin(EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
  textFieldPadding(EdgeInsets.all(16)),
  selectMenuPadding(EdgeInsets.all(16)),
  appBarElementPadding(EdgeInsets.all(16)),
  altAppBarElementPadding(EdgeInsets.all(6)),
  dialogMargin(EdgeInsets.all(20)),
  standartDivider(EdgeInsets.zero),
  altDivider(EdgeInsets.only(top: 24, bottom: 8));

  const EdgeInsetsConstants(this.edgeInsets);

  final EdgeInsets edgeInsets;
}
