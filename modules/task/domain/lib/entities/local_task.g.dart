// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocalTask _$$_LocalTaskFromJson(Map<String, dynamic> json) => _$_LocalTask(
      Task.fromJson(json['task'] as Map<String, dynamic>),
      state: $enumDecode(_$LocalTaskStateEnumMap, json['state']),
    );

Map<String, dynamic> _$$_LocalTaskToJson(_$_LocalTask instance) =>
    <String, dynamic>{
      'task': instance.task,
      'state': _$LocalTaskStateEnumMap[instance.state]!,
    };

const _$LocalTaskStateEnumMap = {
  LocalTaskState.created: 'created',
  LocalTaskState.deleted: 'deleted',
  LocalTaskState.edited: 'edited',
  LocalTaskState.unchanged: 'unchanged',
};
