import 'dart:async';

import 'package:todo_app/modules/task/domain/domain.dart';
import 'package:todo_app/modules/task/infrastructure/infrastructure.dart';
import 'package:todo_app/modules/task/presentation/presentation.dart';

class TaskListViewModelProvider extends ViewModelProvider<TaskListViewModel> {
  TaskListViewModelProvider({
    super.key,
    super.child,
  }) : super(
          (_, sp) => TaskListViewModel(
            sp.getRequired<TaskRepository>(),
          ),
        );
}

class TaskListViewModel extends Cubit<TaskListState> {
  TaskListViewModel(this._taskRepository)
      : super(const TaskListState.initial(
          visibleDoneTasks: false,
          syncState: TaskListSyncState.error,
        )) {
    reload();
    setReloadTask();
  }

  final TaskRepository _taskRepository;

  Timer? _reloadTimer;

  @override
  Future<void> close() {
    _reloadTimer?.cancel();
    return super.close();
  }

  void setReloadTask() {
    assert(_reloadTimer == null);
    _reloadTimer =
        Timer.periodic(const Duration(seconds: 10), (timer) => reload());
  }

  Future<void> reload() async {
    if (state is! TaskListStateLoaded) {
      emit(TaskListState.loading(
        visibleDoneTasks: state.visibleDoneTasks,
        syncState: state.syncState,
      ));
    } else {
      emit(state.copyWith(
        syncState: TaskListSyncState.loading,
      ));
    }
    final response = await _taskRepository.getTaskList();

    final newState = response.toState(
      (data) => TaskListState.loaded(
        data,
        visibleDoneTasks: state.visibleDoneTasks,
        syncState: TaskListSyncState.loaded,
      ),
      (failure) => state is TaskListStateLoaded
          ? state.copyWith(syncState: TaskListSyncState.error)
          : TaskListState.error(
              failure,
              visibleDoneTasks: state.visibleDoneTasks,
              syncState: TaskListSyncState.error,
            ),
    );

    emit(newState);
  }

  void changeVisibilityDoneTasks(bool visible) {
    emit(state.copyWith(visibleDoneTasks: visible));
  }

  Future<void> deleteTask(Task task) async {
    await _taskRepository.deleteTask(task.id);
    reload();
  }

  Future<void> setDoneTask(Task task, bool value) async {
    await _taskRepository.editTask(
      task.copyWith(done: value, changedAt: DateTime.now()),
    );
    reload();
  }
}
