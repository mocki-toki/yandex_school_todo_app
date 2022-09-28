import 'package:core_domain/core_domain.dart';
import 'package:core_infrastructure/core_infrastructure.dart';

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
