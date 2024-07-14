import 'package:fpdart/fpdart.dart';
import 'package:common_code/core/failures.dart';
import 'package:yumi/domain/schedule/entities/schedule.dart';

abstract class ScheduleRepo {
  TaskEither<Failure, Schedule> getMySchedule();
  TaskEither<Failure, String> saveMySchedule(Schedule schedule);
}
