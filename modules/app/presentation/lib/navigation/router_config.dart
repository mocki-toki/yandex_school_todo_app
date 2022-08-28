import 'package:task_domain/task_domain.dart';

class AppRouterConfig {
  final bool isNotFound;
  final bool isTask;
  final UuidValue? taskId;
  final Task? cachedTask;

  AppRouterConfig.notFound()
      : isNotFound = true,
        isTask = false,
        taskId = null,
        cachedTask = null;

  AppRouterConfig.taskList()
      : isNotFound = false,
        isTask = false,
        taskId = null,
        cachedTask = null;

  AppRouterConfig.createTask()
      : isNotFound = false,
        isTask = true,
        taskId = null,
        cachedTask = null;

  AppRouterConfig.editTask(UuidValue taskId, {Task? cachedTask})
      : isNotFound = false,
        isTask = true,
        taskId = taskId,
        cachedTask = cachedTask;
}
