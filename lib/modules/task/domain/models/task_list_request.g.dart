// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskListRequest _$TaskListRequestFromJson(Map<String, dynamic> json) =>
    TaskListRequest(
      list: (json['list'] as List<dynamic>)
          .map((e) => Task.fromJson(e as Map<String, dynamic>)),
    );

Map<String, dynamic> _$TaskListRequestToJson(TaskListRequest instance) =>
    <String, dynamic>{
      'list': instance.list?.toList(),
    };
