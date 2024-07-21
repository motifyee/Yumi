import 'package:fpdart/fpdart.dart';
import 'package:common_code/core/failures.dart';
import 'package:common_code/domain/schedule/entities/schedule.dart';

abstract class ScheduleRepo {
  TaskEither<Failure, Schedule> getMySchedule();
  TaskEither<Failure, String> saveMySchedule(Schedule schedule);
}
