import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/schedule/data/repos/schedule_repo.dart';
import 'package:yumi/domain/schedule/entities/schedule.dart';

class LoadSchedule extends UseCase<Schedule, NoParams> {
  LoadSchedule(this.repo);

  final ScheduleRepo repo;

  @override
  Future<Either<Failure, Schedule>> call(params) => repo.getMySchedule().run();
}
