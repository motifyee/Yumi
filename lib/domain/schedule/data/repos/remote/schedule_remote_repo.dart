import 'package:fpdart/fpdart.dart';
import 'package:yumi/app/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/schedule/data/repos/schedule_repo.dart';
import 'package:yumi/domain/schedule/data/sources/schedule_sources.dart';
import 'package:yumi/domain/schedule/entities/schedule.dart';

class ScheduleRemoteRepo implements ScheduleRepo {
  final ScheduleSrc scheduleSrc;

  ScheduleRemoteRepo({ScheduleSrc? scheduleSrc})
      : scheduleSrc = scheduleSrc ?? getIt<ScheduleSrc>();

  @override
  TaskEither<Failure, Schedule> getMySchedule() => TaskEither.tryCatch(
        () => scheduleSrc.getMySchedule(),
        (error, stackTrace) => ServerFailure(error, stackTrace),
      );

  @override
  TaskEither<Failure, String> saveMySchedule(Schedule schedule) =>
      TaskEither.tryCatch(
        () => scheduleSrc.saveMySchedule(schedule),
        (error, stackTrace) => ServerFailure(error, stackTrace),
      );
}
