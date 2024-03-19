import 'package:flutter/cupertino.dart';
import 'package:yumi/features/schedule/model/model.dart';

abstract class IScheduleRepo {
  Future<Schedule> getMySchedule(BuildContext? ctx);
  Future<String> saveMySchedule(BuildContext? ctx, Schedule schedule);
}
