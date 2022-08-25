import 'package:task_domain/task_domain.dart';

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

  @override
  String toString() =>
      'TaskResponse { status: $status, revision: $revision, element: $element }';
}
