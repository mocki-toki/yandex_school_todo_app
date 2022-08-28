import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:task_domain/task_domain.dart';
import 'package:task_infrastructure/task_infrastructure.dart';

import 'package:flutter_test/flutter_test.dart';

@GenerateMocks([StorageTaskBackend, NetworkTaskBackend])
import 'task_repository_impl_test.mocks.dart';

final _demoTask = Task(
  id: UuidValue('55f7e73a-266c-11ed-a261-0242ac120002'),
  text: "test 123",
  importance: Importance.high,
  deadline: DateTime.fromMillisecondsSinceEpoch(1000),
  done: false,
  color: null,
  changedAt: DateTime.fromMillisecondsSinceEpoch(500),
  createdAt: DateTime.fromMillisecondsSinceEpoch(100),
  lastUpdatedBy: DeviceIdentifier('97f61d46-266c-11ed-a261-0242ac120002'),
);

void main() {
  late MockStorageTaskBackend storage;
  late MockNetworkTaskBackend network;
  late TaskRepositoryImpl repository;

  setUp(() async {
    storage = MockStorageTaskBackend();
    network = MockNetworkTaskBackend();
    repository = TaskRepositoryImpl(storage, network);

    when(storage.getStorageRevision).thenAnswer((_) => Revision(1));
  });

  test('TaskRepositoryImpl: creating task', () async {
    when(storage.createTask(any)).thenAnswer((_) async => _demoTask);
    when(network.createTask(any, any)).thenAnswer(
      (_) async {
        return TaskResponse(
          status: 'ok',
          revision: Revision(1),
          element: _demoTask,
        );
      },
    );

    final stream = repository.createTask(_demoTask);

    await for (final event in stream) {
      final data = event.getRight().toNullable()!;

      expect(data, equals(_demoTask));
    }
  });

  test('TaskRepositoryImpl: deleting task', () async {
    when(storage.deleteTask(any)).thenAnswer((_) async => _demoTask);
    when(network.deleteTask(any, any)).thenAnswer(
      (_) async {
        return TaskResponse(
          status: 'ok',
          revision: Revision(1),
          element: _demoTask,
        );
      },
    );

    final stream = repository.deleteTask(_demoTask.id);

    await for (final event in stream) {
      final data = event.getRight().toNullable()!;

      expect(data, equals(_demoTask));
    }
  });

  test('TaskRepositoryImpl: editing task', () async {
    when(storage.editTask(any)).thenAnswer((_) async => _demoTask);
    when(network.editTask(any, any, any)).thenAnswer(
      (_) async {
        return TaskResponse(
          status: 'ok',
          revision: Revision(1),
          element: _demoTask,
        );
      },
    );

    final stream = repository.editTask(_demoTask);

    await for (final event in stream) {
      final data = event.getRight().toNullable()!;

      expect(data, equals(_demoTask));
    }
  });

  test('TaskRepositoryImpl: get task', () async {
    when(storage.getTask(any)).thenAnswer((_) async => _demoTask);
    when(network.getTask(any)).thenAnswer(
      (_) async {
        return TaskResponse(
          status: 'ok',
          revision: Revision(1),
          element: _demoTask,
        );
      },
    );

    final stream = repository.getTask(_demoTask.id);

    await for (final event in stream) {
      final data = event.getRight().toNullable()!;

      expect(data, equals(_demoTask));
    }
  });

  test('TaskRepositoryImpl: synchronization storage with network', () async {
    when(storage.getTaskList()).thenAnswer((_) async => [_demoTask]);
    when(storage.getMergedTaskList(any)).thenAnswer((_) async => [_demoTask]);
    when(network.getTaskList()).thenAnswer(
      (_) async {
        return TaskListResponse(
          status: 'ok',
          revision: Revision(1),
          list: [_demoTask],
        );
      },
    );

    final response = await repository.synchronizeStorageWithNetwork();

    final data = response.getRight().toNullable()!;
    expect(data, equals([_demoTask]));
  });
}
