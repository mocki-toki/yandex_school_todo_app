class DeviceIdentifier {
  const DeviceIdentifier(this.deviceId);

  final String deviceId;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceIdentifier &&
            other.deviceId == deviceId);
  }

  @override
  int get hashCode => Object.hash(
        runtimeType,
        deviceId.hashCode,
      );
}
