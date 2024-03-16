import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/features/schedule/model/extensions.dart';

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

    return object.toStringF;
  }
}
