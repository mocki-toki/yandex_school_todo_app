// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  @StringToUuidConvertor()
  UuidValue get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  Importance get importance => throw _privateConstructorUsedError;
  @StringToDateTimeOrNullConverter()
  DateTime? get deadline => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;
  @HexToColorOrNullConverter()
  Color? get color => throw _privateConstructorUsedError;
  @StringToDateTimeConvertor()
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @StringToDateTimeConvertor()
  @JsonKey(name: 'changed_at')
  DateTime get changedAt => throw _privateConstructorUsedError;
  @StringToDeviceIdentificatorConvertor()
  @JsonKey(name: 'last_updated_by')
  DeviceIdentificator get lastUpdatedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res>;
  $Res call(
      {@StringToUuidConvertor()
          UuidValue id,
      String text,
      Importance importance,
      @StringToDateTimeOrNullConverter()
          DateTime? deadline,
      bool done,
      @HexToColorOrNullConverter()
          Color? color,
      @StringToDateTimeConvertor()
      @JsonKey(name: 'created_at')
          DateTime createdAt,
      @StringToDateTimeConvertor()
      @JsonKey(name: 'changed_at')
          DateTime changedAt,
      @StringToDeviceIdentificatorConvertor()
      @JsonKey(name: 'last_updated_by')
          DeviceIdentificator lastUpdatedBy});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res> implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  final Task _value;
  // ignore: unused_field
  final $Res Function(Task) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? importance = freezed,
    Object? deadline = freezed,
    Object? done = freezed,
    Object? color = freezed,
    Object? createdAt = freezed,
    Object? changedAt = freezed,
    Object? lastUpdatedBy = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UuidValue,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      importance: importance == freezed
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as Importance,
      deadline: deadline == freezed
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      changedAt: changedAt == freezed
          ? _value.changedAt
          : changedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUpdatedBy: lastUpdatedBy == freezed
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as DeviceIdentificator,
    ));
  }
}

/// @nodoc
abstract class _$$_TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$_TaskCopyWith(_$_Task value, $Res Function(_$_Task) then) =
      __$$_TaskCopyWithImpl<$Res>;
  @override
  $Res call(
      {@StringToUuidConvertor()
          UuidValue id,
      String text,
      Importance importance,
      @StringToDateTimeOrNullConverter()
          DateTime? deadline,
      bool done,
      @HexToColorOrNullConverter()
          Color? color,
      @StringToDateTimeConvertor()
      @JsonKey(name: 'created_at')
          DateTime createdAt,
      @StringToDateTimeConvertor()
      @JsonKey(name: 'changed_at')
          DateTime changedAt,
      @StringToDeviceIdentificatorConvertor()
      @JsonKey(name: 'last_updated_by')
          DeviceIdentificator lastUpdatedBy});
}

/// @nodoc
class __$$_TaskCopyWithImpl<$Res> extends _$TaskCopyWithImpl<$Res>
    implements _$$_TaskCopyWith<$Res> {
  __$$_TaskCopyWithImpl(_$_Task _value, $Res Function(_$_Task) _then)
      : super(_value, (v) => _then(v as _$_Task));

  @override
  _$_Task get _value => super._value as _$_Task;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? importance = freezed,
    Object? deadline = freezed,
    Object? done = freezed,
    Object? color = freezed,
    Object? createdAt = freezed,
    Object? changedAt = freezed,
    Object? lastUpdatedBy = freezed,
  }) {
    return _then(_$_Task(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UuidValue,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      importance: importance == freezed
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as Importance,
      deadline: deadline == freezed
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      changedAt: changedAt == freezed
          ? _value.changedAt
          : changedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUpdatedBy: lastUpdatedBy == freezed
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as DeviceIdentificator,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Task implements _Task {
  const _$_Task(
      {@StringToUuidConvertor()
          required this.id,
      required this.text,
      required this.importance,
      @StringToDateTimeOrNullConverter()
          required this.deadline,
      required this.done,
      @HexToColorOrNullConverter()
          required this.color,
      @StringToDateTimeConvertor()
      @JsonKey(name: 'created_at')
          required this.createdAt,
      @StringToDateTimeConvertor()
      @JsonKey(name: 'changed_at')
          required this.changedAt,
      @StringToDeviceIdentificatorConvertor()
      @JsonKey(name: 'last_updated_by')
          required this.lastUpdatedBy});

  factory _$_Task.fromJson(Map<String, dynamic> json) => _$$_TaskFromJson(json);

  @override
  @StringToUuidConvertor()
  final UuidValue id;
  @override
  final String text;
  @override
  final Importance importance;
  @override
  @StringToDateTimeOrNullConverter()
  final DateTime? deadline;
  @override
  final bool done;
  @override
  @HexToColorOrNullConverter()
  final Color? color;
  @override
  @StringToDateTimeConvertor()
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @StringToDateTimeConvertor()
  @JsonKey(name: 'changed_at')
  final DateTime changedAt;
  @override
  @StringToDeviceIdentificatorConvertor()
  @JsonKey(name: 'last_updated_by')
  final DeviceIdentificator lastUpdatedBy;

  @override
  String toString() {
    return 'Task(id: $id, text: $text, importance: $importance, deadline: $deadline, done: $done, color: $color, createdAt: $createdAt, changedAt: $changedAt, lastUpdatedBy: $lastUpdatedBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Task &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality()
                .equals(other.importance, importance) &&
            const DeepCollectionEquality().equals(other.deadline, deadline) &&
            const DeepCollectionEquality().equals(other.done, done) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.changedAt, changedAt) &&
            const DeepCollectionEquality()
                .equals(other.lastUpdatedBy, lastUpdatedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(importance),
      const DeepCollectionEquality().hash(deadline),
      const DeepCollectionEquality().hash(done),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(changedAt),
      const DeepCollectionEquality().hash(lastUpdatedBy));

  @JsonKey(ignore: true)
  @override
  _$$_TaskCopyWith<_$_Task> get copyWith =>
      __$$_TaskCopyWithImpl<_$_Task>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskToJson(
      this,
    );
  }
}

abstract class _Task implements Task {
  const factory _Task(
      {@StringToUuidConvertor()
          required final UuidValue id,
      required final String text,
      required final Importance importance,
      @StringToDateTimeOrNullConverter()
          required final DateTime? deadline,
      required final bool done,
      @HexToColorOrNullConverter()
          required final Color? color,
      @StringToDateTimeConvertor()
      @JsonKey(name: 'created_at')
          required final DateTime createdAt,
      @StringToDateTimeConvertor()
      @JsonKey(name: 'changed_at')
          required final DateTime changedAt,
      @StringToDeviceIdentificatorConvertor()
      @JsonKey(name: 'last_updated_by')
          required final DeviceIdentificator lastUpdatedBy}) = _$_Task;

  factory _Task.fromJson(Map<String, dynamic> json) = _$_Task.fromJson;

  @override
  @StringToUuidConvertor()
  UuidValue get id;
  @override
  String get text;
  @override
  Importance get importance;
  @override
  @StringToDateTimeOrNullConverter()
  DateTime? get deadline;
  @override
  bool get done;
  @override
  @HexToColorOrNullConverter()
  Color? get color;
  @override
  @StringToDateTimeConvertor()
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @StringToDateTimeConvertor()
  @JsonKey(name: 'changed_at')
  DateTime get changedAt;
  @override
  @StringToDeviceIdentificatorConvertor()
  @JsonKey(name: 'last_updated_by')
  DeviceIdentificator get lastUpdatedBy;
  @override
  @JsonKey(ignore: true)
  _$$_TaskCopyWith<_$_Task> get copyWith => throw _privateConstructorUsedError;
}
