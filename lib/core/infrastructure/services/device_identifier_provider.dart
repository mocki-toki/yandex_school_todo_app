import 'package:todo_app/core/domain/domain.dart';
import 'package:todo_app/core/infrastructure/infrastructure.dart';

const _deviceIdentifierKey = 'device_identifier';

class DeviceIdentifierProvider {
  static Future<DeviceIdentifier> resolve() async {
    final box =
        await Hive.openBox(CoreInfrastructureConstants.propertiesBoxName);
    var identifier = box.get(_deviceIdentifierKey);

    if (identifier == null) {
      identifier = const Uuid().v1();
      box.put(_deviceIdentifierKey, identifier);
    }

    return DeviceIdentifier(identifier);
  }
}
