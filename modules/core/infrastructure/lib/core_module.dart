import 'package:core_infrastructure/core_infrastructure.dart';

extension CoreModuleExtensions on ServiceCollection {
  void addCoreModule() {
    addSingleton<DeviceIdentifierProvider>();
    addSingletonFactory(
      (sp) => sp.getRequired<DeviceIdentifierProvider>().deviceIdentifier,
    );

    addSingleton<DioProvider>();
    addSingletonFactory(
      (sp) => sp.getRequired<DioProvider>().dio,
    );

    addSingleton<FirebaseAnalyticsProvider>();
    addSingletonFactory(
      (sp) => sp.getRequired<FirebaseAnalyticsProvider>().analytics,
    );

    addSingleton<FirebaseAnalyticsServiceImpl>();
  }

  void initializeAndAddRemoteConfigs() {
    addSingleton<FirebaseRemoteConfigProvider>();
    addSingletonFactory(
      (sp) => sp.getRequired<FirebaseRemoteConfigProvider>().remoteConfig,
    );
  }
}
