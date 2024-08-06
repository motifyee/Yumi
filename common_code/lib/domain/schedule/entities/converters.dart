import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';
import 'package:common_code/domain/schedule/entities/extensions.dart';

class TimeOfDayConverter extends JsonConverter<TimeOfDay?, String?> {
  const TimeOfDayConverter();

  @override
  TimeOfDay? fromJson(String? json) {
    if (json == null) return null;

    return json.toTimeOfDay;
  }

  @override
  String? toJson(TimeOfDay? object) {
    if (object == null) return null;

    return object.toFormattedString;
  }
}
