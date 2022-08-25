import 'package:task_domain/task_domain.dart';

part 'task_list_request.g.dart';

@JsonSerializable()
class TaskListRequest extends ServerRequest<Task> {
  const TaskListRequest({
    required Iterable<Task> super.list,
  });

  Map<String, dynamic> toJson() => _$TaskListRequestToJson(this);
}
