// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'local_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocalTask _$LocalTaskFromJson(Map<String, dynamic> json) {
  return _LocalTask.fromJson(json);
}

/// @nodoc
mixin _$LocalTask {
  Task get task => throw _privateConstructorUsedError;
  LocalTaskState get state => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalTaskCopyWith<LocalTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalTaskCopyWith<$Res> {
  factory $LocalTaskCopyWith(LocalTask value, $Res Function(LocalTask) then) =
      _$LocalTaskCopyWithImpl<$Res>;
  $Res call({Task task, LocalTaskState state});

  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class _$LocalTaskCopyWithImpl<$Res> implements $LocalTaskCopyWith<$Res> {
  _$LocalTaskCopyWithImpl(this._value, this._then);

  final LocalTask _value;
  // ignore: unused_field
  final $Res Function(LocalTask) _then;

  @override
  $Res call({
    Object? task = freezed,
    Object? state = freezed,
  }) {
    return _then(_value.copyWith(
      task: task == freezed
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as LocalTaskState,
    ));
  }

  @override
  $TaskCopyWith<$Res> get task {
    return $TaskCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc
abstract class _$$_LocalTaskCopyWith<$Res> implements $LocalTaskCopyWith<$Res> {
  factory _$$_LocalTaskCopyWith(
          _$_LocalTask value, $Res Function(_$_LocalTask) then) =
      __$$_LocalTaskCopyWithImpl<$Res>;
  @override
  $Res call({Task task, LocalTaskState state});

  @override
  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$$_LocalTaskCopyWithImpl<$Res> extends _$LocalTaskCopyWithImpl<$Res>
    implements _$$_LocalTaskCopyWith<$Res> {
  __$$_LocalTaskCopyWithImpl(
      _$_LocalTask _value, $Res Function(_$_LocalTask) _then)
      : super(_value, (v) => _then(v as _$_LocalTask));

  @override
  _$_LocalTask get _value => super._value as _$_LocalTask;

  @override
  $Res call({
    Object? task = freezed,
    Object? state = freezed,
  }) {
    return _then(_$_LocalTask(
      task == freezed
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as LocalTaskState,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocalTask implements _LocalTask {
  const _$_LocalTask(this.task, {required this.state});

  factory _$_LocalTask.fromJson(Map<String, dynamic> json) =>
      _$$_LocalTaskFromJson(json);

  @override
  final Task task;
  @override
  final LocalTaskState state;

  @override
  String toString() {
    return 'LocalTask(task: $task, state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalTask &&
            const DeepCollectionEquality().equals(other.task, task) &&
            const DeepCollectionEquality().equals(other.state, state));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(task),
      const DeepCollectionEquality().hash(state));

  @JsonKey(ignore: true)
  @override
  _$$_LocalTaskCopyWith<_$_LocalTask> get copyWith =>
      __$$_LocalTaskCopyWithImpl<_$_LocalTask>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocalTaskToJson(
      this,
    );
  }
}

abstract class _LocalTask implements LocalTask {
  const factory _LocalTask(final Task task,
      {required final LocalTaskState state}) = _$_LocalTask;

  factory _LocalTask.fromJson(Map<String, dynamic> json) =
      _$_LocalTask.fromJson;

  @override
  Task get task;
  @override
  LocalTaskState get state;
  @override
  @JsonKey(ignore: true)
  _$$_LocalTaskCopyWith<_$_LocalTask> get copyWith =>
      throw _privateConstructorUsedError;
}
