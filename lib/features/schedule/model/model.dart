// ignore_for_file: invalid_annotation_target

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/features/schedule/model/converters.dart';
import 'package:yumi/features/schedule/model/extensions.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
class Schedule with _$Schedule {
  const factory Schedule({
    @Default('') String id,
    @Default('') String userID,
    //
    @JsonKey(name: 'saturday_Active') bool? saturdayActive,
    @TimeOfDayConverter()
    @JsonKey(name: 'saturday_Start')
    TimeOfDay? saturdayStart,
    //
    @TimeOfDayConverter() @JsonKey(name: 'saturday_End') TimeOfDay? saturdayEnd,
    @JsonKey(name: 'sunday_Active') bool? sundayActive,
    @TimeOfDayConverter() @JsonKey(name: 'sunday_Start') TimeOfDay? sundayStart,
    @TimeOfDayConverter() @JsonKey(name: 'sunday_End') TimeOfDay? sundayEnd,
    //
    @JsonKey(name: 'monday_Active') bool? mondayActive,
    @TimeOfDayConverter() @JsonKey(name: 'monday_Start') TimeOfDay? mondayStart,
    @TimeOfDayConverter() @JsonKey(name: 'monday_End') TimeOfDay? mondayEnd,
    //
    @JsonKey(name: 'tuesday_Active') bool? tuesdayActive,
    @TimeOfDayConverter()
    @JsonKey(name: 'tuesday_Start')
    TimeOfDay? tuesdayStart,
    @TimeOfDayConverter() @JsonKey(name: 'tuesday_End') TimeOfDay? tuesdayEnd,
    //
    @JsonKey(name: 'wednesday_Active') bool? wednesdayActive,
    @TimeOfDayConverter()
    @JsonKey(name: 'wednesday_Start')
    TimeOfDay? wednesdayStart,
    @TimeOfDayConverter()
    @JsonKey(name: 'wednesday_End')
    TimeOfDay? wednesdayEnd,
    //
    @JsonKey(name: 'thursday_Active') bool? thursdayActive,
    @TimeOfDayConverter()
    @JsonKey(name: 'thursday_Start')
    TimeOfDay? thursdayStart,
    @TimeOfDayConverter() @JsonKey(name: 'thursday_End') TimeOfDay? thursdayEnd,
    //
    @JsonKey(name: 'friday_Active') bool? fridayActive,
    @TimeOfDayConverter() @JsonKey(name: 'friday_Start') TimeOfDay? fridayStart,
    @TimeOfDayConverter() @JsonKey(name: 'friday_End') TimeOfDay? fridayEnd,
  }) = ScheduleData;

  const Schedule._();

  ScheduleDay scheduleDay(WeekDay day, [dynamic json]) {
    dynamic json0 = json ?? toJson();

    return ScheduleDay(
      name: day,
      active: json0['${day.name}_Active'],
      start: (json0['${day.name}_Start'] as String?)?.toTimeOfDay,
      end: (json0['${day.name}_End'] as String?)?.toTimeOfDay,
    );
  }

  List<ScheduleDay> get scheduleDays {
    var json = toJson();

    return WeekDay.values.map((day) => scheduleDay(day, json)).toList();
  }

  bool get uiValid =>
      scheduleDays.every((day) => day.uiValid) &&
      scheduleDays.any((day) => day.active ?? false);

  bool isDifferent(Schedule schedule) => this == schedule;

  copyWithScheduleDay(ScheduleDay scheduleDay) {
    var json = toJson();

    String day = scheduleDay.name?.name ?? '';
    if (day.isEmpty) return this;

    json['${day}_Active'] = scheduleDay.active;
    json['${day}_Start'] = scheduleDay.start?.toStringF;
    json['${day}_End'] = scheduleDay.end?.toStringF;

    return Schedule.fromJson(json);
  }

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
}

@freezed
class ScheduleDay with _$ScheduleDay {
  const factory ScheduleDay({
    WeekDay? name,
    bool? active,
    TimeOfDay? start,
    TimeOfDay? end,
  }) = _scheduleDayInit;

  const ScheduleDay._();

  TimeOfDay? get activeTime => end?.difference(start);
  bool get valid => (activeTime?.hour ?? 0) >= 2;
  bool get uiValid => !((active ?? false) && !valid);
}

enum WeekDay {
  @JsonValue('sunday')
  sunday,
  @JsonValue('monday')
  monday,
  @JsonValue('tuesday')
  tuesday,
  @JsonValue('wednesday')
  wednesday,
  @JsonValue('thursday')
  thursday,
  @JsonValue('friday')
  friday,
  @JsonValue('saturday')
  saturday,
}



// class ScheduleRepository {
//   final FirebaseFirestore _firestore;
//   final FirebaseAuth _auth;

//   ScheduleRepository(this._firestore, this._auth);

//   Future<Schedule?> getSchedule() async {
//     final user = _auth.currentUser;
//     if (user == null) {
//       return null;
//     }

//     final snapshot =
//         await _firestore.collection('schedules').doc(user.uid).get();

//     if (snapshot.exists) {
//       return Schedule.fromJson(snapshot.data()!);
//     }

//     return null;
//   }

//   Future<void> setSchedule(Schedule schedule) async {
//     final user = _auth.currentUser;
//     if (user == null) {
//       return;
//     }

//     await _firestore
//         .collection('schedules')
//         .doc(user.uid)
//         .set(schedule.toJson());
//   }
// }
