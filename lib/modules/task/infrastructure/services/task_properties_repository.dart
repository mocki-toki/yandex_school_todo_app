import 'package:todo_app/modules/task/domain/domain.dart';
import 'package:todo_app/modules/task/infrastructure/infrastructure.dart';

class TaskPropertiesRepositoryImpl extends TaskPropertiesRepository {
  TaskPropertiesRepositoryImpl(this._storage);
  final StorageTaskPropertiesBackend _storage;

  @override
  bool get getDoneTasksVisiblity => _storage.getDoneTasksVisiblity;

  @override
  Future<void> setDoneTasksVisiblity(bool isVisible) {
    return _storage.setDoneTasksVisiblity(isVisible);
  }
}
