import 'dart:async';

import 'package:app_presentation/app_presentation.dart';
import 'package:flutter/foundation.dart';
import 'package:task_infrastructure/task_infrastructure.dart';

import 'main.dino.g.dart';

Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      initLogger();
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

  await FirebaseCrashlytics.instance
      .setCrashlyticsCollectionEnabled(!kDebugMode);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

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

  services.initializeAndAddRemoteConfigs();

  final scope = services.buildRootScope();
  await scope.initialize();

  return scope;
}
