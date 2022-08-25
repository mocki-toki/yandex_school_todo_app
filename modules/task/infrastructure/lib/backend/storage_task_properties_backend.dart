import 'package:task_infrastructure/task_infrastructure.dart';

const _doneTasksVisiblityKey = 'done_tasks_visiblity';

class StorageTaskPropertiesBackend implements Initializable {
  @override
  Future<void> initialize() {
    return Hive.openBox(
      TaskInfrastructureConstants.taskListPropertiesBoxName,
    );
  }

  bool get getDoneTasksVisiblity {
    final box = _taskListPropertiesBox();
    return box.get(_doneTasksVisiblityKey) ?? true;
  }

  Future<void> setDoneTasksVisiblity(bool value) {
    final box = _taskListPropertiesBox();
    return box.put(_doneTasksVisiblityKey, value);
  }

  Box _taskListPropertiesBox() {
    return Hive.box(
      TaskInfrastructureConstants.taskListPropertiesBoxName,
    );
  }
}
