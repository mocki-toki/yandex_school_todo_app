import 'package:task_domain/task_domain.dart';
import 'package:task_presentation/task_presentation.dart';

mixin TaskNavigatorMixin on CoreNavigatorMixin {
  var isTask = false;
  UuidValue? taskId = null;
  Task? cachedTask = null;

  void showTaskList() {
    isNotFound = false;
    isTask = false;
    taskId = null;
    cachedTask = null;
    notifyListeners();
  }

  void createTask() {
    isNotFound = false;
    isTask = true;
    taskId = null;
    cachedTask = null;
    notifyListeners();
  }

  void editTask({required UuidValue taskId, Task? cachedTask}) {
    isNotFound = false;
    isTask = true;
    this.taskId = taskId;
    this.cachedTask = cachedTask;
    notifyListeners();
  }
}
