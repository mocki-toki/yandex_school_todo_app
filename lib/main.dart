import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_app/app/app.dart';
import 'package:todo_app/modules/task/domain/domain.dart';
import 'package:todo_app/modules/task/presentation/presentation.dart';
import 'package:todo_app/modules/task/infrastructure/infrastructure.dart';

import 'firebase_options.dart';

const _loggingEnabled = true;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO: перенести инициализацию
  initLogger();
  await initFirebase();
  await initHive();

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

void initLogger() {
  Logger.root.level = _loggingEnabled ? Level.ALL : Level.OFF;
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      print('${record.level.name}: ${record.time}: ${record.loggerName}'
          '\n${record.message}');
    }
  });
}

Future<void> initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (!kDebugMode) {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  }

  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(minutes: 5),
  ));
  await remoteConfig.fetchAndActivate();

  Logger('main').info('Firebase initialized');
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

  Logger('main').info('Hive initialized');
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
