import 'dart:async';

import 'package:task_domain/task_domain.dart';
import 'package:task_infrastructure/task_infrastructure.dart';

const _revisionKey = 'revision';

class StorageTaskBackend implements Initializable {
  @override
  Future<void> initialize() async {
    Hive.registerAdapter(LocalTaskAdapter());
    await Hive.openBox<LocalTask>(
      TaskInfrastructureConstants.taskListDataBoxName,
    );
    await Hive.openBox(
      TaskInfrastructureConstants.taskListDataPropertiesBoxName,
    );
  }

  Future<Iterable<Task>> getTaskList() async {
    final box = _taskListDataBox();

    final localTasks = box.values.where(
      (element) => element.state != LocalTaskState.deleted,
    );

    return localTasks.map((e) => e.task);
  }

  Stream<Iterable<Task>> get taskList {
    void listener(
      StreamController<Iterable<Task>> controller,
      Box<LocalTask> box,
    ) {
      controller.add(
        box.values
            .toList()
            .where((e) => e.state != LocalTaskState.deleted)
            .map((e) => e.task),
      );
    }

    final controller = StreamController<Iterable<Task>>();
    final box = _taskListDataBox().listenable();

    controller.onListen = controller.onResume = () {
      listener(controller, box.value);
      box.addListener(() => listener(controller, box.value));
    };

    controller.onCancel = controller.onPause = () {
      box.removeListener(() => listener(controller, box.value));
    };

    return controller.stream;
  }

  Future<void> updateTaskList(Iterable<Task> tasksFromServer) async {
    final box = _taskListDataBox();

    await box.clear();
    return box.putAll(
      {
        for (final task in tasksFromServer)
          task.id.uuid: LocalTask(task, state: LocalTaskState.unchanged)
      },
    );
  }

  Future<void> resetLocalTaskStatesForSynchonizedTaskList(
    Iterable<UuidValue> synchronizedTaskIdList,
  ) async {
    final box = _taskListDataBox();

    final unsynchronizedLocalTaskList = box.values.where(
      (element) =>
          element.state != LocalTaskState.deleted &&
          synchronizedTaskIdList.contains(element.task.id),
    );

    final deletedLocalTaskList = box.values.where(
      (element) =>
          element.state == LocalTaskState.deleted &&
          synchronizedTaskIdList.contains(element.task.id),
    );

    await box.deleteAll(deletedLocalTaskList.map((e) => e.task.id.uuid));
    return box.putAll(
      {
        for (final task in unsynchronizedLocalTaskList)
          task.task.id.uuid: LocalTask(
            task.task,
            state: LocalTaskState.unchanged,
          )
      },
    );
  }

  Future<Iterable<Task>> getMergedTaskList(
    Iterable<Task> tasksFromServer,
  ) async {
    final box = _taskListDataBox();
    final mergedTasks = tasksFromServer.toList();

    for (final localTask in box.values) {
      switch (localTask.state) {
        case LocalTaskState.created:
          mergedTasks.add(localTask.task);
          break;
        case LocalTaskState.deleted:
          mergedTasks.removeWhere(
            (element) =>
                element.id == localTask.task.id &&
                element.changedAt == localTask.task.changedAt,
          );
          break;
        case LocalTaskState.edited:
          if (mergedTasks
                  .indexWhere((element) => element.id == localTask.task.id) !=
              -1) {
            mergedTasks[mergedTasks.indexWhere(
                (element) => element.id == localTask.task.id)] = localTask.task;
          } else {
            mergedTasks.add(localTask.task);
          }
          break;
        case LocalTaskState.unchanged:
          break;
      }
    }

    return mergedTasks;
  }

  Future<Task> getTask(UuidValue taskId) async {
    final box = _taskListDataBox();

    final localTask = box.get(taskId.uuid);

    if (localTask == null || localTask.state == LocalTaskState.deleted) {
      throw StorageException(StorageExceptionType.notFound);
    }

    return localTask.task;
  }

  Future<Task> createTask(Task task) async {
    final box = _taskListDataBox();
    if (box.containsKey(task.id.uuid) &&
        box.get(task.id.uuid)!.state != LocalTaskState.deleted) {
      throw StorageException(StorageExceptionType.duplicateItem);
    }

    await box.put(
      task.id.uuid,
      LocalTask(task, state: LocalTaskState.created),
    );

    return task;
  }

  Future<Task> editTask(Task task) async {
    final taskId = task.id.uuid;

    final box = _taskListDataBox();
    if (!box.containsKey(taskId) ||
        box.get(taskId)!.state == LocalTaskState.deleted) {
      throw StorageException(StorageExceptionType.notFound);
    }

    await box.put(taskId, LocalTask(task, state: LocalTaskState.edited));

    return task;
  }

  Future<Task> deleteTask(UuidValue id) async {
    final box = _taskListDataBox();
    if (!box.containsKey(id.uuid) ||
        box.get(id.uuid)!.state == LocalTaskState.deleted) {
      throw StorageException(StorageExceptionType.notFound);
    }

    final localTask = box.get(id.uuid)!;
    await box.put(id.uuid, localTask.copyWith(state: LocalTaskState.deleted));

    return localTask.task;
  }

  Revision get getStorageRevision {
    final box = _taskListDataPropertiesBox();

    final value = box.get(_revisionKey) ?? 0;
    return Revision(value);
  }

  Future<void> saveStorageRevision(Revision revision) {
    final box = _taskListDataPropertiesBox();
    return box.put(_revisionKey, revision.value);
  }

  Box<LocalTask> _taskListDataBox() {
    return Hive.box<LocalTask>(
      TaskInfrastructureConstants.taskListDataBoxName,
    );
  }

  Box _taskListDataPropertiesBox() {
    return Hive.box(
      TaskInfrastructureConstants.taskListDataPropertiesBoxName,
    );
  }
}
