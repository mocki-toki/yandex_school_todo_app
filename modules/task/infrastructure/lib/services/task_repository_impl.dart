import 'dart:async';

import 'package:task_domain/task_domain.dart';
import 'package:task_infrastructure/task_infrastructure.dart';

class TaskRepositoryImpl implements TaskRepository {
  TaskRepositoryImpl(this._storage, this._network) {
    _connectivityStream = Connectivity().onConnectivityChanged;
  }

  final StorageTaskBackend _storage;
  final NetworkTaskBackend _network;

  late final Stream<ConnectivityResult> _connectivityStream;

  @override
  Stream<Iterable<Task>> get taskListFromStorageStream => _storage.taskList;

  @override
  Stream<void> get networkStateChangedStream {
    return _connectivityStream.map((event) {
      Logger("${runtimeType}").info('Network state changed: $event');
    });
  }

  @override
  Future<Either<Failure, Iterable<Task>>>
      synchronizeStorageWithNetwork() async {
    // получаем данные из storage и network
    final taskListOrFailureFromStorage = _storage
        .getTaskList()
        .toEntity<Iterable<Task>>()
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
    final mergedOrFailureTaskList = _storage
        .getMergedTaskList(responseFromNetwork.list!)
        .toEntity<Iterable<Task>>();

    return await mergedOrFailureTaskList.mapData(
      (mergedTaskList) async {
        // TODO: отправлять только по необходимости
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
      },
    );
  }

  @override
  Stream<Either<Failure, Task>> getTask(UuidValue taskId) async* {
    yield _storage.getTask(taskId).toEntity<Task>()
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
