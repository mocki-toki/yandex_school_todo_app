// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskResponse _$TaskResponseFromJson(Map<String, dynamic> json) => TaskResponse(
      status: json['status'] as String,
      revision:
          const IntToRevisionConvertor().fromJson(json['revision'] as int),
      element: json['element'] == null
          ? null
          : Task.fromJson(json['element'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TaskResponseToJson(TaskResponse instance) =>
    <String, dynamic>{
      'element': instance.element,
      'status': instance.status,
      'revision': const IntToRevisionConvertor().toJson(instance.revision),
    };
