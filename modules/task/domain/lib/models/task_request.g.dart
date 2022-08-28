// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskRequest _$TaskRequestFromJson(Map<String, dynamic> json) => TaskRequest(
      element: json['element'] == null
          ? null
          : Task.fromJson(json['element'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TaskRequestToJson(TaskRequest instance) =>
    <String, dynamic>{
      'element': instance.element,
    };
