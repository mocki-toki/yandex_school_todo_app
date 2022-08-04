// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TaskListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Iterable<Task> tasks) loaded,
    required TResult Function(Failure<dynamic> failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Iterable<Task> tasks)? loaded,
    TResult Function(Failure<dynamic> failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Iterable<Task> tasks)? loaded,
    TResult Function(Failure<dynamic> failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskListStateInitial value) initial,
    required TResult Function(TaskListStateLoading value) loading,
    required TResult Function(TaskListStateLoaded value) loaded,
    required TResult Function(TaskListStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TaskListStateInitial value)? initial,
    TResult Function(TaskListStateLoading value)? loading,
    TResult Function(TaskListStateLoaded value)? loaded,
    TResult Function(TaskListStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskListStateInitial value)? initial,
    TResult Function(TaskListStateLoading value)? loading,
    TResult Function(TaskListStateLoaded value)? loaded,
    TResult Function(TaskListStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskListStateCopyWith<$Res> {
  factory $TaskListStateCopyWith(
          TaskListState value, $Res Function(TaskListState) then) =
      _$TaskListStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TaskListStateCopyWithImpl<$Res>
    implements $TaskListStateCopyWith<$Res> {
  _$TaskListStateCopyWithImpl(this._value, this._then);

  final TaskListState _value;
  // ignore: unused_field
  final $Res Function(TaskListState) _then;
}

/// @nodoc
abstract class _$$TaskListStateInitialCopyWith<$Res> {
  factory _$$TaskListStateInitialCopyWith(_$TaskListStateInitial value,
          $Res Function(_$TaskListStateInitial) then) =
      __$$TaskListStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskListStateInitialCopyWithImpl<$Res>
    extends _$TaskListStateCopyWithImpl<$Res>
    implements _$$TaskListStateInitialCopyWith<$Res> {
  __$$TaskListStateInitialCopyWithImpl(_$TaskListStateInitial _value,
      $Res Function(_$TaskListStateInitial) _then)
      : super(_value, (v) => _then(v as _$TaskListStateInitial));

  @override
  _$TaskListStateInitial get _value => super._value as _$TaskListStateInitial;
}

/// @nodoc

class _$TaskListStateInitial implements TaskListStateInitial {
  const _$TaskListStateInitial();

  @override
  String toString() {
    return 'TaskListState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TaskListStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Iterable<Task> tasks) loaded,
    required TResult Function(Failure<dynamic> failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Iterable<Task> tasks)? loaded,
    TResult Function(Failure<dynamic> failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Iterable<Task> tasks)? loaded,
    TResult Function(Failure<dynamic> failure)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskListStateInitial value) initial,
    required TResult Function(TaskListStateLoading value) loading,
    required TResult Function(TaskListStateLoaded value) loaded,
    required TResult Function(TaskListStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TaskListStateInitial value)? initial,
    TResult Function(TaskListStateLoading value)? loading,
    TResult Function(TaskListStateLoaded value)? loaded,
    TResult Function(TaskListStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskListStateInitial value)? initial,
    TResult Function(TaskListStateLoading value)? loading,
    TResult Function(TaskListStateLoaded value)? loaded,
    TResult Function(TaskListStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TaskListStateInitial implements TaskListState {
  const factory TaskListStateInitial() = _$TaskListStateInitial;
}

/// @nodoc
abstract class _$$TaskListStateLoadingCopyWith<$Res> {
  factory _$$TaskListStateLoadingCopyWith(_$TaskListStateLoading value,
          $Res Function(_$TaskListStateLoading) then) =
      __$$TaskListStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskListStateLoadingCopyWithImpl<$Res>
    extends _$TaskListStateCopyWithImpl<$Res>
    implements _$$TaskListStateLoadingCopyWith<$Res> {
  __$$TaskListStateLoadingCopyWithImpl(_$TaskListStateLoading _value,
      $Res Function(_$TaskListStateLoading) _then)
      : super(_value, (v) => _then(v as _$TaskListStateLoading));

  @override
  _$TaskListStateLoading get _value => super._value as _$TaskListStateLoading;
}

/// @nodoc

class _$TaskListStateLoading implements TaskListStateLoading {
  const _$TaskListStateLoading();

  @override
  String toString() {
    return 'TaskListState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TaskListStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Iterable<Task> tasks) loaded,
    required TResult Function(Failure<dynamic> failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Iterable<Task> tasks)? loaded,
    TResult Function(Failure<dynamic> failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Iterable<Task> tasks)? loaded,
    TResult Function(Failure<dynamic> failure)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskListStateInitial value) initial,
    required TResult Function(TaskListStateLoading value) loading,
    required TResult Function(TaskListStateLoaded value) loaded,
    required TResult Function(TaskListStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TaskListStateInitial value)? initial,
    TResult Function(TaskListStateLoading value)? loading,
    TResult Function(TaskListStateLoaded value)? loaded,
    TResult Function(TaskListStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskListStateInitial value)? initial,
    TResult Function(TaskListStateLoading value)? loading,
    TResult Function(TaskListStateLoaded value)? loaded,
    TResult Function(TaskListStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TaskListStateLoading implements TaskListState {
  const factory TaskListStateLoading() = _$TaskListStateLoading;
}

/// @nodoc
abstract class _$$TaskListStateLoadedCopyWith<$Res> {
  factory _$$TaskListStateLoadedCopyWith(_$TaskListStateLoaded value,
          $Res Function(_$TaskListStateLoaded) then) =
      __$$TaskListStateLoadedCopyWithImpl<$Res>;
  $Res call({Iterable<Task> tasks});
}

/// @nodoc
class __$$TaskListStateLoadedCopyWithImpl<$Res>
    extends _$TaskListStateCopyWithImpl<$Res>
    implements _$$TaskListStateLoadedCopyWith<$Res> {
  __$$TaskListStateLoadedCopyWithImpl(
      _$TaskListStateLoaded _value, $Res Function(_$TaskListStateLoaded) _then)
      : super(_value, (v) => _then(v as _$TaskListStateLoaded));

  @override
  _$TaskListStateLoaded get _value => super._value as _$TaskListStateLoaded;

  @override
  $Res call({
    Object? tasks = freezed,
  }) {
    return _then(_$TaskListStateLoaded(
      tasks == freezed
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as Iterable<Task>,
    ));
  }
}

/// @nodoc

class _$TaskListStateLoaded implements TaskListStateLoaded {
  const _$TaskListStateLoaded(this.tasks);

  @override
  final Iterable<Task> tasks;

  @override
  String toString() {
    return 'TaskListState.loaded(tasks: $tasks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskListStateLoaded &&
            const DeepCollectionEquality().equals(other.tasks, tasks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(tasks));

  @JsonKey(ignore: true)
  @override
  _$$TaskListStateLoadedCopyWith<_$TaskListStateLoaded> get copyWith =>
      __$$TaskListStateLoadedCopyWithImpl<_$TaskListStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Iterable<Task> tasks) loaded,
    required TResult Function(Failure<dynamic> failure) error,
  }) {
    return loaded(tasks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Iterable<Task> tasks)? loaded,
    TResult Function(Failure<dynamic> failure)? error,
  }) {
    return loaded?.call(tasks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Iterable<Task> tasks)? loaded,
    TResult Function(Failure<dynamic> failure)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(tasks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskListStateInitial value) initial,
    required TResult Function(TaskListStateLoading value) loading,
    required TResult Function(TaskListStateLoaded value) loaded,
    required TResult Function(TaskListStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TaskListStateInitial value)? initial,
    TResult Function(TaskListStateLoading value)? loading,
    TResult Function(TaskListStateLoaded value)? loaded,
    TResult Function(TaskListStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskListStateInitial value)? initial,
    TResult Function(TaskListStateLoading value)? loading,
    TResult Function(TaskListStateLoaded value)? loaded,
    TResult Function(TaskListStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TaskListStateLoaded implements TaskListState {
  const factory TaskListStateLoaded(final Iterable<Task> tasks) =
      _$TaskListStateLoaded;

  Iterable<Task> get tasks;
  @JsonKey(ignore: true)
  _$$TaskListStateLoadedCopyWith<_$TaskListStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskListStateErrorCopyWith<$Res> {
  factory _$$TaskListStateErrorCopyWith(_$TaskListStateError value,
          $Res Function(_$TaskListStateError) then) =
      __$$TaskListStateErrorCopyWithImpl<$Res>;
  $Res call({Failure<dynamic> failure});
}

/// @nodoc
class __$$TaskListStateErrorCopyWithImpl<$Res>
    extends _$TaskListStateCopyWithImpl<$Res>
    implements _$$TaskListStateErrorCopyWith<$Res> {
  __$$TaskListStateErrorCopyWithImpl(
      _$TaskListStateError _value, $Res Function(_$TaskListStateError) _then)
      : super(_value, (v) => _then(v as _$TaskListStateError));

  @override
  _$TaskListStateError get _value => super._value as _$TaskListStateError;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_$TaskListStateError(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure<dynamic>,
    ));
  }
}

/// @nodoc

class _$TaskListStateError implements TaskListStateError {
  const _$TaskListStateError(this.failure);

  @override
  final Failure<dynamic> failure;

  @override
  String toString() {
    return 'TaskListState.error(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskListStateError &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$$TaskListStateErrorCopyWith<_$TaskListStateError> get copyWith =>
      __$$TaskListStateErrorCopyWithImpl<_$TaskListStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Iterable<Task> tasks) loaded,
    required TResult Function(Failure<dynamic> failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Iterable<Task> tasks)? loaded,
    TResult Function(Failure<dynamic> failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Iterable<Task> tasks)? loaded,
    TResult Function(Failure<dynamic> failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskListStateInitial value) initial,
    required TResult Function(TaskListStateLoading value) loading,
    required TResult Function(TaskListStateLoaded value) loaded,
    required TResult Function(TaskListStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TaskListStateInitial value)? initial,
    TResult Function(TaskListStateLoading value)? loading,
    TResult Function(TaskListStateLoaded value)? loaded,
    TResult Function(TaskListStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskListStateInitial value)? initial,
    TResult Function(TaskListStateLoading value)? loading,
    TResult Function(TaskListStateLoaded value)? loaded,
    TResult Function(TaskListStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TaskListStateError implements TaskListState {
  const factory TaskListStateError(final Failure<dynamic> failure) =
      _$TaskListStateError;

  Failure<dynamic> get failure;
  @JsonKey(ignore: true)
  _$$TaskListStateErrorCopyWith<_$TaskListStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
