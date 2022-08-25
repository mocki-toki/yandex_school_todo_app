import 'package:task_domain/task_domain.dart';
import 'package:task_presentation/task_presentation.dart';

class TaskEditViewModelProvider extends ViewModelProvider<TaskEditViewModel> {
  TaskEditViewModelProvider({
    super.key,
    Task? editedTask,
    super.child,
  }) : super(
          (_, sp) => TaskEditViewModel(
            sp.getRequired<TaskRepository>(),
            sp.getRequired<DeviceIdentifier>(),
            sp.getRequired<FirebaseAnalyticsService>(),
            editedTask,
          ),
        );
}

class TaskEditViewModel extends Cubit<TaskEditState> {
  TaskEditViewModel(
    this._taskRepository,
    this._deviceIdentifier,
    this._analyticsService,
    Task? _editedTask,
  ) : super(
          TaskEditState.newTask(
            textController: TextEditingController(),
            importance: Importance.none,
          ),
        ) {
    if (_editedTask != null) {
      emit(TaskEditState.editTask(
        editedTask: _editedTask,
        textController: TextEditingController(text: _editedTask.text),
        importance: _editedTask.importance,
        deadline: _editedTask.deadline,
      ));

      getData();
    }
  }

  final TaskRepository _taskRepository;
  final DeviceIdentifier _deviceIdentifier;
  final FirebaseAnalyticsService _analyticsService;

  Future<void> getData() {
    assert(state is TaskEditStateEditTask);
    final typedState = state as TaskEditStateEditTask;

    final response = _taskRepository.getTask(typedState.editedTask.id);
    return response.last.then((event) {
      emit(event.fold(
        (failure) => state,
        (data) => TaskEditState.editTask(
          editedTask: data,
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
    if (state is TaskEditStateEditTask) {
      final typedState = state as TaskEditStateEditTask;
      emit(typedState.copyWith(deadline: dateTime));
    } else {
      final typedState = state as TaskEditStateNewTask;
      emit(typedState.copyWith(deadline: dateTime));
    }
  }

  void setImportance(Importance? value) {
    if (value != null) {
      emit(state.copyWith(importance: value));
    }
  }

  Future<void> createTask([Task? requestTask]) {
    requestTask ??= _requestTaskFromState;
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
    requestTask ??= _requestTaskFromState;
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
    assert(state is TaskEditStateEditTask);

    final typedState = state as TaskEditStateEditTask;
    final response = _taskRepository
        .deleteTask(typedState.editedTask.id)
        .asBroadcastStream();

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

  Task get _requestTaskFromState {
    if (state is TaskEditStateEditTask) {
      return (state as TaskEditStateEditTask).editedTask.copyWith(
            text: (state as TaskEditStateEditTask).textController.text,
            importance: (state as TaskEditStateEditTask).importance,
            deadline: (state as TaskEditStateEditTask).deadline,
          );
    } else {
      return Task(
        id: const Uuid().v1obj(),
        text: (state as TaskEditStateNewTask).textController.text,
        importance: (state as TaskEditStateNewTask).importance,
        deadline: (state as TaskEditStateNewTask).deadline,
        done: false,
        color: null,
        createdAt: DateTime.now(),
        changedAt: DateTime.now(),
        lastUpdatedBy: _deviceIdentifier,
      );
    }
  }
}
