// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule.dart';

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
  String get id => throw _privateConstructorUsedError;
  String get userID => throw _privateConstructorUsedError; //
  @JsonKey(name: 'saturday_Active')
  bool? get saturdayActive => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  @JsonKey(name: 'saturday_Start')
  TimeOfDay? get saturdayStart => throw _privateConstructorUsedError; //
  @TimeOfDayConverter()
  @JsonKey(name: 'saturday_End')
  TimeOfDay? get saturdayEnd => throw _privateConstructorUsedError;
  @JsonKey(name: 'sunday_Active')
  bool? get sundayActive => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  @JsonKey(name: 'sunday_Start')
  TimeOfDay? get sundayStart => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  @JsonKey(name: 'sunday_End')
  TimeOfDay? get sundayEnd => throw _privateConstructorUsedError; //
  @JsonKey(name: 'monday_Active')
  bool? get mondayActive => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  @JsonKey(name: 'monday_Start')
  TimeOfDay? get mondayStart => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  @JsonKey(name: 'monday_End')
  TimeOfDay? get mondayEnd => throw _privateConstructorUsedError; //
  @JsonKey(name: 'tuesday_Active')
  bool? get tuesdayActive => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  @JsonKey(name: 'tuesday_Start')
  TimeOfDay? get tuesdayStart => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  @JsonKey(name: 'tuesday_End')
  TimeOfDay? get tuesdayEnd => throw _privateConstructorUsedError; //
  @JsonKey(name: 'wednesday_Active')
  bool? get wednesdayActive => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  @JsonKey(name: 'wednesday_Start')
  TimeOfDay? get wednesdayStart => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  @JsonKey(name: 'wednesday_End')
  TimeOfDay? get wednesdayEnd => throw _privateConstructorUsedError; //
  @JsonKey(name: 'thursday_Active')
  bool? get thursdayActive => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  @JsonKey(name: 'thursday_Start')
  TimeOfDay? get thursdayStart => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  @JsonKey(name: 'thursday_End')
  TimeOfDay? get thursdayEnd => throw _privateConstructorUsedError; //
  @JsonKey(name: 'friday_Active')
  bool? get fridayActive => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  @JsonKey(name: 'friday_Start')
  TimeOfDay? get fridayStart => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  @JsonKey(name: 'friday_End')
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
      {String id,
      String userID,
      @JsonKey(name: 'saturday_Active') bool? saturdayActive,
      @TimeOfDayConverter()
      @JsonKey(name: 'saturday_Start')
      TimeOfDay? saturdayStart,
      @TimeOfDayConverter()
      @JsonKey(name: 'saturday_End')
      TimeOfDay? saturdayEnd,
      @JsonKey(name: 'sunday_Active') bool? sundayActive,
      @TimeOfDayConverter()
      @JsonKey(name: 'sunday_Start')
      TimeOfDay? sundayStart,
      @TimeOfDayConverter() @JsonKey(name: 'sunday_End') TimeOfDay? sundayEnd,
      @JsonKey(name: 'monday_Active') bool? mondayActive,
      @TimeOfDayConverter()
      @JsonKey(name: 'monday_Start')
      TimeOfDay? mondayStart,
      @TimeOfDayConverter() @JsonKey(name: 'monday_End') TimeOfDay? mondayEnd,
      @JsonKey(name: 'tuesday_Active') bool? tuesdayActive,
      @TimeOfDayConverter()
      @JsonKey(name: 'tuesday_Start')
      TimeOfDay? tuesdayStart,
      @TimeOfDayConverter() @JsonKey(name: 'tuesday_End') TimeOfDay? tuesdayEnd,
      @JsonKey(name: 'wednesday_Active') bool? wednesdayActive,
      @TimeOfDayConverter()
      @JsonKey(name: 'wednesday_Start')
      TimeOfDay? wednesdayStart,
      @TimeOfDayConverter()
      @JsonKey(name: 'wednesday_End')
      TimeOfDay? wednesdayEnd,
      @JsonKey(name: 'thursday_Active') bool? thursdayActive,
      @TimeOfDayConverter()
      @JsonKey(name: 'thursday_Start')
      TimeOfDay? thursdayStart,
      @TimeOfDayConverter()
      @JsonKey(name: 'thursday_End')
      TimeOfDay? thursdayEnd,
      @JsonKey(name: 'friday_Active') bool? fridayActive,
      @TimeOfDayConverter()
      @JsonKey(name: 'friday_Start')
      TimeOfDay? fridayStart,
      @TimeOfDayConverter() @JsonKey(name: 'friday_End') TimeOfDay? fridayEnd});
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
    Object? id = null,
    Object? userID = null,
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
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
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
      {String id,
      String userID,
      @JsonKey(name: 'saturday_Active') bool? saturdayActive,
      @TimeOfDayConverter()
      @JsonKey(name: 'saturday_Start')
      TimeOfDay? saturdayStart,
      @TimeOfDayConverter()
      @JsonKey(name: 'saturday_End')
      TimeOfDay? saturdayEnd,
      @JsonKey(name: 'sunday_Active') bool? sundayActive,
      @TimeOfDayConverter()
      @JsonKey(name: 'sunday_Start')
      TimeOfDay? sundayStart,
      @TimeOfDayConverter() @JsonKey(name: 'sunday_End') TimeOfDay? sundayEnd,
      @JsonKey(name: 'monday_Active') bool? mondayActive,
      @TimeOfDayConverter()
      @JsonKey(name: 'monday_Start')
      TimeOfDay? mondayStart,
      @TimeOfDayConverter() @JsonKey(name: 'monday_End') TimeOfDay? mondayEnd,
      @JsonKey(name: 'tuesday_Active') bool? tuesdayActive,
      @TimeOfDayConverter()
      @JsonKey(name: 'tuesday_Start')
      TimeOfDay? tuesdayStart,
      @TimeOfDayConverter() @JsonKey(name: 'tuesday_End') TimeOfDay? tuesdayEnd,
      @JsonKey(name: 'wednesday_Active') bool? wednesdayActive,
      @TimeOfDayConverter()
      @JsonKey(name: 'wednesday_Start')
      TimeOfDay? wednesdayStart,
      @TimeOfDayConverter()
      @JsonKey(name: 'wednesday_End')
      TimeOfDay? wednesdayEnd,
      @JsonKey(name: 'thursday_Active') bool? thursdayActive,
      @TimeOfDayConverter()
      @JsonKey(name: 'thursday_Start')
      TimeOfDay? thursdayStart,
      @TimeOfDayConverter()
      @JsonKey(name: 'thursday_End')
      TimeOfDay? thursdayEnd,
      @JsonKey(name: 'friday_Active') bool? fridayActive,
      @TimeOfDayConverter()
      @JsonKey(name: 'friday_Start')
      TimeOfDay? fridayStart,
      @TimeOfDayConverter() @JsonKey(name: 'friday_End') TimeOfDay? fridayEnd});
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
    Object? id = null,
    Object? userID = null,
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
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
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
      {this.id = '',
      this.userID = '',
      @JsonKey(name: 'saturday_Active') this.saturdayActive,
      @TimeOfDayConverter() @JsonKey(name: 'saturday_Start') this.saturdayStart,
      @TimeOfDayConverter() @JsonKey(name: 'saturday_End') this.saturdayEnd,
      @JsonKey(name: 'sunday_Active') this.sundayActive,
      @TimeOfDayConverter() @JsonKey(name: 'sunday_Start') this.sundayStart,
      @TimeOfDayConverter() @JsonKey(name: 'sunday_End') this.sundayEnd,
      @JsonKey(name: 'monday_Active') this.mondayActive,
      @TimeOfDayConverter() @JsonKey(name: 'monday_Start') this.mondayStart,
      @TimeOfDayConverter() @JsonKey(name: 'monday_End') this.mondayEnd,
      @JsonKey(name: 'tuesday_Active') this.tuesdayActive,
      @TimeOfDayConverter() @JsonKey(name: 'tuesday_Start') this.tuesdayStart,
      @TimeOfDayConverter() @JsonKey(name: 'tuesday_End') this.tuesdayEnd,
      @JsonKey(name: 'wednesday_Active') this.wednesdayActive,
      @TimeOfDayConverter()
      @JsonKey(name: 'wednesday_Start')
      this.wednesdayStart,
      @TimeOfDayConverter() @JsonKey(name: 'wednesday_End') this.wednesdayEnd,
      @JsonKey(name: 'thursday_Active') this.thursdayActive,
      @TimeOfDayConverter() @JsonKey(name: 'thursday_Start') this.thursdayStart,
      @TimeOfDayConverter() @JsonKey(name: 'thursday_End') this.thursdayEnd,
      @JsonKey(name: 'friday_Active') this.fridayActive,
      @TimeOfDayConverter() @JsonKey(name: 'friday_Start') this.fridayStart,
      @TimeOfDayConverter() @JsonKey(name: 'friday_End') this.fridayEnd})
      : super._();

  factory _$ScheduleDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleDataImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String userID;
//
  @override
  @JsonKey(name: 'saturday_Active')
  final bool? saturdayActive;
  @override
  @TimeOfDayConverter()
  @JsonKey(name: 'saturday_Start')
  final TimeOfDay? saturdayStart;
//
  @override
  @TimeOfDayConverter()
  @JsonKey(name: 'saturday_End')
  final TimeOfDay? saturdayEnd;
  @override
  @JsonKey(name: 'sunday_Active')
  final bool? sundayActive;
  @override
  @TimeOfDayConverter()
  @JsonKey(name: 'sunday_Start')
  final TimeOfDay? sundayStart;
  @override
  @TimeOfDayConverter()
  @JsonKey(name: 'sunday_End')
  final TimeOfDay? sundayEnd;
//
  @override
  @JsonKey(name: 'monday_Active')
  final bool? mondayActive;
  @override
  @TimeOfDayConverter()
  @JsonKey(name: 'monday_Start')
  final TimeOfDay? mondayStart;
  @override
  @TimeOfDayConverter()
  @JsonKey(name: 'monday_End')
  final TimeOfDay? mondayEnd;
//
  @override
  @JsonKey(name: 'tuesday_Active')
  final bool? tuesdayActive;
  @override
  @TimeOfDayConverter()
  @JsonKey(name: 'tuesday_Start')
  final TimeOfDay? tuesdayStart;
  @override
  @TimeOfDayConverter()
  @JsonKey(name: 'tuesday_End')
  final TimeOfDay? tuesdayEnd;
//
  @override
  @JsonKey(name: 'wednesday_Active')
  final bool? wednesdayActive;
  @override
  @TimeOfDayConverter()
  @JsonKey(name: 'wednesday_Start')
  final TimeOfDay? wednesdayStart;
  @override
  @TimeOfDayConverter()
  @JsonKey(name: 'wednesday_End')
  final TimeOfDay? wednesdayEnd;
//
  @override
  @JsonKey(name: 'thursday_Active')
  final bool? thursdayActive;
  @override
  @TimeOfDayConverter()
  @JsonKey(name: 'thursday_Start')
  final TimeOfDay? thursdayStart;
  @override
  @TimeOfDayConverter()
  @JsonKey(name: 'thursday_End')
  final TimeOfDay? thursdayEnd;
//
  @override
  @JsonKey(name: 'friday_Active')
  final bool? fridayActive;
  @override
  @TimeOfDayConverter()
  @JsonKey(name: 'friday_Start')
  final TimeOfDay? fridayStart;
  @override
  @TimeOfDayConverter()
  @JsonKey(name: 'friday_End')
  final TimeOfDay? fridayEnd;

  @override
  String toString() {
    return 'Schedule(id: $id, userID: $userID, saturdayActive: $saturdayActive, saturdayStart: $saturdayStart, saturdayEnd: $saturdayEnd, sundayActive: $sundayActive, sundayStart: $sundayStart, sundayEnd: $sundayEnd, mondayActive: $mondayActive, mondayStart: $mondayStart, mondayEnd: $mondayEnd, tuesdayActive: $tuesdayActive, tuesdayStart: $tuesdayStart, tuesdayEnd: $tuesdayEnd, wednesdayActive: $wednesdayActive, wednesdayStart: $wednesdayStart, wednesdayEnd: $wednesdayEnd, thursdayActive: $thursdayActive, thursdayStart: $thursdayStart, thursdayEnd: $thursdayEnd, fridayActive: $fridayActive, fridayStart: $fridayStart, fridayEnd: $fridayEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userID, userID) || other.userID == userID) &&
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
        id,
        userID,
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
      {final String id,
      final String userID,
      @JsonKey(name: 'saturday_Active') final bool? saturdayActive,
      @TimeOfDayConverter()
      @JsonKey(name: 'saturday_Start')
      final TimeOfDay? saturdayStart,
      @TimeOfDayConverter()
      @JsonKey(name: 'saturday_End')
      final TimeOfDay? saturdayEnd,
      @JsonKey(name: 'sunday_Active') final bool? sundayActive,
      @TimeOfDayConverter()
      @JsonKey(name: 'sunday_Start')
      final TimeOfDay? sundayStart,
      @TimeOfDayConverter()
      @JsonKey(name: 'sunday_End')
      final TimeOfDay? sundayEnd,
      @JsonKey(name: 'monday_Active') final bool? mondayActive,
      @TimeOfDayConverter()
      @JsonKey(name: 'monday_Start')
      final TimeOfDay? mondayStart,
      @TimeOfDayConverter()
      @JsonKey(name: 'monday_End')
      final TimeOfDay? mondayEnd,
      @JsonKey(name: 'tuesday_Active') final bool? tuesdayActive,
      @TimeOfDayConverter()
      @JsonKey(name: 'tuesday_Start')
      final TimeOfDay? tuesdayStart,
      @TimeOfDayConverter()
      @JsonKey(name: 'tuesday_End')
      final TimeOfDay? tuesdayEnd,
      @JsonKey(name: 'wednesday_Active') final bool? wednesdayActive,
      @TimeOfDayConverter()
      @JsonKey(name: 'wednesday_Start')
      final TimeOfDay? wednesdayStart,
      @TimeOfDayConverter()
      @JsonKey(name: 'wednesday_End')
      final TimeOfDay? wednesdayEnd,
      @JsonKey(name: 'thursday_Active') final bool? thursdayActive,
      @TimeOfDayConverter()
      @JsonKey(name: 'thursday_Start')
      final TimeOfDay? thursdayStart,
      @TimeOfDayConverter()
      @JsonKey(name: 'thursday_End')
      final TimeOfDay? thursdayEnd,
      @JsonKey(name: 'friday_Active') final bool? fridayActive,
      @TimeOfDayConverter()
      @JsonKey(name: 'friday_Start')
      final TimeOfDay? fridayStart,
      @TimeOfDayConverter()
      @JsonKey(name: 'friday_End')
      final TimeOfDay? fridayEnd}) = _$ScheduleDataImpl;
  const ScheduleData._() : super._();

  factory ScheduleData.fromJson(Map<String, dynamic> json) =
      _$ScheduleDataImpl.fromJson;

  @override
  String get id;
  @override
  String get userID;
  @override //
  @JsonKey(name: 'saturday_Active')
  bool? get saturdayActive;
  @override
  @TimeOfDayConverter()
  @JsonKey(name: 'saturday_Start')
  TimeOfDay? get saturdayStart;
  @override //
  @TimeOfDayConverter()
  @JsonKey(name: 'saturday_End')
  TimeOfDay? get saturdayEnd;
  @override
  @JsonKey(name: 'sunday_Active')
  bool? get sundayActive;
  @override
  @TimeOfDayConverter()
  @JsonKey(name: 'sunday_Start')
  TimeOfDay? get sundayStart;
  @override
  @TimeOfDayConverter()
  @JsonKey(name: 'sunday_End')
  TimeOfDay? get sundayEnd;
  @override //
  @JsonKey(name: 'monday_Active')
  bool? get mondayActive;
  @override
  @TimeOfDayConverter()
  @JsonKey(name: 'monday_Start')
  TimeOfDay? get mondayStart;
  @override
  @TimeOfDayConverter()
  @JsonKey(name: 'monday_End')
  TimeOfDay? get mondayEnd;
  @override //
  @JsonKey(name: 'tuesday_Active')
  bool? get tuesdayActive;
  @override
  @TimeOfDayConverter()
  @JsonKey(name: 'tuesday_Start')
  TimeOfDay? get tuesdayStart;
  @override
  @TimeOfDayConverter()
  @JsonKey(name: 'tuesday_End')
  TimeOfDay? get tuesdayEnd;
  @override //
  @JsonKey(name: 'wednesday_Active')
  bool? get wednesdayActive;
  @override
  @TimeOfDayConverter()
  @JsonKey(name: 'wednesday_Start')
  TimeOfDay? get wednesdayStart;
  @override
  @TimeOfDayConverter()
  @JsonKey(name: 'wednesday_End')
  TimeOfDay? get wednesdayEnd;
  @override //
  @JsonKey(name: 'thursday_Active')
  bool? get thursdayActive;
  @override
  @TimeOfDayConverter()
  @JsonKey(name: 'thursday_Start')
  TimeOfDay? get thursdayStart;
  @override
  @TimeOfDayConverter()
  @JsonKey(name: 'thursday_End')
  TimeOfDay? get thursdayEnd;
  @override //
  @JsonKey(name: 'friday_Active')
  bool? get fridayActive;
  @override
  @TimeOfDayConverter()
  @JsonKey(name: 'friday_Start')
  TimeOfDay? get fridayStart;
  @override
  @TimeOfDayConverter()
  @JsonKey(name: 'friday_End')
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

class _$scheduleDayInitImpl extends _scheduleDayInit {
  const _$scheduleDayInitImpl({this.name, this.active, this.start, this.end})
      : super._();

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

abstract class _scheduleDayInit extends ScheduleDay {
  const factory _scheduleDayInit(
      {final WeekDay? name,
      final bool? active,
      final TimeOfDay? start,
      final TimeOfDay? end}) = _$scheduleDayInitImpl;
  const _scheduleDayInit._() : super._();

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
