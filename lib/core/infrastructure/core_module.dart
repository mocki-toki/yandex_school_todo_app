import 'package:todo_app/core/infrastructure/infrastructure.dart';

extension CoreModuleExtensions on ServiceCollection {
  void addCoreModule() {
    addSingleton<DeviceIdentifierProvider>();
    addSingletonFactory(
      (sp) => sp.getRequired<DeviceIdentifierProvider>().deviceIdentifier,
    );

    addSingleton<DioProvider>();
    addSingletonFactory((sp) => sp.getRequired<DioProvider>().dio);
  }
}
