import 'package:core_presentation/core_presentation.dart';

extension BuildContextExtensions on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;

  App get localizations => AppLocalizations.of(this);
  ServiceProvider get sp => read<ServiceProvider>();
}
