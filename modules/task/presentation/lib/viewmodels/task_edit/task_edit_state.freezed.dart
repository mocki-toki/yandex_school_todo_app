// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_edit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TaskEditState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TextEditingController textController,
            Importance importance, DateTime? deadline)
        newTask,
    required TResult Function(UuidValue taskId) loadingTask,
    required TResult Function(
            UuidValue taskId,
            Task task,
            TextEditingController textController,
            Importance importance,
            DateTime? deadline)
        loadedTask,
    required TResult Function(UuidValue taskId, Failure<dynamic> failure)
        errorTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TextEditingController textController,
            Importance importance, DateTime? deadline)?
        newTask,
    TResult Function(UuidValue taskId)? loadingTask,
    TResult Function(
            UuidValue taskId,
            Task task,
            TextEditingController textController,
            Importance importance,
            DateTime? deadline)?
        loadedTask,
    TResult Function(UuidValue taskId, Failure<dynamic> failure)? errorTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TextEditingController textController,
            Importance importance, DateTime? deadline)?
        newTask,
    TResult Function(UuidValue taskId)? loadingTask,
    TResult Function(
            UuidValue taskId,
            Task task,
            TextEditingController textController,
            Importance importance,
            DateTime? deadline)?
        loadedTask,
    TResult Function(UuidValue taskId, Failure<dynamic> failure)? errorTask,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskEditStateNewTask value) newTask,
    required TResult Function(TaskEditStateLoadingTask value) loadingTask,
    required TResult Function(TaskEditStateLoadedTask value) loadedTask,
    required TResult Function(TaskEditStateErrorTask value) errorTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TaskEditStateNewTask value)? newTask,
    TResult Function(TaskEditStateLoadingTask value)? loadingTask,
    TResult Function(TaskEditStateLoadedTask value)? loadedTask,
    TResult Function(TaskEditStateErrorTask value)? errorTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskEditStateNewTask value)? newTask,
    TResult Function(TaskEditStateLoadingTask value)? loadingTask,
    TResult Function(TaskEditStateLoadedTask value)? loadedTask,
    TResult Function(TaskEditStateErrorTask value)? errorTask,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskEditStateCopyWith<$Res> {
  factory $TaskEditStateCopyWith(
          TaskEditState value, $Res Function(TaskEditState) then) =
      _$TaskEditStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TaskEditStateCopyWithImpl<$Res>
    implements $TaskEditStateCopyWith<$Res> {
  _$TaskEditStateCopyWithImpl(this._value, this._then);

  final TaskEditState _value;
  // ignore: unused_field
  final $Res Function(TaskEditState) _then;
}

/// @nodoc
abstract class _$$TaskEditStateNewTaskCopyWith<$Res> {
  factory _$$TaskEditStateNewTaskCopyWith(_$TaskEditStateNewTask value,
          $Res Function(_$TaskEditStateNewTask) then) =
      __$$TaskEditStateNewTaskCopyWithImpl<$Res>;
  $Res call(
      {TextEditingController textController,
      Importance importance,
      DateTime? deadline});
}

/// @nodoc
class __$$TaskEditStateNewTaskCopyWithImpl<$Res>
    extends _$TaskEditStateCopyWithImpl<$Res>
    implements _$$TaskEditStateNewTaskCopyWith<$Res> {
  __$$TaskEditStateNewTaskCopyWithImpl(_$TaskEditStateNewTask _value,
      $Res Function(_$TaskEditStateNewTask) _then)
      : super(_value, (v) => _then(v as _$TaskEditStateNewTask));

  @override
  _$TaskEditStateNewTask get _value => super._value as _$TaskEditStateNewTask;

  @override
  $Res call({
    Object? textController = freezed,
    Object? importance = freezed,
    Object? deadline = freezed,
  }) {
    return _then(_$TaskEditStateNewTask(
      textController: textController == freezed
          ? _value.textController
          : textController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      importance: importance == freezed
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as Importance,
      deadline: deadline == freezed
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$TaskEditStateNewTask implements TaskEditStateNewTask {
  const _$TaskEditStateNewTask(
      {required this.textController, required this.importance, this.deadline});

  @override
  final TextEditingController textController;
  @override
  final Importance importance;
  @override
  final DateTime? deadline;

  @override
  String toString() {
    return 'TaskEditState.newTask(textController: $textController, importance: $importance, deadline: $deadline)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskEditStateNewTask &&
            const DeepCollectionEquality()
                .equals(other.textController, textController) &&
            const DeepCollectionEquality()
                .equals(other.importance, importance) &&
            const DeepCollectionEquality().equals(other.deadline, deadline));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(textController),
      const DeepCollectionEquality().hash(importance),
      const DeepCollectionEquality().hash(deadline));

  @JsonKey(ignore: true)
  @override
  _$$TaskEditStateNewTaskCopyWith<_$TaskEditStateNewTask> get copyWith =>
      __$$TaskEditStateNewTaskCopyWithImpl<_$TaskEditStateNewTask>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TextEditingController textController,
            Importance importance, DateTime? deadline)
        newTask,
    required TResult Function(UuidValue taskId) loadingTask,
    required TResult Function(
            UuidValue taskId,
            Task task,
            TextEditingController textController,
            Importance importance,
            DateTime? deadline)
        loadedTask,
    required TResult Function(UuidValue taskId, Failure<dynamic> failure)
        errorTask,
  }) {
    return newTask(textController, importance, deadline);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TextEditingController textController,
            Importance importance, DateTime? deadline)?
        newTask,
    TResult Function(UuidValue taskId)? loadingTask,
    TResult Function(
            UuidValue taskId,
            Task task,
            TextEditingController textController,
            Importance importance,
            DateTime? deadline)?
        loadedTask,
    TResult Function(UuidValue taskId, Failure<dynamic> failure)? errorTask,
  }) {
    return newTask?.call(textController, importance, deadline);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TextEditingController textController,
            Importance importance, DateTime? deadline)?
        newTask,
    TResult Function(UuidValue taskId)? loadingTask,
    TResult Function(
            UuidValue taskId,
            Task task,
            TextEditingController textController,
            Importance importance,
            DateTime? deadline)?
        loadedTask,
    TResult Function(UuidValue taskId, Failure<dynamic> failure)? errorTask,
    required TResult orElse(),
  }) {
    if (newTask != null) {
      return newTask(textController, importance, deadline);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskEditStateNewTask value) newTask,
    required TResult Function(TaskEditStateLoadingTask value) loadingTask,
    required TResult Function(TaskEditStateLoadedTask value) loadedTask,
    required TResult Function(TaskEditStateErrorTask value) errorTask,
  }) {
    return newTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TaskEditStateNewTask value)? newTask,
    TResult Function(TaskEditStateLoadingTask value)? loadingTask,
    TResult Function(TaskEditStateLoadedTask value)? loadedTask,
    TResult Function(TaskEditStateErrorTask value)? errorTask,
  }) {
    return newTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskEditStateNewTask value)? newTask,
    TResult Function(TaskEditStateLoadingTask value)? loadingTask,
    TResult Function(TaskEditStateLoadedTask value)? loadedTask,
    TResult Function(TaskEditStateErrorTask value)? errorTask,
    required TResult orElse(),
  }) {
    if (newTask != null) {
      return newTask(this);
    }
    return orElse();
  }
}

abstract class TaskEditStateNewTask implements TaskEditState {
  const factory TaskEditStateNewTask(
      {required final TextEditingController textController,
      required final Importance importance,
      final DateTime? deadline}) = _$TaskEditStateNewTask;

  TextEditingController get textController;
  Importance get importance;
  DateTime? get deadline;
  @JsonKey(ignore: true)
  _$$TaskEditStateNewTaskCopyWith<_$TaskEditStateNewTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskEditStateLoadingTaskCopyWith<$Res> {
  factory _$$TaskEditStateLoadingTaskCopyWith(_$TaskEditStateLoadingTask value,
          $Res Function(_$TaskEditStateLoadingTask) then) =
      __$$TaskEditStateLoadingTaskCopyWithImpl<$Res>;
  $Res call({UuidValue taskId});
}

/// @nodoc
class __$$TaskEditStateLoadingTaskCopyWithImpl<$Res>
    extends _$TaskEditStateCopyWithImpl<$Res>
    implements _$$TaskEditStateLoadingTaskCopyWith<$Res> {
  __$$TaskEditStateLoadingTaskCopyWithImpl(_$TaskEditStateLoadingTask _value,
      $Res Function(_$TaskEditStateLoadingTask) _then)
      : super(_value, (v) => _then(v as _$TaskEditStateLoadingTask));

  @override
  _$TaskEditStateLoadingTask get _value =>
      super._value as _$TaskEditStateLoadingTask;

  @override
  $Res call({
    Object? taskId = freezed,
  }) {
    return _then(_$TaskEditStateLoadingTask(
      taskId: taskId == freezed
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as UuidValue,
    ));
  }
}

/// @nodoc

class _$TaskEditStateLoadingTask implements TaskEditStateLoadingTask {
  const _$TaskEditStateLoadingTask({required this.taskId});

  @override
  final UuidValue taskId;

  @override
  String toString() {
    return 'TaskEditState.loadingTask(taskId: $taskId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskEditStateLoadingTask &&
            const DeepCollectionEquality().equals(other.taskId, taskId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(taskId));

  @JsonKey(ignore: true)
  @override
  _$$TaskEditStateLoadingTaskCopyWith<_$TaskEditStateLoadingTask>
      get copyWith =>
          __$$TaskEditStateLoadingTaskCopyWithImpl<_$TaskEditStateLoadingTask>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TextEditingController textController,
            Importance importance, DateTime? deadline)
        newTask,
    required TResult Function(UuidValue taskId) loadingTask,
    required TResult Function(
            UuidValue taskId,
            Task task,
            TextEditingController textController,
            Importance importance,
            DateTime? deadline)
        loadedTask,
    required TResult Function(UuidValue taskId, Failure<dynamic> failure)
        errorTask,
  }) {
    return loadingTask(taskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TextEditingController textController,
            Importance importance, DateTime? deadline)?
        newTask,
    TResult Function(UuidValue taskId)? loadingTask,
    TResult Function(
            UuidValue taskId,
            Task task,
            TextEditingController textController,
            Importance importance,
            DateTime? deadline)?
        loadedTask,
    TResult Function(UuidValue taskId, Failure<dynamic> failure)? errorTask,
  }) {
    return loadingTask?.call(taskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TextEditingController textController,
            Importance importance, DateTime? deadline)?
        newTask,
    TResult Function(UuidValue taskId)? loadingTask,
    TResult Function(
            UuidValue taskId,
            Task task,
            TextEditingController textController,
            Importance importance,
            DateTime? deadline)?
        loadedTask,
    TResult Function(UuidValue taskId, Failure<dynamic> failure)? errorTask,
    required TResult orElse(),
  }) {
    if (loadingTask != null) {
      return loadingTask(taskId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskEditStateNewTask value) newTask,
    required TResult Function(TaskEditStateLoadingTask value) loadingTask,
    required TResult Function(TaskEditStateLoadedTask value) loadedTask,
    required TResult Function(TaskEditStateErrorTask value) errorTask,
  }) {
    return loadingTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TaskEditStateNewTask value)? newTask,
    TResult Function(TaskEditStateLoadingTask value)? loadingTask,
    TResult Function(TaskEditStateLoadedTask value)? loadedTask,
    TResult Function(TaskEditStateErrorTask value)? errorTask,
  }) {
    return loadingTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskEditStateNewTask value)? newTask,
    TResult Function(TaskEditStateLoadingTask value)? loadingTask,
    TResult Function(TaskEditStateLoadedTask value)? loadedTask,
    TResult Function(TaskEditStateErrorTask value)? errorTask,
    required TResult orElse(),
  }) {
    if (loadingTask != null) {
      return loadingTask(this);
    }
    return orElse();
  }
}

abstract class TaskEditStateLoadingTask implements TaskEditState {
  const factory TaskEditStateLoadingTask({required final UuidValue taskId}) =
      _$TaskEditStateLoadingTask;

  UuidValue get taskId;
  @JsonKey(ignore: true)
  _$$TaskEditStateLoadingTaskCopyWith<_$TaskEditStateLoadingTask>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskEditStateLoadedTaskCopyWith<$Res> {
  factory _$$TaskEditStateLoadedTaskCopyWith(_$TaskEditStateLoadedTask value,
          $Res Function(_$TaskEditStateLoadedTask) then) =
      __$$TaskEditStateLoadedTaskCopyWithImpl<$Res>;
  $Res call(
      {UuidValue taskId,
      Task task,
      TextEditingController textController,
      Importance importance,
      DateTime? deadline});

  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$$TaskEditStateLoadedTaskCopyWithImpl<$Res>
    extends _$TaskEditStateCopyWithImpl<$Res>
    implements _$$TaskEditStateLoadedTaskCopyWith<$Res> {
  __$$TaskEditStateLoadedTaskCopyWithImpl(_$TaskEditStateLoadedTask _value,
      $Res Function(_$TaskEditStateLoadedTask) _then)
      : super(_value, (v) => _then(v as _$TaskEditStateLoadedTask));

  @override
  _$TaskEditStateLoadedTask get _value =>
      super._value as _$TaskEditStateLoadedTask;

  @override
  $Res call({
    Object? taskId = freezed,
    Object? task = freezed,
    Object? textController = freezed,
    Object? importance = freezed,
    Object? deadline = freezed,
  }) {
    return _then(_$TaskEditStateLoadedTask(
      taskId: taskId == freezed
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as UuidValue,
      task: task == freezed
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
      textController: textController == freezed
          ? _value.textController
          : textController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      importance: importance == freezed
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as Importance,
      deadline: deadline == freezed
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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

class _$TaskEditStateLoadedTask implements TaskEditStateLoadedTask {
  const _$TaskEditStateLoadedTask(
      {required this.taskId,
      required this.task,
      required this.textController,
      required this.importance,
      this.deadline});

  @override
  final UuidValue taskId;
  @override
  final Task task;
  @override
  final TextEditingController textController;
  @override
  final Importance importance;
  @override
  final DateTime? deadline;

  @override
  String toString() {
    return 'TaskEditState.loadedTask(taskId: $taskId, task: $task, textController: $textController, importance: $importance, deadline: $deadline)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskEditStateLoadedTask &&
            const DeepCollectionEquality().equals(other.taskId, taskId) &&
            const DeepCollectionEquality().equals(other.task, task) &&
            const DeepCollectionEquality()
                .equals(other.textController, textController) &&
            const DeepCollectionEquality()
                .equals(other.importance, importance) &&
            const DeepCollectionEquality().equals(other.deadline, deadline));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(taskId),
      const DeepCollectionEquality().hash(task),
      const DeepCollectionEquality().hash(textController),
      const DeepCollectionEquality().hash(importance),
      const DeepCollectionEquality().hash(deadline));

  @JsonKey(ignore: true)
  @override
  _$$TaskEditStateLoadedTaskCopyWith<_$TaskEditStateLoadedTask> get copyWith =>
      __$$TaskEditStateLoadedTaskCopyWithImpl<_$TaskEditStateLoadedTask>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TextEditingController textController,
            Importance importance, DateTime? deadline)
        newTask,
    required TResult Function(UuidValue taskId) loadingTask,
    required TResult Function(
            UuidValue taskId,
            Task task,
            TextEditingController textController,
            Importance importance,
            DateTime? deadline)
        loadedTask,
    required TResult Function(UuidValue taskId, Failure<dynamic> failure)
        errorTask,
  }) {
    return loadedTask(taskId, task, textController, importance, deadline);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TextEditingController textController,
            Importance importance, DateTime? deadline)?
        newTask,
    TResult Function(UuidValue taskId)? loadingTask,
    TResult Function(
            UuidValue taskId,
            Task task,
            TextEditingController textController,
            Importance importance,
            DateTime? deadline)?
        loadedTask,
    TResult Function(UuidValue taskId, Failure<dynamic> failure)? errorTask,
  }) {
    return loadedTask?.call(taskId, task, textController, importance, deadline);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TextEditingController textController,
            Importance importance, DateTime? deadline)?
        newTask,
    TResult Function(UuidValue taskId)? loadingTask,
    TResult Function(
            UuidValue taskId,
            Task task,
            TextEditingController textController,
            Importance importance,
            DateTime? deadline)?
        loadedTask,
    TResult Function(UuidValue taskId, Failure<dynamic> failure)? errorTask,
    required TResult orElse(),
  }) {
    if (loadedTask != null) {
      return loadedTask(taskId, task, textController, importance, deadline);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskEditStateNewTask value) newTask,
    required TResult Function(TaskEditStateLoadingTask value) loadingTask,
    required TResult Function(TaskEditStateLoadedTask value) loadedTask,
    required TResult Function(TaskEditStateErrorTask value) errorTask,
  }) {
    return loadedTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TaskEditStateNewTask value)? newTask,
    TResult Function(TaskEditStateLoadingTask value)? loadingTask,
    TResult Function(TaskEditStateLoadedTask value)? loadedTask,
    TResult Function(TaskEditStateErrorTask value)? errorTask,
  }) {
    return loadedTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskEditStateNewTask value)? newTask,
    TResult Function(TaskEditStateLoadingTask value)? loadingTask,
    TResult Function(TaskEditStateLoadedTask value)? loadedTask,
    TResult Function(TaskEditStateErrorTask value)? errorTask,
    required TResult orElse(),
  }) {
    if (loadedTask != null) {
      return loadedTask(this);
    }
    return orElse();
  }
}

abstract class TaskEditStateLoadedTask implements TaskEditState {
  const factory TaskEditStateLoadedTask(
      {required final UuidValue taskId,
      required final Task task,
      required final TextEditingController textController,
      required final Importance importance,
      final DateTime? deadline}) = _$TaskEditStateLoadedTask;

  UuidValue get taskId;
  Task get task;
  TextEditingController get textController;
  Importance get importance;
  DateTime? get deadline;
  @JsonKey(ignore: true)
  _$$TaskEditStateLoadedTaskCopyWith<_$TaskEditStateLoadedTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskEditStateErrorTaskCopyWith<$Res> {
  factory _$$TaskEditStateErrorTaskCopyWith(_$TaskEditStateErrorTask value,
          $Res Function(_$TaskEditStateErrorTask) then) =
      __$$TaskEditStateErrorTaskCopyWithImpl<$Res>;
  $Res call({UuidValue taskId, Failure<dynamic> failure});
}

/// @nodoc
class __$$TaskEditStateErrorTaskCopyWithImpl<$Res>
    extends _$TaskEditStateCopyWithImpl<$Res>
    implements _$$TaskEditStateErrorTaskCopyWith<$Res> {
  __$$TaskEditStateErrorTaskCopyWithImpl(_$TaskEditStateErrorTask _value,
      $Res Function(_$TaskEditStateErrorTask) _then)
      : super(_value, (v) => _then(v as _$TaskEditStateErrorTask));

  @override
  _$TaskEditStateErrorTask get _value =>
      super._value as _$TaskEditStateErrorTask;

  @override
  $Res call({
    Object? taskId = freezed,
    Object? failure = freezed,
  }) {
    return _then(_$TaskEditStateErrorTask(
      taskId: taskId == freezed
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as UuidValue,
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure<dynamic>,
    ));
  }
}

/// @nodoc

class _$TaskEditStateErrorTask implements TaskEditStateErrorTask {
  const _$TaskEditStateErrorTask({required this.taskId, required this.failure});

  @override
  final UuidValue taskId;
  @override
  final Failure<dynamic> failure;

  @override
  String toString() {
    return 'TaskEditState.errorTask(taskId: $taskId, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskEditStateErrorTask &&
            const DeepCollectionEquality().equals(other.taskId, taskId) &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(taskId),
      const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$$TaskEditStateErrorTaskCopyWith<_$TaskEditStateErrorTask> get copyWith =>
      __$$TaskEditStateErrorTaskCopyWithImpl<_$TaskEditStateErrorTask>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TextEditingController textController,
            Importance importance, DateTime? deadline)
        newTask,
    required TResult Function(UuidValue taskId) loadingTask,
    required TResult Function(
            UuidValue taskId,
            Task task,
            TextEditingController textController,
            Importance importance,
            DateTime? deadline)
        loadedTask,
    required TResult Function(UuidValue taskId, Failure<dynamic> failure)
        errorTask,
  }) {
    return errorTask(taskId, failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TextEditingController textController,
            Importance importance, DateTime? deadline)?
        newTask,
    TResult Function(UuidValue taskId)? loadingTask,
    TResult Function(
            UuidValue taskId,
            Task task,
            TextEditingController textController,
            Importance importance,
            DateTime? deadline)?
        loadedTask,
    TResult Function(UuidValue taskId, Failure<dynamic> failure)? errorTask,
  }) {
    return errorTask?.call(taskId, failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TextEditingController textController,
            Importance importance, DateTime? deadline)?
        newTask,
    TResult Function(UuidValue taskId)? loadingTask,
    TResult Function(
            UuidValue taskId,
            Task task,
            TextEditingController textController,
            Importance importance,
            DateTime? deadline)?
        loadedTask,
    TResult Function(UuidValue taskId, Failure<dynamic> failure)? errorTask,
    required TResult orElse(),
  }) {
    if (errorTask != null) {
      return errorTask(taskId, failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskEditStateNewTask value) newTask,
    required TResult Function(TaskEditStateLoadingTask value) loadingTask,
    required TResult Function(TaskEditStateLoadedTask value) loadedTask,
    required TResult Function(TaskEditStateErrorTask value) errorTask,
  }) {
    return errorTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TaskEditStateNewTask value)? newTask,
    TResult Function(TaskEditStateLoadingTask value)? loadingTask,
    TResult Function(TaskEditStateLoadedTask value)? loadedTask,
    TResult Function(TaskEditStateErrorTask value)? errorTask,
  }) {
    return errorTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskEditStateNewTask value)? newTask,
    TResult Function(TaskEditStateLoadingTask value)? loadingTask,
    TResult Function(TaskEditStateLoadedTask value)? loadedTask,
    TResult Function(TaskEditStateErrorTask value)? errorTask,
    required TResult orElse(),
  }) {
    if (errorTask != null) {
      return errorTask(this);
    }
    return orElse();
  }
}

abstract class TaskEditStateErrorTask implements TaskEditState {
  const factory TaskEditStateErrorTask(
      {required final UuidValue taskId,
      required final Failure<dynamic> failure}) = _$TaskEditStateErrorTask;

  UuidValue get taskId;
  Failure<dynamic> get failure;
  @JsonKey(ignore: true)
  _$$TaskEditStateErrorTaskCopyWith<_$TaskEditStateErrorTask> get copyWith =>
      throw _privateConstructorUsedError;
}
