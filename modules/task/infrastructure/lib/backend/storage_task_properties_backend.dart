import 'package:task_infrastructure/task_infrastructure.dart';

const doneTasksVisiblityKey = 'done_tasks_visiblity';

class StorageTaskPropertiesBackend implements Initializable {
  @override
  Future<void> initialize() {
    return Hive.openBox(
      TaskInfrastructureConstants.taskListPropertiesBoxName,
    );
  }

  bool get doneTasksVisibility {
    final box = _taskListPropertiesBox();
    return box.get(doneTasksVisiblityKey) ?? true;
  }

  Future<void> setDoneTasksVisiblity(bool value) {
    final box = _taskListPropertiesBox();
    return box.put(doneTasksVisiblityKey, value);
  }

  Box _taskListPropertiesBox() {
    return Hive.box(
      TaskInfrastructureConstants.taskListPropertiesBoxName,
    );
  }
}
