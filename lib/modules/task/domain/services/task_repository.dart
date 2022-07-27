import 'package:todo_app/modules/task/domain/domain.dart';

abstract class TaskRepository {
  Future<Either<Failure, Iterable<Task>>> getTaskList();
  Future<Either<Failure, Task>> getTask(UuidValue taskId);
  Future<Either<Failure, Task>> deleteTask(UuidValue task);
  Future<Either<Failure, Task>> editTask(Task task);
}
