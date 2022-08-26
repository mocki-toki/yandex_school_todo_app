import 'package:app_presentation/app_presentation.dart';
import 'package:task_presentation/task_presentation.dart';

class AppRouterDelegate extends RouterDelegate<AppRouterConfig>
    with
        ChangeNotifier,
        CoreNavigatorMixin,
        TaskNavigatorMixin,
        PopNavigatorRouterDelegateMixin<AppRouterConfig> {
  AppRouterDelegate(this._firebaseObservers);

  final FirebaseAnalyticsObserver _firebaseObservers;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      observers: [_firebaseObservers],
      pages: [
        MaterialPage(
          child: TaskListScreen(),
        ),
        if (isTask)
          MaterialPage(
            child: TaskEditScreen(taskId: taskId, cachedTask: cachedTask),
          ),
        if (isNotFound)
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
    if (isNotFound == true) {
      return AppRouterConfig.notFound();
    } else if (!isTask) {
      return AppRouterConfig.taskList();
    } else if (isTask && taskId == null) {
      return AppRouterConfig.createTask();
    } else if (isTask && taskId != null) {
      return AppRouterConfig.editTask(taskId!, cachedTask: cachedTask);
    } else {
      return null;
    }
  }

  @override
  Future<void> setNewRoutePath(AppRouterConfig configuration) async {
    isNotFound = configuration.isNotFound;
    isTask = configuration.isTask;
    taskId = configuration.taskId;
    cachedTask = configuration.cachedTask;
  }
}
