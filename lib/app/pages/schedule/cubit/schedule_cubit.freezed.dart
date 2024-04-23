// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScheduleState {
  Schedule get schedule => throw _privateConstructorUsedError;
  Schedule get scheduleForm => throw _privateConstructorUsedError;
  ObseleteStatusEnum get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScheduleStateCopyWith<ScheduleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleStateCopyWith<$Res> {
  factory $ScheduleStateCopyWith(
          ScheduleState value, $Res Function(ScheduleState) then) =
      _$ScheduleStateCopyWithImpl<$Res, ScheduleState>;
  @useResult
  $Res call(
      {Schedule schedule, Schedule scheduleForm, ObseleteStatusEnum status});

  $ScheduleCopyWith<$Res> get schedule;
  $ScheduleCopyWith<$Res> get scheduleForm;
}

/// @nodoc
class _$ScheduleStateCopyWithImpl<$Res, $Val extends ScheduleState>
    implements $ScheduleStateCopyWith<$Res> {
  _$ScheduleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schedule = null,
    Object? scheduleForm = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      schedule: null == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as Schedule,
      scheduleForm: null == scheduleForm
          ? _value.scheduleForm
          : scheduleForm // ignore: cast_nullable_to_non_nullable
              as Schedule,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ObseleteStatusEnum,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ScheduleCopyWith<$Res> get schedule {
    return $ScheduleCopyWith<$Res>(_value.schedule, (value) {
      return _then(_value.copyWith(schedule: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ScheduleCopyWith<$Res> get scheduleForm {
    return $ScheduleCopyWith<$Res>(_value.scheduleForm, (value) {
      return _then(_value.copyWith(scheduleForm: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ScheduleStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Schedule schedule, Schedule scheduleForm, ObseleteStatusEnum status});

  @override
  $ScheduleCopyWith<$Res> get schedule;
  @override
  $ScheduleCopyWith<$Res> get scheduleForm;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ScheduleStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schedule = null,
    Object? scheduleForm = null,
    Object? status = null,
  }) {
    return _then(_$InitialImpl(
      schedule: null == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as Schedule,
      scheduleForm: null == scheduleForm
          ? _value.scheduleForm
          : scheduleForm // ignore: cast_nullable_to_non_nullable
              as Schedule,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ObseleteStatusEnum,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends Initial {
  const _$InitialImpl(
      {this.schedule = const Schedule(),
      this.scheduleForm = const Schedule(),
      this.status = ObseleteStatusEnum.init})
      : super._();

  @override
  @JsonKey()
  final Schedule schedule;
  @override
  @JsonKey()
  final Schedule scheduleForm;
  @override
  @JsonKey()
  final ObseleteStatusEnum status;

  @override
  String toString() {
    return 'ScheduleState(schedule: $schedule, scheduleForm: $scheduleForm, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule) &&
            (identical(other.scheduleForm, scheduleForm) ||
                other.scheduleForm == scheduleForm) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, schedule, scheduleForm, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class Initial extends ScheduleState {
  const factory Initial(
      {final Schedule schedule,
      final Schedule scheduleForm,
      final ObseleteStatusEnum status}) = _$InitialImpl;
  const Initial._() : super._();

  @override
  Schedule get schedule;
  @override
  Schedule get scheduleForm;
  @override
  ObseleteStatusEnum get status;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
