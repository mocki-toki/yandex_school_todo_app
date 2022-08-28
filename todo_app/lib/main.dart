import 'dart:async';

import 'package:app_presentation/app_presentation.dart';
import 'package:task_infrastructure/task_infrastructure.dart';

import 'main.dino.g.dart';

enum EnvironmentConfig {
  testing,
  production,
  debug,
}

late final EnvironmentConfig environment;

Future<void> main() async {
  environment = EnvironmentConfig.values.byName(const String.fromEnvironment(
    'environment',
    defaultValue: 'debug',
  ));

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      initLogger();
      Logger('main').config("Current environment: ${environment.name}");
      await _initDependencies();

      final scope = await _initDinoScope();
      final serviceProvider = scope.serviceProvider;

      runApp(
        Provider.value(
          value: serviceProvider,
          child: const Application(),
        ),
      );
    },
    (error, stack) =>
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true),
  );
}

Future<void> _initDependencies() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  if (environment == EnvironmentConfig.production) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  } else {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  }

  await Hive.initFlutter();
}

Future<ServiceScope> _initDinoScope() async {
  final ServiceCollection services = $ServiceCollection();

  services.addCoreModule();
  services.addTaskModule();

  services.addSingletonFactory<FirebaseAnalyticsObserver>(
    (sp) => sp.getRequired<FirebaseAnalyticsProvider>().getObserver(),
  );
  services.addSingleton<AppRouterDelegate>();

  if (environment != EnvironmentConfig.testing) {
    services.initializeAndAddRemoteConfigs();
  }

  final scope = services.buildRootScope();
  await scope.initialize();

  return scope;
}
