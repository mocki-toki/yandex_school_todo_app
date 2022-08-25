import 'package:task_domain/task_domain.dart';

class AppRouterConfig {
  final bool isNotFound;
  final bool isTask;
  final UuidValue? taskId;
  final Task? task;

  AppRouterConfig.notFound()
      : isNotFound = true,
        isTask = false,
        taskId = null,
        task = null;

  AppRouterConfig.taskList()
      : isNotFound = false,
        isTask = false,
        taskId = null,
        task = null;

  AppRouterConfig.createTask()
      : isNotFound = false,
        isTask = true,
        taskId = null,
        task = null;

  AppRouterConfig.editTask(UuidValue taskId, {Task? task})
      : isNotFound = false,
        isTask = true,
        taskId = taskId,
        task = task;
}
