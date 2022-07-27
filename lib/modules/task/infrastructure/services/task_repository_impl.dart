import 'package:todo_app/modules/task/domain/domain.dart';
import 'package:todo_app/modules/task/infrastructure/infrastructure.dart';

class TaskRepositoryImpl implements TaskRepository {
  const TaskRepositoryImpl(this._client);

  final TaskRestClient _client;

  @override
  Future<Either<Failure, Iterable<Task>>> getTaskList() async {
    final response = await _client.getTaskList().toEntity((data) => data.list!);
    response.log(Logger('TaskRepository'));

    return response;
  }

  @override
  Future<Either<Failure, Task>> getTask(UuidValue taskId) async {
    final response =
        await _client.getTask('$taskId').toEntity((data) => data.element!);
    response.log(Logger('TaskRepository'));

    return response;
  }

  @override
  Future<Either<Failure, Task>> deleteTask(UuidValue task) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Task>> editTask(Task task) {
    // TODO: implement editTask
    throw UnimplementedError();
  }
}
