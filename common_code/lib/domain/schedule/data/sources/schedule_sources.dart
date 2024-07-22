import 'package:common_code/domain/schedule/entities/schedule.dart';

abstract class ScheduleSrc {
  Future<Schedule> getMySchedule();
  Future<String> saveMySchedule(Schedule schedule);
}
