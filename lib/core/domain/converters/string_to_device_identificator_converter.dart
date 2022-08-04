import 'package:todo_app/core/domain/domain.dart';

class StringToDeviceIdentificatorConvertor
    implements JsonConverter<DeviceIdentificator, String> {
  const StringToDeviceIdentificatorConvertor();

  @override
  DeviceIdentificator fromJson(String deviceIdentificatorString) {
    return DeviceIdentificator(deviceIdentificatorString);
  }

  @override
  String toJson(DeviceIdentificator deviceIdentificator) =>
      deviceIdentificator.deviceId;
}
