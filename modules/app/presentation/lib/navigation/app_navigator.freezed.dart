// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_navigator.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppNavigatorState {
  UnmodifiableListView<AppPageRoute> get stack =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppNavigatorStateCopyWith<AppNavigatorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppNavigatorStateCopyWith<$Res> {
  factory $AppNavigatorStateCopyWith(
          AppNavigatorState value, $Res Function(AppNavigatorState) then) =
      _$AppNavigatorStateCopyWithImpl<$Res>;
  $Res call({UnmodifiableListView<AppPageRoute> stack});
}

/// @nodoc
class _$AppNavigatorStateCopyWithImpl<$Res>
    implements $AppNavigatorStateCopyWith<$Res> {
  _$AppNavigatorStateCopyWithImpl(this._value, this._then);

  final AppNavigatorState _value;
  // ignore: unused_field
  final $Res Function(AppNavigatorState) _then;

  @override
  $Res call({
    Object? stack = freezed,
  }) {
    return _then(_value.copyWith(
      stack: stack == freezed
          ? _value.stack
          : stack // ignore: cast_nullable_to_non_nullable
              as UnmodifiableListView<AppPageRoute>,
    ));
  }
}

/// @nodoc
abstract class _$$_AppNavigatorStateCopyWith<$Res>
    implements $AppNavigatorStateCopyWith<$Res> {
  factory _$$_AppNavigatorStateCopyWith(_$_AppNavigatorState value,
          $Res Function(_$_AppNavigatorState) then) =
      __$$_AppNavigatorStateCopyWithImpl<$Res>;
  @override
  $Res call({UnmodifiableListView<AppPageRoute> stack});
}

/// @nodoc
class __$$_AppNavigatorStateCopyWithImpl<$Res>
    extends _$AppNavigatorStateCopyWithImpl<$Res>
    implements _$$_AppNavigatorStateCopyWith<$Res> {
  __$$_AppNavigatorStateCopyWithImpl(
      _$_AppNavigatorState _value, $Res Function(_$_AppNavigatorState) _then)
      : super(_value, (v) => _then(v as _$_AppNavigatorState));

  @override
  _$_AppNavigatorState get _value => super._value as _$_AppNavigatorState;

  @override
  $Res call({
    Object? stack = freezed,
  }) {
    return _then(_$_AppNavigatorState(
      stack == freezed
          ? _value.stack
          : stack // ignore: cast_nullable_to_non_nullable
              as UnmodifiableListView<AppPageRoute>,
    ));
  }
}

/// @nodoc

class _$_AppNavigatorState implements _AppNavigatorState {
  const _$_AppNavigatorState(this.stack);

  @override
  final UnmodifiableListView<AppPageRoute> stack;

  @override
  String toString() {
    return 'AppNavigatorState(stack: $stack)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppNavigatorState &&
            const DeepCollectionEquality().equals(other.stack, stack));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(stack));

  @JsonKey(ignore: true)
  @override
  _$$_AppNavigatorStateCopyWith<_$_AppNavigatorState> get copyWith =>
      __$$_AppNavigatorStateCopyWithImpl<_$_AppNavigatorState>(
          this, _$identity);
}

abstract class _AppNavigatorState implements AppNavigatorState {
  const factory _AppNavigatorState(
      final UnmodifiableListView<AppPageRoute> stack) = _$_AppNavigatorState;

  @override
  UnmodifiableListView<AppPageRoute> get stack;
  @override
  @JsonKey(ignore: true)
  _$$_AppNavigatorStateCopyWith<_$_AppNavigatorState> get copyWith =>
      throw _privateConstructorUsedError;
}
