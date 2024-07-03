import 'package:flutter/material.dart';
import 'package:yumi/domain/schedule/entities/schedule.dart';

extension WeekDayX on WeekDay {
  String get apprev => name.substring(0, 3).toUpperCase();

  static WeekDay? getWeekDay(String name) =>
      WeekDay.values.firstWhere((e) => e.name == name);
}

extension TimeOfDayX on TimeOfDay {
  String get toPaddedString {
    final hr = hour.toString();
    final min = minute.toString();

    return '${hr.padLeft((hour < 0) ? 3 : 2, '0')}:${min.padLeft(2, '0')}';
  }

  String get toFormattedString {
    var d = DateTime.now().setHourMinute(hour, minute);

    return d.toString().replaceAll(' ', 'T').split('.')[0];
  }

  TimeOfDay? difference(TimeOfDay? other) {
    if (other == null) return null;

    var d0 = DateTime.now();
    var d1 = d0.setHourMinute(hour, minute);
    var d2 = d0.setHourMinute(other.hour, other.minute);

    var hr = d1.difference(d2).inHours;
    return TimeOfDay(
      hour: hr,
      minute: (d1.difference(d2).inMinutes - hr * 60).abs(),
    );
  }

  int minutesDifference(TimeOfDay? other) {
    if (other == null) return hour * 60 + minute;

    return (hour * 60 + minute) - (other.hour * 60 + other.minute);
  }

  bool operator >(TimeOfDay other) => minutesDifference(other) > 0;
  bool operator <(TimeOfDay other) => minutesDifference(other) < 0;
  bool operator >=(TimeOfDay other) => minutesDifference(other) >= 0;
  bool operator <=(TimeOfDay other) => minutesDifference(other) <= 0;
}

extension DateTimeX on DateTime {
  DateTime setHourMinute(int hour, int minute) => DateTime(
      year, month, day, hour, minute, second, millisecond, microsecond);
}
