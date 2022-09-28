import 'package:task_domain/task_domain.dart';

part 'task_request.g.dart';

@JsonSerializable()
class TaskRequest extends ServerRequest<Task> {
  const TaskRequest({
    required super.element,
  });

  Map<String, dynamic> toJson() => _$TaskRequestToJson(this);
}
