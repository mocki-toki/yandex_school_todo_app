import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:task_infrastructure/task_infrastructure.dart';
import 'package:flutter_test/flutter_test.dart';

@GenerateMocks([StorageTaskPropertiesBackend])
import 'task_properties_repository_impl_test.mocks.dart';

void main() {
  late MockStorageTaskPropertiesBackend storage;
  late TaskPropertiesRepositoryImpl repository;

  setUp(() async {
    storage = MockStorageTaskPropertiesBackend();
    repository = TaskPropertiesRepositoryImpl(storage);
  });

  test(
    'TaskPropertiesRepositoryImpl: setting doneTaskVisiblity property',
    () async {
      when(storage.doneTasksVisibility).thenAnswer((_) => false);

      await repository.setDoneTasksVisiblity(false);

      verify(storage.setDoneTasksVisiblity(false));
      expect(repository.doneTasksVisiblity, equals(false));

      when(storage.doneTasksVisibility).thenAnswer((_) => true);

      await repository.setDoneTasksVisiblity(true);

      verify(storage.setDoneTasksVisiblity(true));
      expect(repository.doneTasksVisiblity, equals(true));
    },
  );
}
