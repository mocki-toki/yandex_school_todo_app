import 'package:core_presentation/core_presentation.dart';

mixin CoreNavigatorMixin on ChangeNotifier {
  var isNotFound = false;

  void showNotFound() {
    isNotFound = true;
    notifyListeners();
  }
}
