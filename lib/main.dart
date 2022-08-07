import 'package:todo_app/app/app.dart';

import 'package:todo_app/modules/task/presentation/presentation.dart';
import 'package:todo_app/modules/task/infrastructure/infrastructure.dart';

import 'main.dino.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initLogger();
  await Hive.initFlutter();
  await initFirebase();

  final scope = await initDinoScope();

  runApp(
    MultiProvider(
      providers: [
        Provider.value(
          value: scope.serviceProvider,
        ),
        Provider.value(
          value: SwitchPriorityColorConfig(),
        ),
      ],
      child: const Application(),
    ),
  );
}

Future<ServiceScope> initDinoScope() async {
  final ServiceCollection services = $ServiceCollection();

  services.addCoreModule();
  services.addTaskModule();

  final scope = services.buildRootScope();
  await scope.initialize();

  return scope;
}
