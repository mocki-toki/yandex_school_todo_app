import 'package:todo_app/modules/task/domain/domain.dart';

part 'task_list_response.g.dart';

@JsonSerializable()
class TaskListResponse extends ServerResponse<Task> {
  const TaskListResponse({
    required super.status,
    required super.revision,
    required super.list,
  });

  factory TaskListResponse.fromJson(Map<String, dynamic> json) =>
      _$TaskListResponseFromJson(json);

  @override
  String toString() =>
      'TaskListResponse { status: $status, revision: $revision, list: $list }';
}
