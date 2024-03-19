import 'package:flutter/material.dart';
import 'package:yumi/features/schedule/model/model.dart';
import 'package:yumi/features/schedule/repository/interface.dart';

class ScheduleMockRepo implements IScheduleRepo {
  @override
  Future<Schedule> getMySchedule(BuildContext? ctx) {
    return Future.delayed(
        const Duration(seconds: 1),
        () => Schedule(
              id: '',
              userID: '',
              saturdayActive: true,
              saturdayStart: TimeOfDay.now(),
              saturdayEnd: TimeOfDay.now(),
              sundayActive: true,
              sundayStart: TimeOfDay.now(),
              sundayEnd: TimeOfDay.now(),
              mondayActive: true,
              mondayStart: TimeOfDay.now(),
              mondayEnd: TimeOfDay.now(),
            ));
  }

  @override
  Future<String> saveMySchedule(BuildContext? ctx, Schedule schedule) {
    // TODO: implement saveSchedule
    throw UnimplementedError();
  }
}
