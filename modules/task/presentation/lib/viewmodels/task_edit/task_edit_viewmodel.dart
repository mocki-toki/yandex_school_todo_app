import 'package:task_domain/task_domain.dart';
import 'package:task_presentation/task_presentation.dart';

class TaskEditViewModelProvider extends ViewModelProvider<TaskEditViewModel> {
  TaskEditViewModelProvider({
    super.key,
    UuidValue? taskId,
    Task? cachedTask,
    super.child,
  }) : super(
          (_, sp) => TaskEditViewModel(
            sp.getRequired<TaskRepository>(),
            sp.getRequired<DeviceIdentifier>(),
            sp.getRequired<FirebaseAnalyticsService>(),
            taskId,
            cachedTask,
          ),
        );
}

class TaskEditViewModel extends Cubit<TaskEditState> {
  TaskEditViewModel(
    this._taskRepository,
    this._deviceIdentifier,
    this._analyticsService,
    UuidValue? _taskId,
    Task? _cachedTask,
  ) : super(
          TaskEditState.newTask(
            textController: TextEditingController(),
            importance: Importance.none,
          ),
        ) {
    if (_cachedTask != null) {
      emit(TaskEditState.loadedTask(
        taskId: _cachedTask.id,
        task: _cachedTask,
        textController: TextEditingController(text: _cachedTask.text),
        importance: _cachedTask.importance,
        deadline: _cachedTask.deadline,
      ));

      getData();
    }

    if (_taskId != null && _cachedTask == null) {
      emit(TaskEditState.loadingTask(taskId: _taskId));

      getData();
    }
  }

  final TaskRepository _taskRepository;
  final DeviceIdentifier _deviceIdentifier;
  final FirebaseAnalyticsService _analyticsService;

  Future<void> getData() {
    assert(state is! TaskEditStateNewTask);

    final taskId = state.maybeMap(
      loadingTask: (state) => state.taskId,
      loadedTask: (state) => state.taskId,
      errorTask: (state) => state.taskId,
      orElse: () => throw UnimplementedError(),
    );

    final response = _taskRepository.getTask(taskId);
    return response.last.then((event) {
      emit(event.fold(
        (failure) {
          if (failure.type == BackendFailureType.notFound) {
            if (state is TaskEditStateLoadedTask) {
              return state;
            }
          }

          return TaskEditState.errorTask(
            taskId: taskId,
            failure: failure,
          );
        },
        (data) => TaskEditState.loadedTask(
          taskId: data.id,
          task: data,
          textController: TextEditingController(text: data.text)
            ..selection = TextSelection.fromPosition(
                TextPosition(offset: data.text.length)),
          importance: data.importance,
          deadline: data.deadline,
        ),
      ));
    });
  }

  void setDeadline(DateTime? dateTime) {
    assert(state is TaskEditStateNewTask || state is TaskEditStateLoadedTask);

    emit(state.maybeMap(
      newTask: (state) => state.copyWith(deadline: dateTime),
      loadedTask: (state) => state.copyWith(deadline: dateTime),
      orElse: () => throw UnimplementedError(),
    ));
  }

  void setImportance(Importance? value) {
    assert(state is TaskEditStateNewTask || state is TaskEditStateLoadedTask);

    if (value != null) {
      emit(state.maybeMap(
        newTask: (state) => state.copyWith(importance: value),
        loadedTask: (state) => state.copyWith(importance: value),
        orElse: () => throw UnimplementedError(),
      ));
    }
  }

  Future<void> createTask([Task? requestTask]) {
    assert(state is TaskEditStateNewTask);

    requestTask ??= requestTaskFromState;
    final response =
        _taskRepository.createTask(requestTask).asBroadcastStream();

    response.synchronizeData(
      onUnsynchronized: () async {
        await _taskRepository.synchronizeStorageWithNetwork();
        createTask(requestTask);
      },
    );

    return response.handleFirstEvent((event) {
      event.onData(
        (data) => _analyticsService.sendEvent(
          CreateTaskAnalyticsEvent(data.id),
        ),
      );
    });
  }

  Future<void> editTask([Task? requestTask]) {
    assert(state is TaskEditStateLoadedTask);

    requestTask ??= requestTaskFromState;
    final response = _taskRepository.editTask(requestTask).asBroadcastStream();

    response.synchronizeData(
      onUnsynchronized: () async {
        await _taskRepository.synchronizeStorageWithNetwork();
        editTask(requestTask);
      },
    );

    return response.handleFirstEvent((event) {
      event.onData(
        (data) => _analyticsService.sendEvent(
          EditTaskAnalyticsEvent(data.id),
        ),
      );
    });
  }

  Future<void> deleteTask() {
    assert(state is TaskEditStateLoadedTask);

    final typedState = state as TaskEditStateLoadedTask;
    final response =
        _taskRepository.deleteTask(typedState.taskId).asBroadcastStream();

    response.synchronizeData(
      onUnsynchronized: () async {
        await _taskRepository.synchronizeStorageWithNetwork();
        deleteTask();
      },
    );

    return response.handleFirstEvent((event) {
      event.onData(
        (data) => _analyticsService.sendEvent(
          DeleteTaskAnalyticsEvent(data.id),
        ),
      );
    });
  }

  Task get requestTaskFromState {
    assert(state is TaskEditStateNewTask || state is TaskEditStateLoadedTask);

    return state.maybeMap(
      loadedTask: (state) => state.task.copyWith(
        text: state.textController.text,
        importance: state.importance,
        deadline: state.deadline,
      ),
      newTask: (state) => Task(
        id: const Uuid().v1obj(),
        text: state.textController.text,
        importance: state.importance,
        deadline: state.deadline,
        done: false,
        color: null,
        createdAt: DateTime.now(),
        changedAt: DateTime.now(),
        lastUpdatedBy: _deviceIdentifier,
      ),
      orElse: () => throw UnimplementedError(),
    );
  }
}
