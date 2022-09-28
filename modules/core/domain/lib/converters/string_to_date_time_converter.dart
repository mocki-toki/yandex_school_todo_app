import 'package:core_domain/core_domain.dart';

class IntToDateTimeConvertor implements JsonConverter<DateTime, int> {
  const IntToDateTimeConvertor();

  @override
  DateTime fromJson(int timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }

  @override
  int toJson(DateTime date) => date.millisecondsSinceEpoch;
}

class StringToDateTimeOrNullConverter
    implements JsonConverter<DateTime?, int?> {
  const StringToDateTimeOrNullConverter();

  @override
  DateTime? fromJson(int? timestamp) {
    return timestamp == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(timestamp);
  }

  @override
  int? toJson(DateTime? date) => date?.millisecondsSinceEpoch;
}
