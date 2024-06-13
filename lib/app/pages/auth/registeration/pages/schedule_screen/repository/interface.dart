import 'package:flutter/cupertino.dart';
import 'package:yumi/app/pages/auth/registeration/pages/schedule_screen/entity/schedule.dart';

abstract class IScheduleRepo {
  Future<Schedule> getMySchedule(BuildContext? ctx);
  Future<String> saveMySchedule(BuildContext? ctx, Schedule schedule);
}
