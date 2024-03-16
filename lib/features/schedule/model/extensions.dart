import 'package:flutter/material.dart';
import 'package:yumi/features/schedule/model/model.dart';

extension WeekDayX on WeekDay {
  get apprev => name.substring(0, 3).toUpperCase();

  static WeekDay? getWeekDay(String name) =>
      WeekDay.values.firstWhere((e) => e.name == name);
}

extension StringX on String {
  get toTimeOfDay => TimeOfDay(
      hour: int.parse(split(":")[0]), minute: int.parse(split(":")[1]));
}

extension TimeOfDayX on TimeOfDay {
  get toStringF => '$hour:$minute';
}
