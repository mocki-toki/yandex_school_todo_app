import 'package:todo_app/modules/task/domain/domain.dart';
import 'package:todo_app/modules/task/infrastructure/infrastructure.dart';
import 'package:todo_app/modules/task/presentation/presentation.dart';

class TaskEditViewModelProvider extends ViewModelProvider<TaskEditViewModel> {
  TaskEditViewModelProvider({
    super.key,
    Task? editedTask,
    super.child,
  }) : super(
          (_, sp) => TaskEditViewModel(
            sp.getRequired<TaskRepository>(),
            sp.getRequired<DeviceIdentificator>(),
            editedTask,
          ),
        );
}

class TaskEditViewModel extends Cubit<TaskEditState> {
  TaskEditViewModel(
    this._taskRepository,
    this._deviceIdentificator,
    this._editedTask,
  ) : super(
          TaskEditState.newTask(
            textController: TextEditingController(),
            importance: Importance.none,
          ),
        ) {
    if (_editedTask != null) {
      emit(TaskEditState.editTask(
        editedTask: _editedTask!,
        textController: TextEditingController(text: _editedTask!.text),
        importance: _editedTask!.importance,
        deadline: _editedTask!.deadline,
      ));

      getData();
    }
  }

  final TaskRepository _taskRepository;
  final DeviceIdentificator _deviceIdentificator;
  final Task? _editedTask;

  Future<void> getData() async {
    assert(state is TaskEditStateEditTask);
    final typedState = state as TaskEditStateEditTask;

    final response = _taskRepository.getTask(typedState.editedTask.id);
    await response.last.then((event) {
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
      var typedState = state as TaskEditStateEditTask;
      emit(typedState.copyWith(deadline: dateTime));
    } else {
      var typedState = state as TaskEditStateNewTask;
      emit(typedState.copyWith(deadline: dateTime));
    }
  }

  void setImportance(Importance? value) {
    if (value != null) {
      emit(state.copyWith(importance: value));
    }
  }

  Future<void> createTask([Task? requestTask]) async {
    requestTask ??= _requestTaskFromState;

    final response = _taskRepository
        .createTask(
          requestTask,
        )
        .asBroadcastStream();

    response.synchronizeData(
      onUnsynchronized: () async {
        await _taskRepository.synchronizeStorageWithNetwork();
        createTask(requestTask);
      },
    );
    return response.handleFirstEvent((event) => null);
  }

  Future<void> editTask([Task? requestTask]) async {
    requestTask ??= _requestTaskFromState;

    final response = _taskRepository.editTask(requestTask).asBroadcastStream();

    response.synchronizeData(
      onUnsynchronized: () async {
        await _taskRepository.synchronizeStorageWithNetwork();
        editTask(requestTask);
      },
    );
    return response.handleFirstEvent((event) => null);
  }

  Future<void> deleteTask() async {
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
    return response.handleFirstEvent((event) => null);
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
        lastUpdatedBy: _deviceIdentificator,
      );
    }
  }
}
