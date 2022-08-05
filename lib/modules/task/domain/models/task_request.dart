import 'package:todo_app/modules/task/domain/domain.dart';

part 'task_request.g.dart';

@JsonSerializable()
class TaskRequest extends ServerRequest<Task> {
  const TaskRequest({
    required super.element,
  });

  Map<String, dynamic> toJson() => _$TaskRequestToJson(this);
}
