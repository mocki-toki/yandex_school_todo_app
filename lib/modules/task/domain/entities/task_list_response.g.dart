// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskListResponse _$TaskListResponseFromJson(Map<String, dynamic> json) =>
    TaskListResponse(
      status: json['status'] as String,
      revision: json['revision'] as int,
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>)),
    );

Map<String, dynamic> _$TaskListResponseToJson(TaskListResponse instance) =>
    <String, dynamic>{
      'list': instance.list?.toList(),
      'status': instance.status,
      'revision': instance.revision,
    };
