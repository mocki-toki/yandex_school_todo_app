abstract class TaskPropertiesRepository {
  bool get getDoneTasksVisiblity;
  Future<void> setDoneTasksVisiblity(bool isVisible);
}
