import 'package:task_domain/task_domain.dart';

abstract class TaskRepository {
  Stream<Iterable<Task>> get taskListFromStorageStream;
  Stream<void> get networkStateChangedStream;
  Future<Either<Failure, Iterable<Task>>> synchronizeStorageWithNetwork();
  Stream<Either<Failure, Task>> getTask(UuidValue taskId);
  Stream<Either<Failure, Task>> createTask(Task task);
  Stream<Either<Failure, Task>> editTask(Task task);
  Stream<Either<Failure, Task>> deleteTask(UuidValue taskId);
}
