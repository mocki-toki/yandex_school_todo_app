import 'package:task_domain/task_domain.dart';
import 'package:task_infrastructure/task_infrastructure.dart';

class TaskPropertiesRepositoryImpl extends TaskPropertiesRepository {
  TaskPropertiesRepositoryImpl(this._storage);
  final StorageTaskPropertiesBackend _storage;

  @override
  bool get doneTasksVisiblity => _storage.doneTasksVisibility;

  @override
  Future<void> setDoneTasksVisiblity(bool isVisible) {
    return _storage.setDoneTasksVisiblity(isVisible);
  }
}
