import 'package:todo_app/core/presentation/presentation.dart';

extension BuildContextExtensions on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;

  App get localizations => AppLocalizations.of(this);
}
