import 'package:todo_app/modules/task/domain/domain.dart';

part 'task_list_request.g.dart';

@JsonSerializable()
class TaskListRequest extends ServerRequest<Task> {
  const TaskListRequest({
    required Iterable<Task> super.list,
  });

  Map<String, dynamic> toJson() => _$TaskListRequestToJson(this);
}
