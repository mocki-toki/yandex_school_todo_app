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
  TextEditingController get textController =>
      throw _privateConstructorUsedError;
  Importance get importance => throw _privateConstructorUsedError;
  DateTime? get deadline => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TextEditingController textController,
            Importance importance, DateTime? deadline)
        newTask,
    required TResult Function(
            Task editedTask,
            TextEditingController textController,
            Importance importance,
            DateTime? deadline)
        editTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TextEditingController textController,
            Importance importance, DateTime? deadline)?
        newTask,
    TResult Function(Task editedTask, TextEditingController textController,
            Importance importance, DateTime? deadline)?
        editTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TextEditingController textController,
            Importance importance, DateTime? deadline)?
        newTask,
    TResult Function(Task editedTask, TextEditingController textController,
            Importance importance, DateTime? deadline)?
        editTask,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskEditStateNewTask value) newTask,
    required TResult Function(TaskEditStateEditTask value) editTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TaskEditStateNewTask value)? newTask,
    TResult Function(TaskEditStateEditTask value)? editTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskEditStateNewTask value)? newTask,
    TResult Function(TaskEditStateEditTask value)? editTask,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskEditStateCopyWith<TaskEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskEditStateCopyWith<$Res> {
  factory $TaskEditStateCopyWith(
          TaskEditState value, $Res Function(TaskEditState) then) =
      _$TaskEditStateCopyWithImpl<$Res>;
  $Res call(
      {TextEditingController textController,
      Importance importance,
      DateTime? deadline});
}

/// @nodoc
class _$TaskEditStateCopyWithImpl<$Res>
    implements $TaskEditStateCopyWith<$Res> {
  _$TaskEditStateCopyWithImpl(this._value, this._then);

  final TaskEditState _value;
  // ignore: unused_field
  final $Res Function(TaskEditState) _then;

  @override
  $Res call({
    Object? textController = freezed,
    Object? importance = freezed,
    Object? deadline = freezed,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$TaskEditStateNewTaskCopyWith<$Res>
    implements $TaskEditStateCopyWith<$Res> {
  factory _$$TaskEditStateNewTaskCopyWith(_$TaskEditStateNewTask value,
          $Res Function(_$TaskEditStateNewTask) then) =
      __$$TaskEditStateNewTaskCopyWithImpl<$Res>;
  @override
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
    required TResult Function(
            Task editedTask,
            TextEditingController textController,
            Importance importance,
            DateTime? deadline)
        editTask,
  }) {
    return newTask(textController, importance, deadline);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TextEditingController textController,
            Importance importance, DateTime? deadline)?
        newTask,
    TResult Function(Task editedTask, TextEditingController textController,
            Importance importance, DateTime? deadline)?
        editTask,
  }) {
    return newTask?.call(textController, importance, deadline);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TextEditingController textController,
            Importance importance, DateTime? deadline)?
        newTask,
    TResult Function(Task editedTask, TextEditingController textController,
            Importance importance, DateTime? deadline)?
        editTask,
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
    required TResult Function(TaskEditStateEditTask value) editTask,
  }) {
    return newTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TaskEditStateNewTask value)? newTask,
    TResult Function(TaskEditStateEditTask value)? editTask,
  }) {
    return newTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskEditStateNewTask value)? newTask,
    TResult Function(TaskEditStateEditTask value)? editTask,
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

  @override
  TextEditingController get textController;
  @override
  Importance get importance;
  @override
  DateTime? get deadline;
  @override
  @JsonKey(ignore: true)
  _$$TaskEditStateNewTaskCopyWith<_$TaskEditStateNewTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskEditStateEditTaskCopyWith<$Res>
    implements $TaskEditStateCopyWith<$Res> {
  factory _$$TaskEditStateEditTaskCopyWith(_$TaskEditStateEditTask value,
          $Res Function(_$TaskEditStateEditTask) then) =
      __$$TaskEditStateEditTaskCopyWithImpl<$Res>;
  @override
  $Res call(
      {Task editedTask,
      TextEditingController textController,
      Importance importance,
      DateTime? deadline});

  $TaskCopyWith<$Res> get editedTask;
}

/// @nodoc
class __$$TaskEditStateEditTaskCopyWithImpl<$Res>
    extends _$TaskEditStateCopyWithImpl<$Res>
    implements _$$TaskEditStateEditTaskCopyWith<$Res> {
  __$$TaskEditStateEditTaskCopyWithImpl(_$TaskEditStateEditTask _value,
      $Res Function(_$TaskEditStateEditTask) _then)
      : super(_value, (v) => _then(v as _$TaskEditStateEditTask));

  @override
  _$TaskEditStateEditTask get _value => super._value as _$TaskEditStateEditTask;

  @override
  $Res call({
    Object? editedTask = freezed,
    Object? textController = freezed,
    Object? importance = freezed,
    Object? deadline = freezed,
  }) {
    return _then(_$TaskEditStateEditTask(
      editedTask: editedTask == freezed
          ? _value.editedTask
          : editedTask // ignore: cast_nullable_to_non_nullable
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
  $TaskCopyWith<$Res> get editedTask {
    return $TaskCopyWith<$Res>(_value.editedTask, (value) {
      return _then(_value.copyWith(editedTask: value));
    });
  }
}

/// @nodoc

class _$TaskEditStateEditTask implements TaskEditStateEditTask {
  const _$TaskEditStateEditTask(
      {required this.editedTask,
      required this.textController,
      required this.importance,
      this.deadline});

  @override
  final Task editedTask;
  @override
  final TextEditingController textController;
  @override
  final Importance importance;
  @override
  final DateTime? deadline;

  @override
  String toString() {
    return 'TaskEditState.editTask(editedTask: $editedTask, textController: $textController, importance: $importance, deadline: $deadline)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskEditStateEditTask &&
            const DeepCollectionEquality()
                .equals(other.editedTask, editedTask) &&
            const DeepCollectionEquality()
                .equals(other.textController, textController) &&
            const DeepCollectionEquality()
                .equals(other.importance, importance) &&
            const DeepCollectionEquality().equals(other.deadline, deadline));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(editedTask),
      const DeepCollectionEquality().hash(textController),
      const DeepCollectionEquality().hash(importance),
      const DeepCollectionEquality().hash(deadline));

  @JsonKey(ignore: true)
  @override
  _$$TaskEditStateEditTaskCopyWith<_$TaskEditStateEditTask> get copyWith =>
      __$$TaskEditStateEditTaskCopyWithImpl<_$TaskEditStateEditTask>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TextEditingController textController,
            Importance importance, DateTime? deadline)
        newTask,
    required TResult Function(
            Task editedTask,
            TextEditingController textController,
            Importance importance,
            DateTime? deadline)
        editTask,
  }) {
    return editTask(editedTask, textController, importance, deadline);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TextEditingController textController,
            Importance importance, DateTime? deadline)?
        newTask,
    TResult Function(Task editedTask, TextEditingController textController,
            Importance importance, DateTime? deadline)?
        editTask,
  }) {
    return editTask?.call(editedTask, textController, importance, deadline);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TextEditingController textController,
            Importance importance, DateTime? deadline)?
        newTask,
    TResult Function(Task editedTask, TextEditingController textController,
            Importance importance, DateTime? deadline)?
        editTask,
    required TResult orElse(),
  }) {
    if (editTask != null) {
      return editTask(editedTask, textController, importance, deadline);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskEditStateNewTask value) newTask,
    required TResult Function(TaskEditStateEditTask value) editTask,
  }) {
    return editTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TaskEditStateNewTask value)? newTask,
    TResult Function(TaskEditStateEditTask value)? editTask,
  }) {
    return editTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskEditStateNewTask value)? newTask,
    TResult Function(TaskEditStateEditTask value)? editTask,
    required TResult orElse(),
  }) {
    if (editTask != null) {
      return editTask(this);
    }
    return orElse();
  }
}

abstract class TaskEditStateEditTask implements TaskEditState {
  const factory TaskEditStateEditTask(
      {required final Task editedTask,
      required final TextEditingController textController,
      required final Importance importance,
      final DateTime? deadline}) = _$TaskEditStateEditTask;

  Task get editedTask;
  @override
  TextEditingController get textController;
  @override
  Importance get importance;
  @override
  DateTime? get deadline;
  @override
  @JsonKey(ignore: true)
  _$$TaskEditStateEditTaskCopyWith<_$TaskEditStateEditTask> get copyWith =>
      throw _privateConstructorUsedError;
}
