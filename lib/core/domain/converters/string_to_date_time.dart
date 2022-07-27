import 'package:todo_app/core/domain/domain.dart';

class StringToDateTimeConvertor implements JsonConverter<DateTime, int> {
  const StringToDateTimeConvertor();

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
