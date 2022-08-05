import 'package:flutter/foundation.dart';
import 'package:todo_app/modules/task/domain/domain.dart';
import 'package:todo_app/modules/task/infrastructure/infrastructure.dart';

class TaskRepositoryImpl implements TaskRepository {
  const TaskRepositoryImpl(this._storage, this._network);

  final StorageTaskBackend _storage;
  final NetworkTaskBackend _network;

  @override
  Stream<Iterable<Task>> get taskListFromStorage => _storage.taskList;

  @override
  Future<Either<Failure, Iterable<Task>>>
      synchronizeStorageWithNetwork() async {
    // получаем данные из storage и network
    final taskListOrFailureFromStorage =
        await _storage.getTaskList().toEntity<Iterable<Task>>()
          ..log(Logger('TaskStorageBackend'));
    final responseOrFailureFromNetwork =
        await _network.getTaskList().toEntity<TaskListResponse>()
          ..log(Logger('TaskNetworkBackend'));

    // проверяем полученные данные на ошибки
    final taskListFromStorage =
        taskListOrFailureFromStorage.getRight().toNullable();
    if (taskListFromStorage == null) {
      return Left(taskListOrFailureFromStorage.getLeft().toNullable()!);
    }

    final responseFromNetwork =
        responseOrFailureFromNetwork.getRight().toNullable();
    if (responseFromNetwork == null) {
      return Left(responseOrFailureFromNetwork.getLeft().toNullable()!);
    }

    // мержим данные из storage и network
    final mergedOrFailureTaskList = await _storage
        .getMergedTaskList(responseFromNetwork.list!)
        .toEntity<Iterable<Task>>();

    return await mergedOrFailureTaskList.mapData(
      (mergedTaskList) async {
        // если это имело смысл,
        // или если данные в storage и network не совпадают,
        // то сохраняем данные в storage,
        // отправляем замерженные данные в network и возвращаем результат
        if (!listEquals(
                mergedTaskList.toList(), taskListFromStorage.toList()) ||
            !listEquals(
                mergedTaskList.toList(), responseFromNetwork.list!.toList())) {
          await _storage.updateTaskList(mergedTaskList);

          final responseOrFailureFromNetwork = await _network
              .updateTaskList(
                responseFromNetwork.revision.value,
                TaskListRequest(list: mergedTaskList),
              )
              .toEntity<TaskListResponse>()
            ..log(Logger('TaskNetworkBackend'))
            ..onData((data) async {
              await _storage.saveStorageRevision(data.revision);
              await _storage.resetLocalTaskStatesForSynchonizedTaskList(
                data.list!.map((e) => e.id),
              );
            });

          return responseOrFailureFromNetwork.map((e) => e.list!);
        }

        // если не имело смысла мержить, то вернуть актуальные network данные
        return Right(responseFromNetwork.list!);
      },
    );
  }

  @override
  Stream<Either<Failure, Task>> getTask(UuidValue taskId) async* {
    yield await _storage.getTask(taskId).toEntity<Task>()
      ..log(Logger('TaskStorageBackend'));

    final responseOrFailureFromNetwork =
        await _network.getTask(taskId.uuid).toEntity<TaskResponse>()
          ..log(Logger('TaskNetworkBackend'))
          ..onData((data) async {
            await _storage.saveStorageRevision(data.revision);
            await _storage.resetLocalTaskStatesForSynchonizedTaskList(
              [data.element!.id],
            );
          });

    yield responseOrFailureFromNetwork.map((data) => data.element!);
  }

  @override
  Stream<Either<Failure, Task>> createTask(Task task) async* {
    final taskFromStorageOrFailure =
        await _storage.createTask(task).toEntity<Task>()
          ..log(Logger('TaskStorageBackend'));

    if (taskFromStorageOrFailure.getLeft().toNullable()?.type ==
        BackendFailureType.duplicateItem) {
      yield* editTask(task);
      return;
    }

    yield taskFromStorageOrFailure;

    final responseOrFailureFromNetwork = await _network
        .createTask(
          _storage.getStorageRevision.value,
          TaskRequest(element: task),
        )
        .toEntity<TaskResponse>()
      ..log(Logger('TaskNetworkBackend'))
      ..onData((data) async {
        await _storage.saveStorageRevision(data.revision);
        await _storage.resetLocalTaskStatesForSynchonizedTaskList(
          [data.element!.id],
        );
      });

    yield responseOrFailureFromNetwork.map((data) => data.element!);
  }

  @override
  Stream<Either<Failure, Task>> editTask(Task task) async* {
    final taskFromStorageOrFailure =
        await _storage.editTask(task).toEntity<Task>()
          ..log(Logger('TaskStorageBackend'));

    if (taskFromStorageOrFailure.getLeft().toNullable()?.type ==
        BackendFailureType.notFound) {
      yield* createTask(task);
      return;
    }

    yield taskFromStorageOrFailure;

    final responseOrFailureFromNetwork = await _network
        .editTask(
          _storage.getStorageRevision.value,
          task.id.uuid,
          TaskRequest(element: task),
        )
        .toEntity<TaskResponse>()
      ..log(Logger('TaskNetworkBackend'))
      ..onData((data) async {
        await _storage.saveStorageRevision(data.revision);
        await _storage.resetLocalTaskStatesForSynchonizedTaskList(
          [data.element!.id],
        );
      });

    yield responseOrFailureFromNetwork.map((data) => data.element!);
  }

  @override
  Stream<Either<Failure, Task>> deleteTask(UuidValue taskId) async* {
    yield await _storage.deleteTask(taskId).toEntity<Task>()
      ..log(Logger('TaskStorageBackend'));

    final responseOrFailureFromNetwork = await _network
        .deleteTask(
          _storage.getStorageRevision.value,
          taskId.uuid,
        )
        .toEntity<TaskResponse>()
      ..log(Logger('TaskNetworkBackend'))
      ..onData((data) async {
        await _storage.saveStorageRevision(data.revision);
        await _storage.resetLocalTaskStatesForSynchonizedTaskList(
          [data.element!.id],
        );
      });

    yield responseOrFailureFromNetwork.map((data) => data.element!);
  }
}
