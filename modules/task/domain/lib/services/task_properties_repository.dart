abstract class TaskPropertiesRepository {
  bool get doneTasksVisiblity;
  Future<void> setDoneTasksVisiblity(bool isVisible);
}
