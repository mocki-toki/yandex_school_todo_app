import 'package:todo_app/core/domain/domain.dart';
import 'package:todo_app/core/infrastructure/infrastructure.dart';

const _deviceIdentifierKey = 'device_identifier';

class DeviceIdentifierProvider implements Initializable {
  late DeviceIdentifier deviceIdentifier;

  @override
  Future<void> initialize() async {
    final box =
        await Hive.openBox(CoreInfrastructureConstants.propertiesBoxName);
    var identifier = box.get(_deviceIdentifierKey);

    if (identifier == null) {
      identifier = const Uuid().v1();
      box.put(_deviceIdentifierKey, identifier);
    }

    deviceIdentifier = DeviceIdentifier(identifier);
  }
}
