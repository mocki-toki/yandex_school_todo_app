import 'package:flutter/foundation.dart';
import 'package:todo_app/app/app.dart';
import 'package:todo_app/modules/task/domain/domain.dart';
import 'package:todo_app/modules/task/presentation/presentation.dart';
import 'package:todo_app/modules/task/infrastructure/infrastructure.dart';

Future<void> main() async {
  await initHive();
  initLogger();
  final scope = await initDinoScope();

  runApp(
    Provider.value(
      value: scope.serviceProvider,
      child: const Application(),
    ),
  );
}

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(LocalTaskAdapter());

  // TODO: добавить поддержку forced-миграции
  await Hive.openBox<LocalTask>(
    TaskInfrastructureConstants.taskListDataBoxName,
  );
  await Hive.openBox(
    TaskInfrastructureConstants.taskListPropertiesBoxName,
  );
}

void initLogger() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      print('${record.level.name}: ${record.time}: ${record.loggerName}'
          '\n${record.message}');
    }
  });
}

Future<ServiceScope> initDinoScope() async {
  final ServiceCollection services = RuntimeServiceCollection();

  services.addInstance(await DeviceIdentifierProvider.resolve());
  services.addInstance(DioFactory.create());

  services.addInstance(StorageTaskPropertiesBackend());
  services.addInstance(StorageTaskBackend());
  services.addSingletonFactory<NetworkTaskBackend>(
    (sp) => NetworkTaskBackend(sp.getRequired<Dio>()),
  );

  services.addSingletonFactory<TaskPropertiesRepository>(
    (sp) => TaskPropertiesRepositoryImpl(
      sp.getRequired<StorageTaskPropertiesBackend>(),
    ),
  );
  services.addSingletonFactory<TaskRepository>(
    (sp) => TaskRepositoryImpl(
      sp.getRequired<StorageTaskBackend>(),
      sp.getRequired<NetworkTaskBackend>(),
    ),
  );

  final scope = services.buildRootScope();
  await scope.initialize();

  return scope;
}
