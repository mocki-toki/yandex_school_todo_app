import 'package:todo_app/core/presentation/presentation.dart';

extension BuildContextExtensions on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;

  App get localizations => AppLocalizations.of(this);

  AppNavigator get navigator => read<AppNavigator>();
  Future<T?> navigateTo<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return navigator.navigateTo(routeName, arguments: arguments);
  }

  void pop([Object? result]) => navigator.pop(result);
  Future<T?> pushDialog<T extends Object?>(RawDialogRoute<T> route) {
    return navigator.pushDialog(route);
  }
}
