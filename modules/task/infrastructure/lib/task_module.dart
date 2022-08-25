import 'package:task_domain/task_domain.dart';
import 'package:task_infrastructure/task_infrastructure.dart';

extension TaskModuleExtensions on ServiceCollection {
  void addTaskModule() {
    addSingleton<StorageTaskPropertiesBackend>();
    addSingleton<StorageTaskBackend>();
    addSingleton<NetworkTaskBackend>();

    addSingleton<TaskPropertiesRepositoryImpl>();
    addSingleton<TaskRepositoryImpl>();

    addSingleton<SwitchPriorityColorRemoteConfig>();
  }
}
