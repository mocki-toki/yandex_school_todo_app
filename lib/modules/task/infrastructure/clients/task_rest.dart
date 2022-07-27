import 'package:todo_app/modules/task/domain/domain.dart';
import 'package:todo_app/modules/task/infrastructure/infrastructure.dart';

part 'task_rest.g.dart';

@RestApi(baseUrl: CoreInfrastructureConstants.apiUrl)
abstract class TaskRestClient {
  factory TaskRestClient(Dio dio) = _TaskRestClient;

  @GET('/list/')
  Future<TaskListResponse> getTaskList();

  @GET('/list/{taskId}')
  Future<TaskResponse> getTask(@Path('taskId') String taskId);
}
