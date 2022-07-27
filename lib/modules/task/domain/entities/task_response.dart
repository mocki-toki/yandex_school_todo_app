import 'package:todo_app/modules/task/domain/domain.dart';

part 'task_response.g.dart';

@JsonSerializable()
class TaskResponse extends ServerResponse<Task> {
  const TaskResponse({
    required super.status,
    required super.revision,
    required super.element,
  });

  factory TaskResponse.fromJson(Map<String, dynamic> json) =>
      _$TaskResponseFromJson(json);
}
