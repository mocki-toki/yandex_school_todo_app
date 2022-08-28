import 'package:core_presentation/core_presentation.dart';

extension BuildContextExtensions on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;

  App get localizations => AppLocalizations.of(this);
  ServiceProvider get sp => read<ServiceProvider>();

  DesignData get design => DesignProvider.of(this);
  DesignStyles get styles => design.styles;
  DesignPalette get palette => styles.palette;
  DesignTextStyle get textStyle => design.textStyle;
}
