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
            sp.getRequired<TaskPropertiesRepository>(),
            sp.getRequired<DeviceIdentifier>(),
          ),
        );
}

class TaskListViewModel extends Cubit<TaskListState> {
  TaskListViewModel(
    this._taskRepository,
    this._taskPropertiesRepository,
    this._deviceIdentifier,
  ) : super(const TaskListState.initial(
          visibleDoneTasks: false,
          syncState: TaskListSyncState.error,
        )) {
    restoreVisibleDoneTasksState();
    synchronizeStorageWithNetwork();
    setSyncTimer();
    subscribeToTaskListFromStorage();
    subscribeToConnectivityState();
  }

  final TaskRepository _taskRepository;
  final TaskPropertiesRepository _taskPropertiesRepository;
  final DeviceIdentifier _deviceIdentifier;

  Timer? _syncTimer;
  Timer? _retrySyncAfterErrorTimer;
  StreamSubscription<Iterable<Task>>? _taskListSubscription;
  StreamSubscription<ConnectivityResult>? _connectivityStateSubscription;

  @override
  Future<void> close() {
    _syncTimer?.cancel();
    _retrySyncAfterErrorTimer?.cancel();
    _taskListSubscription?.cancel();
    _connectivityStateSubscription?.cancel();
    return super.close();
  }

  void setSyncTimer() {
    _syncTimer = Timer.periodic(
      const Duration(minutes: 1),
      (_) {
        if (state.syncState != TaskListSyncState.error) {
          synchronizeStorageWithNetwork();
        }
      },
    );
  }

  void setRetrySyncAfterErrorTimer() {
    _retrySyncAfterErrorTimer = Timer.periodic(
      const Duration(seconds: 10),
      (_) => synchronizeStorageWithNetwork(),
    );
  }

  void disableRetryLoadAfterErrorTimer() {
    _retrySyncAfterErrorTimer?.cancel();
  }

  void subscribeToTaskListFromStorage() {
    _taskListSubscription = getSubscriptionToTaskListFromStorage();
  }

  // TODO: перенести в репозиторий
  void subscribeToConnectivityState() {
    _connectivityStateSubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      synchronizeStorageWithNetwork();
      Logger("TaskListViewModel").info('Connectivity changed: $result');
    });
  }

  StreamSubscription<Iterable<Task>> getSubscriptionToTaskListFromStorage() {
    return _taskRepository.taskListFromStorage.listen(
      (taskList) {
        emit(
          TaskListState.loaded(
            TaskListData(
              taskList,
              _sortTasks(taskList, state.visibleDoneTasks),
              taskList.where((task) => task.done).length,
            ),
            visibleDoneTasks: state.visibleDoneTasks,
            syncState: state.syncState,
          ),
        );
      },
    );
  }

  Future<void> synchronizeStorageWithNetwork({bool forced = false}) async {
    if (state.syncState == TaskListSyncState.loading && !forced) return;
    disableRetryLoadAfterErrorTimer();

    try {
      if (state is TaskListStateLoaded) {
        emit(state.copyWith(
          visibleDoneTasks: state.visibleDoneTasks,
          syncState: TaskListSyncState.loading,
        ));
      } else {
        emit(TaskListState.loading(
          visibleDoneTasks: state.visibleDoneTasks,
          syncState: TaskListSyncState.loading,
        ));
      }

      final synchronizedTaskListOrFailure =
          await _taskRepository.synchronizeStorageWithNetwork();

      return emit(
        synchronizedTaskListOrFailure.fold(
          (failure) {
            setRetrySyncAfterErrorTimer();

            if (state is TaskListStateLoaded) {
              return state.copyWith(
                visibleDoneTasks: state.visibleDoneTasks,
                syncState: TaskListSyncState.error,
              );
            } else {
              return TaskListState.error(
                failure,
                visibleDoneTasks: state.visibleDoneTasks,
                syncState: TaskListSyncState.error,
              );
            }
          },
          (taskList) {
            return state.copyWith(
              visibleDoneTasks: state.visibleDoneTasks,
              syncState: TaskListSyncState.loaded,
            );
          },
        ),
      );
    } on StateError catch (_) {
      Logger('TaskListViewModel').info(
          "StateError ignored (_syncTimer: ${_syncTimer?.isActive},"
          " _retrySyncAfterErrorTimer: ${_retrySyncAfterErrorTimer?.isActive}");

      _syncTimer?.cancel();
      _retrySyncAfterErrorTimer?.cancel();
      return;
    }
  }

  Future<void> setDoneTask(Task task, bool value) {
    return _handleResponse(
      _taskRepository.editTask(
        task.copyWith(
          done: value,
          changedAt: DateTime.now(),
          lastUpdatedBy: _deviceIdentifier,
        ),
      ),
    );
  }

  Future<void> deleteTask(Task task) {
    return _handleResponse(
      _taskRepository.deleteTask(task.id),
      deleted: true,
    );
  }

  Future<void> quickCreateTask(String text, bool done) {
    return _createTask(
      Task(
        id: const Uuid().v1obj(),
        text: text,
        importance: Importance.none,
        done: done,
        color: null,
        deadline: null,
        createdAt: DateTime.now(),
        changedAt: DateTime.now(),
        lastUpdatedBy: _deviceIdentifier,
      ),
    );
  }

  Future<void> _createTask(Task task) {
    return _handleResponse(
      _taskRepository.createTask(task),
    );
  }

  Future<void> _handleResponse(
    Stream<Either<Failure<dynamic>, Task>> response, {
    bool deleted = false,
  }) {
    response = response.asBroadcastStream();

    emit(
      state.copyWith(
        visibleDoneTasks: state.visibleDoneTasks,
        syncState: TaskListSyncState.loading,
      ),
    );

    response.synchronizeData(
      onSynchronized: () {
        emit(
          state.copyWith(
            visibleDoneTasks: state.visibleDoneTasks,
            syncState: TaskListSyncState.loaded,
          ),
        );
      },
      onUnsynchronized: () async {
        await synchronizeStorageWithNetwork(forced: true);
        _handleResponse(response);
      },
      onSynchronizationError: () => synchronizeStorageWithNetwork(forced: true),
      onFailure: (failure) {
        if (failure.type == BackendFailureType.notFound) {
          synchronizeStorageWithNetwork(forced: true);
        }

        if (state is TaskListStateLoaded) {
          emit(
            state.copyWith(
              visibleDoneTasks: state.visibleDoneTasks,
              syncState: TaskListSyncState.error,
            ),
          );
        } else {
          emit(
            TaskListState.error(
              failure,
              visibleDoneTasks: state.visibleDoneTasks,
              syncState: state.syncState,
            ),
          );
        }
      },
    );

    return response.handleFirstEvent(
      (event) {
        if (state is TaskListStateLoaded) {
          emit(
            state.copyWith(
              visibleDoneTasks: state.visibleDoneTasks,
              syncState: TaskListSyncState.loading,
            ),
          );
        } else {
          emit(
            TaskListState.error(
              event.getLeft().toNullable()!,
              visibleDoneTasks: state.visibleDoneTasks,
              syncState: state.syncState,
            ),
          );
        }
      },
    );
  }

  void restoreVisibleDoneTasksState() {
    final doneTasksVisibility = _taskPropertiesRepository.getDoneTasksVisiblity;
    emit(state.copyWith(visibleDoneTasks: doneTasksVisibility));
  }

  void changeVisibilityDoneTasks(bool visible) {
    _taskPropertiesRepository.setDoneTasksVisiblity(visible);

    if (state is TaskListStateLoaded) {
      final typedState = state as TaskListStateLoaded;
      final data = typedState.data.originalTasks;

      emit(typedState.copyWith(
        data: TaskListData(
          data,
          _sortTasks(data, visible),
          data.where((task) => task.done).length,
        ),
        visibleDoneTasks: visible,
      ));
    } else {
      emit(state.copyWith(
        visibleDoneTasks: visible,
      ));
    }
  }

  List<Task> _sortTasks(Iterable<Task> tasks, bool visibleDoneTasks) {
    if (!visibleDoneTasks) {
      return tasks.where((element) => !element.done).toList()
        ..sort((b, a) => b.createdAt.compareTo(a.createdAt));
    } else {
      return tasks.toList()..sort((b, a) => b.createdAt.compareTo(a.createdAt));
    }
  }
}
