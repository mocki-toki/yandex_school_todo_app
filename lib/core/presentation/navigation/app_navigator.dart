import 'package:todo_app/core/presentation/presentation.dart';

class AppNavigator {
  final GlobalKey<NavigatorState> _key = GlobalKey();
  GlobalKey<NavigatorState> get key => _key;

  Future<T?> navigateTo<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return _key.currentState!.pushNamed(routeName, arguments: arguments);
  }

  void pop([Object? result]) {
    return _key.currentState!.pop(result);
  }

  Future<T?> pushDialog<T>(RawDialogRoute<T> route) async {
    return _key.currentState!.push<T>(route);
  }
}
