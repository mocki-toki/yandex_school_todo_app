import 'package:core_domain/core_domain.dart';

class StringToUuidConvertor implements JsonConverter<UuidValue, String> {
  const StringToUuidConvertor();

  @override
  UuidValue fromJson(String uuidString) {
    if (uuidString.isEmpty) {
      throw Exception('Uuid must not be empty');
    }

    return UuidValue(uuidString, false);
  }

  @override
  String toJson(UuidValue uuid) => uuid.uuid;
}
