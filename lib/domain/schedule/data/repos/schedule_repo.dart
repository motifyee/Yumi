import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/schedule/entities/schedule.dart';

abstract class ScheduleRepo {
  TaskEither<Failure, Schedule> getMySchedule();
  TaskEither<Failure, String> saveMySchedule(Schedule schedule);
}
