import 'package:task_domain/task_domain.dart';
import 'package:task_infrastructure/task_infrastructure.dart';

part 'network_task_backend.g.dart';

@RestApi(baseUrl: CoreInfrastructureConstants.apiUrl)
abstract class NetworkTaskBackend {
  factory NetworkTaskBackend(Dio dio) = _NetworkTaskBackend;

  @GET('/list/')
  Future<TaskListResponse> getTaskList();

  @PATCH('/list/')
  Future<TaskListResponse> updateTaskList(
    @Header('X-Last-Known-Revision') int revision,
    @Body() TaskListRequest request,
  );

  @GET('/list/{taskId}')
  Future<TaskResponse> getTask(@Path('taskId') String taskId);

  @POST('/list/')
  Future<TaskResponse> createTask(
    @Header('X-Last-Known-Revision') int revision,
    @Body() TaskRequest request,
  );

  @PUT('/list/{taskId}')
  Future<TaskResponse> editTask(
    @Header('X-Last-Known-Revision') int revision,
    @Path('taskId') String taskId,
    @Body() TaskRequest request,
  );

  @DELETE('/list/{taskId}')
  Future<TaskResponse> deleteTask(
    @Header('X-Last-Known-Revision') int revision,
    @Path('taskId') String taskId,
  );
}
