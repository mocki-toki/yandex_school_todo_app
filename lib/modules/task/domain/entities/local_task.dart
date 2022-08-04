import 'package:todo_app/modules/task/domain/domain.dart';

part 'local_task.freezed.dart';
part 'local_task.g.dart';

@freezed
class LocalTask with _$LocalTask {
  const factory LocalTask(
    Task task, {
    required LocalTaskState state,
  }) = _LocalTask;

  factory LocalTask.fromJson(Map<String, dynamic> json) =>
      _$LocalTaskFromJson(json);
}

enum LocalTaskState {
  created,
  deleted,
  edited,
  unchanged,
}
