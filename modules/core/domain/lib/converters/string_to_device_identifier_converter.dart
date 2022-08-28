import 'package:core_domain/core_domain.dart';

class StringToDeviceIdentifierConvertor
    implements JsonConverter<DeviceIdentifier, String> {
  const StringToDeviceIdentifierConvertor();

  @override
  DeviceIdentifier fromJson(String deviceIdentifierString) {
    return DeviceIdentifier(deviceIdentifierString);
  }

  @override
  String toJson(DeviceIdentifier deviceIdentifier) => deviceIdentifier.deviceId;
}
