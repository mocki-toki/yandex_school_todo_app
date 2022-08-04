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
            editedTask,
          ),
        );
}

class TaskEditViewModel extends Cubit<TaskEditState> {
  TaskEditViewModel(
    this._taskRepository,
    this.editedTask,
  ) : super(
          TaskEditState.newTask(
            textController: TextEditingController(),
            importance: Importance.basic,
          ),
        ) {
    if (editedTask != null) {
      emit(TaskEditState.editTask(
        editedTask: editedTask!,
        textController: TextEditingController(text: editedTask!.text),
        importance: editedTask!.importance,
        deadline: editedTask!.deadline,
      ));
    }
  }

  final TaskRepository _taskRepository;
  final Task? editedTask;

  void setDeadline(DateTime? dateTime) {
    assert(state is TaskEditStateLoaded || state is TaskEditStateInitial);

    if (state is TaskEditStateLoaded) {
      var typedState = state as TaskEditStateLoaded;
      emit(typedState.copyWith(deadline: dateTime));
    } else {
      var typedState = state as TaskEditStateInitial;
      emit(typedState.copyWith(deadline: dateTime));
    }
  }
}
