import 'package:task_domain/task_domain.dart';
import 'package:task_presentation/task_presentation.dart';

part 'task_edit_state.freezed.dart';

@freezed
class TaskEditState with _$TaskEditState {
  const factory TaskEditState.newTask({
    required TextEditingController textController,
    required Importance importance,
    DateTime? deadline,
  }) = TaskEditStateNewTask;

  const factory TaskEditState.editTask({
    required Task editedTask,
    required TextEditingController textController,
    required Importance importance,
    DateTime? deadline,
  }) = TaskEditStateEditTask;
}
