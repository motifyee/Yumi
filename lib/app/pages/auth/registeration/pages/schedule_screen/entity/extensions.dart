import 'package:flutter/material.dart';
import 'package:yumi/app/pages/auth/registeration/pages/schedule_screen/entity/schedule.dart';

extension WeekDayX on WeekDay {
  get apprev => name.substring(0, 3).toUpperCase();

  static WeekDay? getWeekDay(String name) =>
      WeekDay.values.firstWhere((e) => e.name == name);
}

extension TimeOfDayX on TimeOfDay {
  get toStringD =>
      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  String get toStringF {
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
      minute: d1.difference(d2).inMinutes - hr * 60,
    );
  }
}

extension DateTimeX on DateTime {
  DateTime setHourMinute(int hour, int minute) => DateTime(
      year, month, day, hour, minute, second, millisecond, microsecond);
}
