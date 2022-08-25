import 'package:task_domain/task_domain.dart';

abstract class TaskNavigator extends CoreNavigator {
  void showTaskList();
  void createTask();
  void editTask({required UuidValue taskId, Task? task});
}
