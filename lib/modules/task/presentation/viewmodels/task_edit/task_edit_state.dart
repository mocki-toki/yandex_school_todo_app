import 'package:todo_app/modules/task/domain/domain.dart';
import 'package:todo_app/modules/task/presentation/presentation.dart';

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
