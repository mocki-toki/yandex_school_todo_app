import 'package:flutter/foundation.dart';
import 'package:todo_app/app/app.dart';
import 'package:todo_app/modules/task/domain/domain.dart';
import 'package:todo_app/modules/task/presentation/presentation.dart';
import 'package:todo_app/modules/task/infrastructure/infrastructure.dart';

Future<void> main() async {
  initLogger();
  final scope = await initDinoScope();

  runApp(
    Provider.value(
      value: scope.serviceProvider,
      child: const Application(),
    ),
  );
}

// TODO: вынести?
void initLogger() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    }
  });
}

Future<ServiceScope> initDinoScope() async {
  final ServiceCollection services = RuntimeServiceCollection();

  services.addInstance(DioFactory.create());

  services.addSingletonFactory<TaskRestClient>(
    (sp) => TaskRestClient(sp.getRequired<Dio>()),
  );

  services.addSingletonFactory<TaskRepository>(
    (sp) => TaskRepositoryImpl(sp.getRequired<TaskRestClient>()),
  );

  final scope = services.buildRootScope();
  await scope.initialize();

  return scope;
}
