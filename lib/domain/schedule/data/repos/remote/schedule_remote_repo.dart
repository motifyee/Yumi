import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:yumi/domain/schedule/data/repos/schedule_repo.dart';
import 'package:yumi/domain/schedule/data/sources/schedule_sources.dart';
import 'package:yumi/domain/schedule/entities/schedule.dart';

class ScheduleRemoteRepo implements ScheduleRepo {
  final ScheduleSrc src;

  ScheduleRemoteRepo({ScheduleSrc? src}) : src = src ?? getIt<ScheduleSrc>();

  @override
  TaskEither<Failure, Schedule> getMySchedule() => TaskEither.tryCatch(
        () => src.getMySchedule(),
        (error, stackTrace) => ServerFailure(error.toString()),
      );

  @override
  TaskEither<Failure, String> saveMySchedule(Schedule schedule) =>
      TaskEither.tryCatch(
        () => src.saveMySchedule(schedule),
        (error, stackTrace) => ServerFailure(error.toString()),
      );
}
