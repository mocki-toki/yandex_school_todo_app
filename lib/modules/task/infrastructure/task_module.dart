import 'package:todo_app/modules/task/infrastructure/infrastructure.dart';

extension TaskModuleExtensions on ServiceCollection {
  void addTaskModule() {
    addSingleton<StorageTaskPropertiesBackend>();
    addSingleton<StorageTaskBackend>();
    addSingleton<NetworkTaskBackend>();

    addSingleton<TaskPropertiesRepositoryImpl>();
    addSingleton<TaskRepositoryImpl>();
  }
}
