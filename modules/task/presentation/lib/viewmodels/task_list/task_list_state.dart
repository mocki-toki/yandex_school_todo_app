import 'package:task_domain/task_domain.dart';

part 'task_list_state.freezed.dart';

@freezed
class TaskListState with _$TaskListState {
  const factory TaskListState.initial({
    required bool visibleDoneTasks,
    required TaskListSyncState syncState,
  }) = TaskListStateInitial;
  const factory TaskListState.loading({
    required bool visibleDoneTasks,
    required TaskListSyncState syncState,
  }) = TaskListStateLoading;
  const factory TaskListState.loaded(
    TaskListData data, {
    required bool visibleDoneTasks,
    required TaskListSyncState syncState,
  }) = TaskListStateLoaded;
  const factory TaskListState.error(
    Failure failure, {
    required bool visibleDoneTasks,
    required TaskListSyncState syncState,
  }) = TaskListStateError;
}

enum TaskListSyncState {
  loading,
  loaded,
  error,
}

@freezed
class TaskListData with _$TaskListData {
  const factory TaskListData(
    UnmodifiableListView<Task> originalTasks,
    UnmodifiableListView<Task> sortedTasks,
    int completedTasksCount,
  ) = _TaskListData;
}
