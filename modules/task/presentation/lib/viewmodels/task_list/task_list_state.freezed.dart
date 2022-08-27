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
  bool get visibleDoneTasks => throw _privateConstructorUsedError;
  TaskListSyncState get syncState => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool visibleDoneTasks, TaskListSyncState syncState)
        initial,
    required TResult Function(
            bool visibleDoneTasks, TaskListSyncState syncState)
        loading,
    required TResult Function(TaskListData data, bool visibleDoneTasks,
            TaskListSyncState syncState)
        loaded,
    required TResult Function(Failure<dynamic> failure, bool visibleDoneTasks,
            TaskListSyncState syncState)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool visibleDoneTasks, TaskListSyncState syncState)?
        initial,
    TResult Function(bool visibleDoneTasks, TaskListSyncState syncState)?
        loading,
    TResult Function(TaskListData data, bool visibleDoneTasks,
            TaskListSyncState syncState)?
        loaded,
    TResult Function(Failure<dynamic> failure, bool visibleDoneTasks,
            TaskListSyncState syncState)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool visibleDoneTasks, TaskListSyncState syncState)?
        initial,
    TResult Function(bool visibleDoneTasks, TaskListSyncState syncState)?
        loading,
    TResult Function(TaskListData data, bool visibleDoneTasks,
            TaskListSyncState syncState)?
        loaded,
    TResult Function(Failure<dynamic> failure, bool visibleDoneTasks,
            TaskListSyncState syncState)?
        error,
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

  @JsonKey(ignore: true)
  $TaskListStateCopyWith<TaskListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskListStateCopyWith<$Res> {
  factory $TaskListStateCopyWith(
          TaskListState value, $Res Function(TaskListState) then) =
      _$TaskListStateCopyWithImpl<$Res>;
  $Res call({bool visibleDoneTasks, TaskListSyncState syncState});
}

/// @nodoc
class _$TaskListStateCopyWithImpl<$Res>
    implements $TaskListStateCopyWith<$Res> {
  _$TaskListStateCopyWithImpl(this._value, this._then);

  final TaskListState _value;
  // ignore: unused_field
  final $Res Function(TaskListState) _then;

  @override
  $Res call({
    Object? visibleDoneTasks = freezed,
    Object? syncState = freezed,
  }) {
    return _then(_value.copyWith(
      visibleDoneTasks: visibleDoneTasks == freezed
          ? _value.visibleDoneTasks
          : visibleDoneTasks // ignore: cast_nullable_to_non_nullable
              as bool,
      syncState: syncState == freezed
          ? _value.syncState
          : syncState // ignore: cast_nullable_to_non_nullable
              as TaskListSyncState,
    ));
  }
}

/// @nodoc
abstract class _$$TaskListStateInitialCopyWith<$Res>
    implements $TaskListStateCopyWith<$Res> {
  factory _$$TaskListStateInitialCopyWith(_$TaskListStateInitial value,
          $Res Function(_$TaskListStateInitial) then) =
      __$$TaskListStateInitialCopyWithImpl<$Res>;
  @override
  $Res call({bool visibleDoneTasks, TaskListSyncState syncState});
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

  @override
  $Res call({
    Object? visibleDoneTasks = freezed,
    Object? syncState = freezed,
  }) {
    return _then(_$TaskListStateInitial(
      visibleDoneTasks: visibleDoneTasks == freezed
          ? _value.visibleDoneTasks
          : visibleDoneTasks // ignore: cast_nullable_to_non_nullable
              as bool,
      syncState: syncState == freezed
          ? _value.syncState
          : syncState // ignore: cast_nullable_to_non_nullable
              as TaskListSyncState,
    ));
  }
}

/// @nodoc

class _$TaskListStateInitial implements TaskListStateInitial {
  const _$TaskListStateInitial(
      {required this.visibleDoneTasks, required this.syncState});

  @override
  final bool visibleDoneTasks;
  @override
  final TaskListSyncState syncState;

  @override
  String toString() {
    return 'TaskListState.initial(visibleDoneTasks: $visibleDoneTasks, syncState: $syncState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskListStateInitial &&
            const DeepCollectionEquality()
                .equals(other.visibleDoneTasks, visibleDoneTasks) &&
            const DeepCollectionEquality().equals(other.syncState, syncState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(visibleDoneTasks),
      const DeepCollectionEquality().hash(syncState));

  @JsonKey(ignore: true)
  @override
  _$$TaskListStateInitialCopyWith<_$TaskListStateInitial> get copyWith =>
      __$$TaskListStateInitialCopyWithImpl<_$TaskListStateInitial>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool visibleDoneTasks, TaskListSyncState syncState)
        initial,
    required TResult Function(
            bool visibleDoneTasks, TaskListSyncState syncState)
        loading,
    required TResult Function(TaskListData data, bool visibleDoneTasks,
            TaskListSyncState syncState)
        loaded,
    required TResult Function(Failure<dynamic> failure, bool visibleDoneTasks,
            TaskListSyncState syncState)
        error,
  }) {
    return initial(visibleDoneTasks, syncState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool visibleDoneTasks, TaskListSyncState syncState)?
        initial,
    TResult Function(bool visibleDoneTasks, TaskListSyncState syncState)?
        loading,
    TResult Function(TaskListData data, bool visibleDoneTasks,
            TaskListSyncState syncState)?
        loaded,
    TResult Function(Failure<dynamic> failure, bool visibleDoneTasks,
            TaskListSyncState syncState)?
        error,
  }) {
    return initial?.call(visibleDoneTasks, syncState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool visibleDoneTasks, TaskListSyncState syncState)?
        initial,
    TResult Function(bool visibleDoneTasks, TaskListSyncState syncState)?
        loading,
    TResult Function(TaskListData data, bool visibleDoneTasks,
            TaskListSyncState syncState)?
        loaded,
    TResult Function(Failure<dynamic> failure, bool visibleDoneTasks,
            TaskListSyncState syncState)?
        error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(visibleDoneTasks, syncState);
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
  const factory TaskListStateInitial(
      {required final bool visibleDoneTasks,
      required final TaskListSyncState syncState}) = _$TaskListStateInitial;

  @override
  bool get visibleDoneTasks;
  @override
  TaskListSyncState get syncState;
  @override
  @JsonKey(ignore: true)
  _$$TaskListStateInitialCopyWith<_$TaskListStateInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskListStateLoadingCopyWith<$Res>
    implements $TaskListStateCopyWith<$Res> {
  factory _$$TaskListStateLoadingCopyWith(_$TaskListStateLoading value,
          $Res Function(_$TaskListStateLoading) then) =
      __$$TaskListStateLoadingCopyWithImpl<$Res>;
  @override
  $Res call({bool visibleDoneTasks, TaskListSyncState syncState});
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

  @override
  $Res call({
    Object? visibleDoneTasks = freezed,
    Object? syncState = freezed,
  }) {
    return _then(_$TaskListStateLoading(
      visibleDoneTasks: visibleDoneTasks == freezed
          ? _value.visibleDoneTasks
          : visibleDoneTasks // ignore: cast_nullable_to_non_nullable
              as bool,
      syncState: syncState == freezed
          ? _value.syncState
          : syncState // ignore: cast_nullable_to_non_nullable
              as TaskListSyncState,
    ));
  }
}

/// @nodoc

class _$TaskListStateLoading implements TaskListStateLoading {
  const _$TaskListStateLoading(
      {required this.visibleDoneTasks, required this.syncState});

  @override
  final bool visibleDoneTasks;
  @override
  final TaskListSyncState syncState;

  @override
  String toString() {
    return 'TaskListState.loading(visibleDoneTasks: $visibleDoneTasks, syncState: $syncState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskListStateLoading &&
            const DeepCollectionEquality()
                .equals(other.visibleDoneTasks, visibleDoneTasks) &&
            const DeepCollectionEquality().equals(other.syncState, syncState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(visibleDoneTasks),
      const DeepCollectionEquality().hash(syncState));

  @JsonKey(ignore: true)
  @override
  _$$TaskListStateLoadingCopyWith<_$TaskListStateLoading> get copyWith =>
      __$$TaskListStateLoadingCopyWithImpl<_$TaskListStateLoading>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool visibleDoneTasks, TaskListSyncState syncState)
        initial,
    required TResult Function(
            bool visibleDoneTasks, TaskListSyncState syncState)
        loading,
    required TResult Function(TaskListData data, bool visibleDoneTasks,
            TaskListSyncState syncState)
        loaded,
    required TResult Function(Failure<dynamic> failure, bool visibleDoneTasks,
            TaskListSyncState syncState)
        error,
  }) {
    return loading(visibleDoneTasks, syncState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool visibleDoneTasks, TaskListSyncState syncState)?
        initial,
    TResult Function(bool visibleDoneTasks, TaskListSyncState syncState)?
        loading,
    TResult Function(TaskListData data, bool visibleDoneTasks,
            TaskListSyncState syncState)?
        loaded,
    TResult Function(Failure<dynamic> failure, bool visibleDoneTasks,
            TaskListSyncState syncState)?
        error,
  }) {
    return loading?.call(visibleDoneTasks, syncState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool visibleDoneTasks, TaskListSyncState syncState)?
        initial,
    TResult Function(bool visibleDoneTasks, TaskListSyncState syncState)?
        loading,
    TResult Function(TaskListData data, bool visibleDoneTasks,
            TaskListSyncState syncState)?
        loaded,
    TResult Function(Failure<dynamic> failure, bool visibleDoneTasks,
            TaskListSyncState syncState)?
        error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(visibleDoneTasks, syncState);
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
  const factory TaskListStateLoading(
      {required final bool visibleDoneTasks,
      required final TaskListSyncState syncState}) = _$TaskListStateLoading;

  @override
  bool get visibleDoneTasks;
  @override
  TaskListSyncState get syncState;
  @override
  @JsonKey(ignore: true)
  _$$TaskListStateLoadingCopyWith<_$TaskListStateLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskListStateLoadedCopyWith<$Res>
    implements $TaskListStateCopyWith<$Res> {
  factory _$$TaskListStateLoadedCopyWith(_$TaskListStateLoaded value,
          $Res Function(_$TaskListStateLoaded) then) =
      __$$TaskListStateLoadedCopyWithImpl<$Res>;
  @override
  $Res call(
      {TaskListData data, bool visibleDoneTasks, TaskListSyncState syncState});

  $TaskListDataCopyWith<$Res> get data;
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
    Object? data = freezed,
    Object? visibleDoneTasks = freezed,
    Object? syncState = freezed,
  }) {
    return _then(_$TaskListStateLoaded(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TaskListData,
      visibleDoneTasks: visibleDoneTasks == freezed
          ? _value.visibleDoneTasks
          : visibleDoneTasks // ignore: cast_nullable_to_non_nullable
              as bool,
      syncState: syncState == freezed
          ? _value.syncState
          : syncState // ignore: cast_nullable_to_non_nullable
              as TaskListSyncState,
    ));
  }

  @override
  $TaskListDataCopyWith<$Res> get data {
    return $TaskListDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$TaskListStateLoaded implements TaskListStateLoaded {
  const _$TaskListStateLoaded(this.data,
      {required this.visibleDoneTasks, required this.syncState});

  @override
  final TaskListData data;
  @override
  final bool visibleDoneTasks;
  @override
  final TaskListSyncState syncState;

  @override
  String toString() {
    return 'TaskListState.loaded(data: $data, visibleDoneTasks: $visibleDoneTasks, syncState: $syncState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskListStateLoaded &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality()
                .equals(other.visibleDoneTasks, visibleDoneTasks) &&
            const DeepCollectionEquality().equals(other.syncState, syncState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(visibleDoneTasks),
      const DeepCollectionEquality().hash(syncState));

  @JsonKey(ignore: true)
  @override
  _$$TaskListStateLoadedCopyWith<_$TaskListStateLoaded> get copyWith =>
      __$$TaskListStateLoadedCopyWithImpl<_$TaskListStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool visibleDoneTasks, TaskListSyncState syncState)
        initial,
    required TResult Function(
            bool visibleDoneTasks, TaskListSyncState syncState)
        loading,
    required TResult Function(TaskListData data, bool visibleDoneTasks,
            TaskListSyncState syncState)
        loaded,
    required TResult Function(Failure<dynamic> failure, bool visibleDoneTasks,
            TaskListSyncState syncState)
        error,
  }) {
    return loaded(data, visibleDoneTasks, syncState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool visibleDoneTasks, TaskListSyncState syncState)?
        initial,
    TResult Function(bool visibleDoneTasks, TaskListSyncState syncState)?
        loading,
    TResult Function(TaskListData data, bool visibleDoneTasks,
            TaskListSyncState syncState)?
        loaded,
    TResult Function(Failure<dynamic> failure, bool visibleDoneTasks,
            TaskListSyncState syncState)?
        error,
  }) {
    return loaded?.call(data, visibleDoneTasks, syncState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool visibleDoneTasks, TaskListSyncState syncState)?
        initial,
    TResult Function(bool visibleDoneTasks, TaskListSyncState syncState)?
        loading,
    TResult Function(TaskListData data, bool visibleDoneTasks,
            TaskListSyncState syncState)?
        loaded,
    TResult Function(Failure<dynamic> failure, bool visibleDoneTasks,
            TaskListSyncState syncState)?
        error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data, visibleDoneTasks, syncState);
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
  const factory TaskListStateLoaded(final TaskListData data,
      {required final bool visibleDoneTasks,
      required final TaskListSyncState syncState}) = _$TaskListStateLoaded;

  TaskListData get data;
  @override
  bool get visibleDoneTasks;
  @override
  TaskListSyncState get syncState;
  @override
  @JsonKey(ignore: true)
  _$$TaskListStateLoadedCopyWith<_$TaskListStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskListStateErrorCopyWith<$Res>
    implements $TaskListStateCopyWith<$Res> {
  factory _$$TaskListStateErrorCopyWith(_$TaskListStateError value,
          $Res Function(_$TaskListStateError) then) =
      __$$TaskListStateErrorCopyWithImpl<$Res>;
  @override
  $Res call(
      {Failure<dynamic> failure,
      bool visibleDoneTasks,
      TaskListSyncState syncState});
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
    Object? visibleDoneTasks = freezed,
    Object? syncState = freezed,
  }) {
    return _then(_$TaskListStateError(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure<dynamic>,
      visibleDoneTasks: visibleDoneTasks == freezed
          ? _value.visibleDoneTasks
          : visibleDoneTasks // ignore: cast_nullable_to_non_nullable
              as bool,
      syncState: syncState == freezed
          ? _value.syncState
          : syncState // ignore: cast_nullable_to_non_nullable
              as TaskListSyncState,
    ));
  }
}

/// @nodoc

class _$TaskListStateError implements TaskListStateError {
  const _$TaskListStateError(this.failure,
      {required this.visibleDoneTasks, required this.syncState});

  @override
  final Failure<dynamic> failure;
  @override
  final bool visibleDoneTasks;
  @override
  final TaskListSyncState syncState;

  @override
  String toString() {
    return 'TaskListState.error(failure: $failure, visibleDoneTasks: $visibleDoneTasks, syncState: $syncState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskListStateError &&
            const DeepCollectionEquality().equals(other.failure, failure) &&
            const DeepCollectionEquality()
                .equals(other.visibleDoneTasks, visibleDoneTasks) &&
            const DeepCollectionEquality().equals(other.syncState, syncState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(failure),
      const DeepCollectionEquality().hash(visibleDoneTasks),
      const DeepCollectionEquality().hash(syncState));

  @JsonKey(ignore: true)
  @override
  _$$TaskListStateErrorCopyWith<_$TaskListStateError> get copyWith =>
      __$$TaskListStateErrorCopyWithImpl<_$TaskListStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool visibleDoneTasks, TaskListSyncState syncState)
        initial,
    required TResult Function(
            bool visibleDoneTasks, TaskListSyncState syncState)
        loading,
    required TResult Function(TaskListData data, bool visibleDoneTasks,
            TaskListSyncState syncState)
        loaded,
    required TResult Function(Failure<dynamic> failure, bool visibleDoneTasks,
            TaskListSyncState syncState)
        error,
  }) {
    return error(failure, visibleDoneTasks, syncState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool visibleDoneTasks, TaskListSyncState syncState)?
        initial,
    TResult Function(bool visibleDoneTasks, TaskListSyncState syncState)?
        loading,
    TResult Function(TaskListData data, bool visibleDoneTasks,
            TaskListSyncState syncState)?
        loaded,
    TResult Function(Failure<dynamic> failure, bool visibleDoneTasks,
            TaskListSyncState syncState)?
        error,
  }) {
    return error?.call(failure, visibleDoneTasks, syncState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool visibleDoneTasks, TaskListSyncState syncState)?
        initial,
    TResult Function(bool visibleDoneTasks, TaskListSyncState syncState)?
        loading,
    TResult Function(TaskListData data, bool visibleDoneTasks,
            TaskListSyncState syncState)?
        loaded,
    TResult Function(Failure<dynamic> failure, bool visibleDoneTasks,
            TaskListSyncState syncState)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure, visibleDoneTasks, syncState);
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
  const factory TaskListStateError(final Failure<dynamic> failure,
      {required final bool visibleDoneTasks,
      required final TaskListSyncState syncState}) = _$TaskListStateError;

  Failure<dynamic> get failure;
  @override
  bool get visibleDoneTasks;
  @override
  TaskListSyncState get syncState;
  @override
  @JsonKey(ignore: true)
  _$$TaskListStateErrorCopyWith<_$TaskListStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TaskListData {
  UnmodifiableListView<Task> get originalTasks =>
      throw _privateConstructorUsedError;
  UnmodifiableListView<Task> get sortedTasks =>
      throw _privateConstructorUsedError;
  int get completedTasksCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskListDataCopyWith<TaskListData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskListDataCopyWith<$Res> {
  factory $TaskListDataCopyWith(
          TaskListData value, $Res Function(TaskListData) then) =
      _$TaskListDataCopyWithImpl<$Res>;
  $Res call(
      {UnmodifiableListView<Task> originalTasks,
      UnmodifiableListView<Task> sortedTasks,
      int completedTasksCount});
}

/// @nodoc
class _$TaskListDataCopyWithImpl<$Res> implements $TaskListDataCopyWith<$Res> {
  _$TaskListDataCopyWithImpl(this._value, this._then);

  final TaskListData _value;
  // ignore: unused_field
  final $Res Function(TaskListData) _then;

  @override
  $Res call({
    Object? originalTasks = freezed,
    Object? sortedTasks = freezed,
    Object? completedTasksCount = freezed,
  }) {
    return _then(_value.copyWith(
      originalTasks: originalTasks == freezed
          ? _value.originalTasks
          : originalTasks // ignore: cast_nullable_to_non_nullable
              as UnmodifiableListView<Task>,
      sortedTasks: sortedTasks == freezed
          ? _value.sortedTasks
          : sortedTasks // ignore: cast_nullable_to_non_nullable
              as UnmodifiableListView<Task>,
      completedTasksCount: completedTasksCount == freezed
          ? _value.completedTasksCount
          : completedTasksCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_TaskListDataCopyWith<$Res>
    implements $TaskListDataCopyWith<$Res> {
  factory _$$_TaskListDataCopyWith(
          _$_TaskListData value, $Res Function(_$_TaskListData) then) =
      __$$_TaskListDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {UnmodifiableListView<Task> originalTasks,
      UnmodifiableListView<Task> sortedTasks,
      int completedTasksCount});
}

/// @nodoc
class __$$_TaskListDataCopyWithImpl<$Res>
    extends _$TaskListDataCopyWithImpl<$Res>
    implements _$$_TaskListDataCopyWith<$Res> {
  __$$_TaskListDataCopyWithImpl(
      _$_TaskListData _value, $Res Function(_$_TaskListData) _then)
      : super(_value, (v) => _then(v as _$_TaskListData));

  @override
  _$_TaskListData get _value => super._value as _$_TaskListData;

  @override
  $Res call({
    Object? originalTasks = freezed,
    Object? sortedTasks = freezed,
    Object? completedTasksCount = freezed,
  }) {
    return _then(_$_TaskListData(
      originalTasks == freezed
          ? _value.originalTasks
          : originalTasks // ignore: cast_nullable_to_non_nullable
              as UnmodifiableListView<Task>,
      sortedTasks == freezed
          ? _value.sortedTasks
          : sortedTasks // ignore: cast_nullable_to_non_nullable
              as UnmodifiableListView<Task>,
      completedTasksCount == freezed
          ? _value.completedTasksCount
          : completedTasksCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_TaskListData implements _TaskListData {
  const _$_TaskListData(
      this.originalTasks, this.sortedTasks, this.completedTasksCount);

  @override
  final UnmodifiableListView<Task> originalTasks;
  @override
  final UnmodifiableListView<Task> sortedTasks;
  @override
  final int completedTasksCount;

  @override
  String toString() {
    return 'TaskListData(originalTasks: $originalTasks, sortedTasks: $sortedTasks, completedTasksCount: $completedTasksCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskListData &&
            const DeepCollectionEquality()
                .equals(other.originalTasks, originalTasks) &&
            const DeepCollectionEquality()
                .equals(other.sortedTasks, sortedTasks) &&
            const DeepCollectionEquality()
                .equals(other.completedTasksCount, completedTasksCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(originalTasks),
      const DeepCollectionEquality().hash(sortedTasks),
      const DeepCollectionEquality().hash(completedTasksCount));

  @JsonKey(ignore: true)
  @override
  _$$_TaskListDataCopyWith<_$_TaskListData> get copyWith =>
      __$$_TaskListDataCopyWithImpl<_$_TaskListData>(this, _$identity);
}

abstract class _TaskListData implements TaskListData {
  const factory _TaskListData(
      final UnmodifiableListView<Task> originalTasks,
      final UnmodifiableListView<Task> sortedTasks,
      final int completedTasksCount) = _$_TaskListData;

  @override
  UnmodifiableListView<Task> get originalTasks;
  @override
  UnmodifiableListView<Task> get sortedTasks;
  @override
  int get completedTasksCount;
  @override
  @JsonKey(ignore: true)
  _$$_TaskListDataCopyWith<_$_TaskListData> get copyWith =>
      throw _privateConstructorUsedError;
}
