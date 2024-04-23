import 'package:flutter/cupertino.dart';
import 'package:yumi/app/pages/schedule/model/model.dart';

abstract class IScheduleRepo {
  Future<Schedule> getMySchedule(BuildContext? ctx);
  Future<String> saveMySchedule(BuildContext? ctx, Schedule schedule);
}
