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
    @TimeOfDayConverter() TimeOfDay? fridayEnd,
  }) = ScheduleData;

  const Schedule._();

  ScheduleDay scheduleDay(WeekDay day, [dynamic json]) {
    dynamic json0 = json ?? toJson();

    return ScheduleDay(
      name: day,
      active: json0['${day.name}Active'],
      start: (json0['${day.name}Start'] as String?)?.toTimeOfDay,
      end: (json0['${day.name}End'] as String?)?.toTimeOfDay,
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

    json['${day}Active'] = scheduleDay.active;
    json['${day}Start'] = scheduleDay.start?.toStringF;
    json['${day}End'] = scheduleDay.end?.toStringF;

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
