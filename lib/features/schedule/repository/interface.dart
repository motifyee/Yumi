import 'package:yumi/features/schedule/model/model.dart';

abstract class IScheduleRepo {
  Future<Schedule> getSchedule();
  Future<String> saveSchedule(Schedule schedule);
}
