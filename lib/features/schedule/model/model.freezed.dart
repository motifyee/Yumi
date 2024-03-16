// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return ScheduleData.fromJson(json);
}

/// @nodoc
mixin _$Schedule {
  String get guid => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  bool? get saturdayActive => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay? get saturdayStart => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay? get saturdayEnd => throw _privateConstructorUsedError;
  bool? get sundayActive => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay? get sundayStart => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay? get sundayEnd => throw _privateConstructorUsedError;
  bool? get mondayActive => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay? get mondayStart => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay? get mondayEnd => throw _privateConstructorUsedError;
  bool? get tuesdayActive => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay? get tuesdayStart => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay? get tuesdayEnd => throw _privateConstructorUsedError;
  bool? get wednesdayActive => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay? get wednesdayStart => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay? get wednesdayEnd => throw _privateConstructorUsedError;
  bool? get thursdayActive => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay? get thursdayStart => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay? get thursdayEnd => throw _privateConstructorUsedError;
  bool? get fridayActive => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay? get fridayStart => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay? get fridayEnd => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleCopyWith<Schedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleCopyWith<$Res> {
  factory $ScheduleCopyWith(Schedule value, $Res Function(Schedule) then) =
      _$ScheduleCopyWithImpl<$Res, Schedule>;
  @useResult
  $Res call(
      {String guid,
      String userId,
      bool? saturdayActive,
      @TimeOfDayConverter() TimeOfDay? saturdayStart,
      @TimeOfDayConverter() TimeOfDay? saturdayEnd,
      bool? sundayActive,
      @TimeOfDayConverter() TimeOfDay? sundayStart,
      @TimeOfDayConverter() TimeOfDay? sundayEnd,
      bool? mondayActive,
      @TimeOfDayConverter() TimeOfDay? mondayStart,
      @TimeOfDayConverter() TimeOfDay? mondayEnd,
      bool? tuesdayActive,
      @TimeOfDayConverter() TimeOfDay? tuesdayStart,
      @TimeOfDayConverter() TimeOfDay? tuesdayEnd,
      bool? wednesdayActive,
      @TimeOfDayConverter() TimeOfDay? wednesdayStart,
      @TimeOfDayConverter() TimeOfDay? wednesdayEnd,
      bool? thursdayActive,
      @TimeOfDayConverter() TimeOfDay? thursdayStart,
      @TimeOfDayConverter() TimeOfDay? thursdayEnd,
      bool? fridayActive,
      @TimeOfDayConverter() TimeOfDay? fridayStart,
      @TimeOfDayConverter() TimeOfDay? fridayEnd});
}

/// @nodoc
class _$ScheduleCopyWithImpl<$Res, $Val extends Schedule>
    implements $ScheduleCopyWith<$Res> {
  _$ScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guid = null,
    Object? userId = null,
    Object? saturdayActive = freezed,
    Object? saturdayStart = freezed,
    Object? saturdayEnd = freezed,
    Object? sundayActive = freezed,
    Object? sundayStart = freezed,
    Object? sundayEnd = freezed,
    Object? mondayActive = freezed,
    Object? mondayStart = freezed,
    Object? mondayEnd = freezed,
    Object? tuesdayActive = freezed,
    Object? tuesdayStart = freezed,
    Object? tuesdayEnd = freezed,
    Object? wednesdayActive = freezed,
    Object? wednesdayStart = freezed,
    Object? wednesdayEnd = freezed,
    Object? thursdayActive = freezed,
    Object? thursdayStart = freezed,
    Object? thursdayEnd = freezed,
    Object? fridayActive = freezed,
    Object? fridayStart = freezed,
    Object? fridayEnd = freezed,
  }) {
    return _then(_value.copyWith(
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      saturdayActive: freezed == saturdayActive
          ? _value.saturdayActive
          : saturdayActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      saturdayStart: freezed == saturdayStart
          ? _value.saturdayStart
          : saturdayStart // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      saturdayEnd: freezed == saturdayEnd
          ? _value.saturdayEnd
          : saturdayEnd // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      sundayActive: freezed == sundayActive
          ? _value.sundayActive
          : sundayActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      sundayStart: freezed == sundayStart
          ? _value.sundayStart
          : sundayStart // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      sundayEnd: freezed == sundayEnd
          ? _value.sundayEnd
          : sundayEnd // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      mondayActive: freezed == mondayActive
          ? _value.mondayActive
          : mondayActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      mondayStart: freezed == mondayStart
          ? _value.mondayStart
          : mondayStart // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      mondayEnd: freezed == mondayEnd
          ? _value.mondayEnd
          : mondayEnd // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      tuesdayActive: freezed == tuesdayActive
          ? _value.tuesdayActive
          : tuesdayActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      tuesdayStart: freezed == tuesdayStart
          ? _value.tuesdayStart
          : tuesdayStart // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      tuesdayEnd: freezed == tuesdayEnd
          ? _value.tuesdayEnd
          : tuesdayEnd // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      wednesdayActive: freezed == wednesdayActive
          ? _value.wednesdayActive
          : wednesdayActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      wednesdayStart: freezed == wednesdayStart
          ? _value.wednesdayStart
          : wednesdayStart // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      wednesdayEnd: freezed == wednesdayEnd
          ? _value.wednesdayEnd
          : wednesdayEnd // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      thursdayActive: freezed == thursdayActive
          ? _value.thursdayActive
          : thursdayActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      thursdayStart: freezed == thursdayStart
          ? _value.thursdayStart
          : thursdayStart // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      thursdayEnd: freezed == thursdayEnd
          ? _value.thursdayEnd
          : thursdayEnd // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      fridayActive: freezed == fridayActive
          ? _value.fridayActive
          : fridayActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      fridayStart: freezed == fridayStart
          ? _value.fridayStart
          : fridayStart // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      fridayEnd: freezed == fridayEnd
          ? _value.fridayEnd
          : fridayEnd // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleDataImplCopyWith<$Res>
    implements $ScheduleCopyWith<$Res> {
  factory _$$ScheduleDataImplCopyWith(
          _$ScheduleDataImpl value, $Res Function(_$ScheduleDataImpl) then) =
      __$$ScheduleDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String guid,
      String userId,
      bool? saturdayActive,
      @TimeOfDayConverter() TimeOfDay? saturdayStart,
      @TimeOfDayConverter() TimeOfDay? saturdayEnd,
      bool? sundayActive,
      @TimeOfDayConverter() TimeOfDay? sundayStart,
      @TimeOfDayConverter() TimeOfDay? sundayEnd,
      bool? mondayActive,
      @TimeOfDayConverter() TimeOfDay? mondayStart,
      @TimeOfDayConverter() TimeOfDay? mondayEnd,
      bool? tuesdayActive,
      @TimeOfDayConverter() TimeOfDay? tuesdayStart,
      @TimeOfDayConverter() TimeOfDay? tuesdayEnd,
      bool? wednesdayActive,
      @TimeOfDayConverter() TimeOfDay? wednesdayStart,
      @TimeOfDayConverter() TimeOfDay? wednesdayEnd,
      bool? thursdayActive,
      @TimeOfDayConverter() TimeOfDay? thursdayStart,
      @TimeOfDayConverter() TimeOfDay? thursdayEnd,
      bool? fridayActive,
      @TimeOfDayConverter() TimeOfDay? fridayStart,
      @TimeOfDayConverter() TimeOfDay? fridayEnd});
}

/// @nodoc
class __$$ScheduleDataImplCopyWithImpl<$Res>
    extends _$ScheduleCopyWithImpl<$Res, _$ScheduleDataImpl>
    implements _$$ScheduleDataImplCopyWith<$Res> {
  __$$ScheduleDataImplCopyWithImpl(
      _$ScheduleDataImpl _value, $Res Function(_$ScheduleDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guid = null,
    Object? userId = null,
    Object? saturdayActive = freezed,
    Object? saturdayStart = freezed,
    Object? saturdayEnd = freezed,
    Object? sundayActive = freezed,
    Object? sundayStart = freezed,
    Object? sundayEnd = freezed,
    Object? mondayActive = freezed,
    Object? mondayStart = freezed,
    Object? mondayEnd = freezed,
    Object? tuesdayActive = freezed,
    Object? tuesdayStart = freezed,
    Object? tuesdayEnd = freezed,
    Object? wednesdayActive = freezed,
    Object? wednesdayStart = freezed,
    Object? wednesdayEnd = freezed,
    Object? thursdayActive = freezed,
    Object? thursdayStart = freezed,
    Object? thursdayEnd = freezed,
    Object? fridayActive = freezed,
    Object? fridayStart = freezed,
    Object? fridayEnd = freezed,
  }) {
    return _then(_$ScheduleDataImpl(
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      saturdayActive: freezed == saturdayActive
          ? _value.saturdayActive
          : saturdayActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      saturdayStart: freezed == saturdayStart
          ? _value.saturdayStart
          : saturdayStart // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      saturdayEnd: freezed == saturdayEnd
          ? _value.saturdayEnd
          : saturdayEnd // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      sundayActive: freezed == sundayActive
          ? _value.sundayActive
          : sundayActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      sundayStart: freezed == sundayStart
          ? _value.sundayStart
          : sundayStart // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      sundayEnd: freezed == sundayEnd
          ? _value.sundayEnd
          : sundayEnd // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      mondayActive: freezed == mondayActive
          ? _value.mondayActive
          : mondayActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      mondayStart: freezed == mondayStart
          ? _value.mondayStart
          : mondayStart // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      mondayEnd: freezed == mondayEnd
          ? _value.mondayEnd
          : mondayEnd // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      tuesdayActive: freezed == tuesdayActive
          ? _value.tuesdayActive
          : tuesdayActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      tuesdayStart: freezed == tuesdayStart
          ? _value.tuesdayStart
          : tuesdayStart // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      tuesdayEnd: freezed == tuesdayEnd
          ? _value.tuesdayEnd
          : tuesdayEnd // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      wednesdayActive: freezed == wednesdayActive
          ? _value.wednesdayActive
          : wednesdayActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      wednesdayStart: freezed == wednesdayStart
          ? _value.wednesdayStart
          : wednesdayStart // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      wednesdayEnd: freezed == wednesdayEnd
          ? _value.wednesdayEnd
          : wednesdayEnd // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      thursdayActive: freezed == thursdayActive
          ? _value.thursdayActive
          : thursdayActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      thursdayStart: freezed == thursdayStart
          ? _value.thursdayStart
          : thursdayStart // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      thursdayEnd: freezed == thursdayEnd
          ? _value.thursdayEnd
          : thursdayEnd // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      fridayActive: freezed == fridayActive
          ? _value.fridayActive
          : fridayActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      fridayStart: freezed == fridayStart
          ? _value.fridayStart
          : fridayStart // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      fridayEnd: freezed == fridayEnd
          ? _value.fridayEnd
          : fridayEnd // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleDataImpl extends ScheduleData {
  const _$ScheduleDataImpl(
      {this.guid = '',
      this.userId = '',
      this.saturdayActive,
      @TimeOfDayConverter() this.saturdayStart,
      @TimeOfDayConverter() this.saturdayEnd,
      this.sundayActive,
      @TimeOfDayConverter() this.sundayStart,
      @TimeOfDayConverter() this.sundayEnd,
      this.mondayActive,
      @TimeOfDayConverter() this.mondayStart,
      @TimeOfDayConverter() this.mondayEnd,
      this.tuesdayActive,
      @TimeOfDayConverter() this.tuesdayStart,
      @TimeOfDayConverter() this.tuesdayEnd,
      this.wednesdayActive,
      @TimeOfDayConverter() this.wednesdayStart,
      @TimeOfDayConverter() this.wednesdayEnd,
      this.thursdayActive,
      @TimeOfDayConverter() this.thursdayStart,
      @TimeOfDayConverter() this.thursdayEnd,
      this.fridayActive,
      @TimeOfDayConverter() this.fridayStart,
      @TimeOfDayConverter() this.fridayEnd})
      : super._();

  factory _$ScheduleDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleDataImplFromJson(json);

  @override
  @JsonKey()
  final String guid;
  @override
  @JsonKey()
  final String userId;
  @override
  final bool? saturdayActive;
  @override
  @TimeOfDayConverter()
  final TimeOfDay? saturdayStart;
  @override
  @TimeOfDayConverter()
  final TimeOfDay? saturdayEnd;
  @override
  final bool? sundayActive;
  @override
  @TimeOfDayConverter()
  final TimeOfDay? sundayStart;
  @override
  @TimeOfDayConverter()
  final TimeOfDay? sundayEnd;
  @override
  final bool? mondayActive;
  @override
  @TimeOfDayConverter()
  final TimeOfDay? mondayStart;
  @override
  @TimeOfDayConverter()
  final TimeOfDay? mondayEnd;
  @override
  final bool? tuesdayActive;
  @override
  @TimeOfDayConverter()
  final TimeOfDay? tuesdayStart;
  @override
  @TimeOfDayConverter()
  final TimeOfDay? tuesdayEnd;
  @override
  final bool? wednesdayActive;
  @override
  @TimeOfDayConverter()
  final TimeOfDay? wednesdayStart;
  @override
  @TimeOfDayConverter()
  final TimeOfDay? wednesdayEnd;
  @override
  final bool? thursdayActive;
  @override
  @TimeOfDayConverter()
  final TimeOfDay? thursdayStart;
  @override
  @TimeOfDayConverter()
  final TimeOfDay? thursdayEnd;
  @override
  final bool? fridayActive;
  @override
  @TimeOfDayConverter()
  final TimeOfDay? fridayStart;
  @override
  @TimeOfDayConverter()
  final TimeOfDay? fridayEnd;

  @override
  String toString() {
    return 'Schedule(guid: $guid, userId: $userId, saturdayActive: $saturdayActive, saturdayStart: $saturdayStart, saturdayEnd: $saturdayEnd, sundayActive: $sundayActive, sundayStart: $sundayStart, sundayEnd: $sundayEnd, mondayActive: $mondayActive, mondayStart: $mondayStart, mondayEnd: $mondayEnd, tuesdayActive: $tuesdayActive, tuesdayStart: $tuesdayStart, tuesdayEnd: $tuesdayEnd, wednesdayActive: $wednesdayActive, wednesdayStart: $wednesdayStart, wednesdayEnd: $wednesdayEnd, thursdayActive: $thursdayActive, thursdayStart: $thursdayStart, thursdayEnd: $thursdayEnd, fridayActive: $fridayActive, fridayStart: $fridayStart, fridayEnd: $fridayEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleDataImpl &&
            (identical(other.guid, guid) || other.guid == guid) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.saturdayActive, saturdayActive) ||
                other.saturdayActive == saturdayActive) &&
            (identical(other.saturdayStart, saturdayStart) ||
                other.saturdayStart == saturdayStart) &&
            (identical(other.saturdayEnd, saturdayEnd) ||
                other.saturdayEnd == saturdayEnd) &&
            (identical(other.sundayActive, sundayActive) ||
                other.sundayActive == sundayActive) &&
            (identical(other.sundayStart, sundayStart) ||
                other.sundayStart == sundayStart) &&
            (identical(other.sundayEnd, sundayEnd) ||
                other.sundayEnd == sundayEnd) &&
            (identical(other.mondayActive, mondayActive) ||
                other.mondayActive == mondayActive) &&
            (identical(other.mondayStart, mondayStart) ||
                other.mondayStart == mondayStart) &&
            (identical(other.mondayEnd, mondayEnd) ||
                other.mondayEnd == mondayEnd) &&
            (identical(other.tuesdayActive, tuesdayActive) ||
                other.tuesdayActive == tuesdayActive) &&
            (identical(other.tuesdayStart, tuesdayStart) ||
                other.tuesdayStart == tuesdayStart) &&
            (identical(other.tuesdayEnd, tuesdayEnd) ||
                other.tuesdayEnd == tuesdayEnd) &&
            (identical(other.wednesdayActive, wednesdayActive) ||
                other.wednesdayActive == wednesdayActive) &&
            (identical(other.wednesdayStart, wednesdayStart) ||
                other.wednesdayStart == wednesdayStart) &&
            (identical(other.wednesdayEnd, wednesdayEnd) ||
                other.wednesdayEnd == wednesdayEnd) &&
            (identical(other.thursdayActive, thursdayActive) ||
                other.thursdayActive == thursdayActive) &&
            (identical(other.thursdayStart, thursdayStart) ||
                other.thursdayStart == thursdayStart) &&
            (identical(other.thursdayEnd, thursdayEnd) ||
                other.thursdayEnd == thursdayEnd) &&
            (identical(other.fridayActive, fridayActive) ||
                other.fridayActive == fridayActive) &&
            (identical(other.fridayStart, fridayStart) ||
                other.fridayStart == fridayStart) &&
            (identical(other.fridayEnd, fridayEnd) ||
                other.fridayEnd == fridayEnd));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        guid,
        userId,
        saturdayActive,
        saturdayStart,
        saturdayEnd,
        sundayActive,
        sundayStart,
        sundayEnd,
        mondayActive,
        mondayStart,
        mondayEnd,
        tuesdayActive,
        tuesdayStart,
        tuesdayEnd,
        wednesdayActive,
        wednesdayStart,
        wednesdayEnd,
        thursdayActive,
        thursdayStart,
        thursdayEnd,
        fridayActive,
        fridayStart,
        fridayEnd
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleDataImplCopyWith<_$ScheduleDataImpl> get copyWith =>
      __$$ScheduleDataImplCopyWithImpl<_$ScheduleDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleDataImplToJson(
      this,
    );
  }
}

abstract class ScheduleData extends Schedule {
  const factory ScheduleData(
      {final String guid,
      final String userId,
      final bool? saturdayActive,
      @TimeOfDayConverter() final TimeOfDay? saturdayStart,
      @TimeOfDayConverter() final TimeOfDay? saturdayEnd,
      final bool? sundayActive,
      @TimeOfDayConverter() final TimeOfDay? sundayStart,
      @TimeOfDayConverter() final TimeOfDay? sundayEnd,
      final bool? mondayActive,
      @TimeOfDayConverter() final TimeOfDay? mondayStart,
      @TimeOfDayConverter() final TimeOfDay? mondayEnd,
      final bool? tuesdayActive,
      @TimeOfDayConverter() final TimeOfDay? tuesdayStart,
      @TimeOfDayConverter() final TimeOfDay? tuesdayEnd,
      final bool? wednesdayActive,
      @TimeOfDayConverter() final TimeOfDay? wednesdayStart,
      @TimeOfDayConverter() final TimeOfDay? wednesdayEnd,
      final bool? thursdayActive,
      @TimeOfDayConverter() final TimeOfDay? thursdayStart,
      @TimeOfDayConverter() final TimeOfDay? thursdayEnd,
      final bool? fridayActive,
      @TimeOfDayConverter() final TimeOfDay? fridayStart,
      @TimeOfDayConverter() final TimeOfDay? fridayEnd}) = _$ScheduleDataImpl;
  const ScheduleData._() : super._();

  factory ScheduleData.fromJson(Map<String, dynamic> json) =
      _$ScheduleDataImpl.fromJson;

  @override
  String get guid;
  @override
  String get userId;
  @override
  bool? get saturdayActive;
  @override
  @TimeOfDayConverter()
  TimeOfDay? get saturdayStart;
  @override
  @TimeOfDayConverter()
  TimeOfDay? get saturdayEnd;
  @override
  bool? get sundayActive;
  @override
  @TimeOfDayConverter()
  TimeOfDay? get sundayStart;
  @override
  @TimeOfDayConverter()
  TimeOfDay? get sundayEnd;
  @override
  bool? get mondayActive;
  @override
  @TimeOfDayConverter()
  TimeOfDay? get mondayStart;
  @override
  @TimeOfDayConverter()
  TimeOfDay? get mondayEnd;
  @override
  bool? get tuesdayActive;
  @override
  @TimeOfDayConverter()
  TimeOfDay? get tuesdayStart;
  @override
  @TimeOfDayConverter()
  TimeOfDay? get tuesdayEnd;
  @override
  bool? get wednesdayActive;
  @override
  @TimeOfDayConverter()
  TimeOfDay? get wednesdayStart;
  @override
  @TimeOfDayConverter()
  TimeOfDay? get wednesdayEnd;
  @override
  bool? get thursdayActive;
  @override
  @TimeOfDayConverter()
  TimeOfDay? get thursdayStart;
  @override
  @TimeOfDayConverter()
  TimeOfDay? get thursdayEnd;
  @override
  bool? get fridayActive;
  @override
  @TimeOfDayConverter()
  TimeOfDay? get fridayStart;
  @override
  @TimeOfDayConverter()
  TimeOfDay? get fridayEnd;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleDataImplCopyWith<_$ScheduleDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ScheduleDay {
  WeekDay? get name => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;
  TimeOfDay? get start => throw _privateConstructorUsedError;
  TimeOfDay? get end => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScheduleDayCopyWith<ScheduleDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleDayCopyWith<$Res> {
  factory $ScheduleDayCopyWith(
          ScheduleDay value, $Res Function(ScheduleDay) then) =
      _$ScheduleDayCopyWithImpl<$Res, ScheduleDay>;
  @useResult
  $Res call({WeekDay? name, bool? active, TimeOfDay? start, TimeOfDay? end});
}

/// @nodoc
class _$ScheduleDayCopyWithImpl<$Res, $Val extends ScheduleDay>
    implements $ScheduleDayCopyWith<$Res> {
  _$ScheduleDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? active = freezed,
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as WeekDay?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$scheduleDayInitImplCopyWith<$Res>
    implements $ScheduleDayCopyWith<$Res> {
  factory _$$scheduleDayInitImplCopyWith(_$scheduleDayInitImpl value,
          $Res Function(_$scheduleDayInitImpl) then) =
      __$$scheduleDayInitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WeekDay? name, bool? active, TimeOfDay? start, TimeOfDay? end});
}

/// @nodoc
class __$$scheduleDayInitImplCopyWithImpl<$Res>
    extends _$ScheduleDayCopyWithImpl<$Res, _$scheduleDayInitImpl>
    implements _$$scheduleDayInitImplCopyWith<$Res> {
  __$$scheduleDayInitImplCopyWithImpl(
      _$scheduleDayInitImpl _value, $Res Function(_$scheduleDayInitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? active = freezed,
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_$scheduleDayInitImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as WeekDay?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
    ));
  }
}

/// @nodoc

class _$scheduleDayInitImpl implements _scheduleDayInit {
  const _$scheduleDayInitImpl({this.name, this.active, this.start, this.end});

  @override
  final WeekDay? name;
  @override
  final bool? active;
  @override
  final TimeOfDay? start;
  @override
  final TimeOfDay? end;

  @override
  String toString() {
    return 'ScheduleDay(name: $name, active: $active, start: $start, end: $end)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$scheduleDayInitImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, active, start, end);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$scheduleDayInitImplCopyWith<_$scheduleDayInitImpl> get copyWith =>
      __$$scheduleDayInitImplCopyWithImpl<_$scheduleDayInitImpl>(
          this, _$identity);
}

abstract class _scheduleDayInit implements ScheduleDay {
  const factory _scheduleDayInit(
      {final WeekDay? name,
      final bool? active,
      final TimeOfDay? start,
      final TimeOfDay? end}) = _$scheduleDayInitImpl;

  @override
  WeekDay? get name;
  @override
  bool? get active;
  @override
  TimeOfDay? get start;
  @override
  TimeOfDay? get end;
  @override
  @JsonKey(ignore: true)
  _$$scheduleDayInitImplCopyWith<_$scheduleDayInitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
