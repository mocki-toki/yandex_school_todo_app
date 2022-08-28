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

  const factory TaskEditState.loadingTask({
    required UuidValue taskId,
  }) = TaskEditStateLoadingTask;

  const factory TaskEditState.loadedTask({
    required UuidValue taskId,
    required Task task,
    required TextEditingController textController,
    required Importance importance,
    DateTime? deadline,
  }) = TaskEditStateLoadedTask;

  const factory TaskEditState.errorTask({
    required UuidValue taskId,
    required Failure failure,
  }) = TaskEditStateErrorTask;
}
