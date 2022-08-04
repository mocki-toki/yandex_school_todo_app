import 'package:todo_app/core/domain/domain.dart';
import 'package:todo_app/core/infrastructure/infrastructure.dart';

const _deviceIdentificatorKey = 'device_identificator';

class DeviceIdentificatorProvider {
  static Future<DeviceIdentificator> resolve() async {
    final box =
        await Hive.openBox(CoreInfrastructureConstants.propertiesBoxName);
    var identificator = box.get(_deviceIdentificatorKey);

    if (identificator == null) {
      identificator = const Uuid().v1();
      box.put(_deviceIdentificatorKey, identificator);
    }

    return DeviceIdentificator(identificator);
  }
}
