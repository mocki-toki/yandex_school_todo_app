import 'package:app_presentation/app_presentation.dart';
import 'package:task_domain/task_domain.dart';
import 'package:task_presentation/task_presentation.dart';

class AppRouterDelegate extends RouterDelegate<AppRouterConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRouterConfig>
    implements TaskNavigator {
  AppRouterDelegate(this._firebaseObservers);

  final FirebaseAnalyticsObserver _firebaseObservers;

  bool _isNotFound = false;
  bool _isTask = false;
  UuidValue? _taskId;
  Task? _task;

  @override
  void showNotFound() {
    _isNotFound = true;
    notifyListeners();
  }

  @override
  void showTaskList() {
    _isNotFound = false;
    _isTask = false;
    _taskId = null;
    _task = null;
    notifyListeners();
  }

  @override
  void createTask() {
    _isNotFound = false;
    _isTask = true;
    _taskId = null;
    _task = null;
    notifyListeners();
  }

  @override
  void editTask({required UuidValue taskId, Task? task}) {
    _isNotFound = false;
    _isTask = true;
    _taskId = taskId;
    _task = task;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      observers: [_firebaseObservers],
      pages: [
        MaterialPage(
          child: TaskListScreen(),
        ),
        if (_isTask)
          MaterialPage(
            child: TaskEditScreen(taskId: _taskId, task: _task),
          ),
        if (_isNotFound)
          MaterialPage(
            child: NotFoundScreen(),
          ),
      ],
      onPopPage: (route, result) => route.didPop(result),
    );
  }

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  AppRouterConfig? get currentConfiguration {
    if (_isNotFound == true) {
      return AppRouterConfig.notFound();
    } else if (!_isTask) {
      return AppRouterConfig.taskList();
    } else if (_isTask && _taskId == null) {
      return AppRouterConfig.createTask();
    } else if (_isTask && _taskId != null) {
      return AppRouterConfig.editTask(_taskId!, task: _task);
    } else {
      return null;
    }
  }

  @override
  Future<void> setNewRoutePath(AppRouterConfig configuration) async {
    if (configuration.isNotFound) {
      _isNotFound = true;
    } else if (!configuration.isTask) {
      _isNotFound = false;
      _isTask = false;
      _taskId = null;
      _task = null;
    } else if (configuration.taskId != null) {
      _isNotFound = false;
      _isTask = false;
      _taskId = null;
      _task = null;
    } else {
      throw UnimplementedError();
    }
  }
}
