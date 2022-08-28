// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      id: const StringToUuidConvertor().fromJson(json['id'] as String),
      text: json['text'] as String,
      importance: $enumDecode(_$ImportanceEnumMap, json['importance']),
      deadline: const StringToDateTimeOrNullConverter()
          .fromJson(json['deadline'] as int?),
      done: json['done'] as bool,
      color:
          const HexToColorOrNullConverter().fromJson(json['color'] as String?),
      createdAt:
          const IntToDateTimeConvertor().fromJson(json['created_at'] as int),
      changedAt:
          const IntToDateTimeConvertor().fromJson(json['changed_at'] as int),
      lastUpdatedBy: const StringToDeviceIdentifierConvertor()
          .fromJson(json['last_updated_by'] as String),
    );

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'id': const StringToUuidConvertor().toJson(instance.id),
      'text': instance.text,
      'importance': _$ImportanceEnumMap[instance.importance]!,
      'deadline':
          const StringToDateTimeOrNullConverter().toJson(instance.deadline),
      'done': instance.done,
      'color': const HexToColorOrNullConverter().toJson(instance.color),
      'created_at': const IntToDateTimeConvertor().toJson(instance.createdAt),
      'changed_at': const IntToDateTimeConvertor().toJson(instance.changedAt),
      'last_updated_by': const StringToDeviceIdentifierConvertor()
          .toJson(instance.lastUpdatedBy),
    };

const _$ImportanceEnumMap = {
  Importance.none: 'basic',
  Importance.low: 'low',
  Importance.high: 'important',
};
