import 'dart:ui';

import 'package:task_domain/task_domain.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    @StringToUuidConvertor() required UuidValue id,
    required String text,
    required Importance importance,
    @StringToDateTimeOrNullConverter() required DateTime? deadline,
    required bool done,
    @HexToColorOrNullConverter() required Color? color,
    @IntToDateTimeConvertor()
    @JsonKey(name: 'created_at')
        required DateTime createdAt,
    @IntToDateTimeConvertor()
    @JsonKey(name: 'changed_at')
        required DateTime changedAt,
    @StringToDeviceIdentifierConvertor()
    @JsonKey(name: 'last_updated_by')
        required DeviceIdentifier lastUpdatedBy,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}

enum Importance {
  @JsonValue('basic')
  none,
  low,
  @JsonValue('important')
  high,
}
