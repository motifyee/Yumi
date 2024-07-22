import 'package:flutter/material.dart';

extension StringX on String {
  String capitalize() {
    return isEmpty
        ? ''
        : "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  DateTime get toDateTime => DateTime.parse(this);

  TimeOfDay get toTimeOfDay => TimeOfDay(
        hour: toDateTime.hour,
        minute: toDateTime.minute,
        // hour: int.parse(split(":")[0]), minute: int.parse(split(":")[1])
      );

  String onEmpty(String value) {
    return isEmpty ? value : this;
  }

  double toDouble() {
    return double.tryParse(this) ?? 0.0;
  }

  int toInt() {
    return int.tryParse(this) ?? 0;
  }
}
