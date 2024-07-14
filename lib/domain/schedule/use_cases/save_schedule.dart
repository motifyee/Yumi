import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart';
import 'package:yumi/domain/schedule/data/repos/schedule_repo.dart';
import 'package:yumi/domain/schedule/entities/schedule.dart';

class SaveSchedule extends UseCase<String, ScheduleParam> {
  SaveSchedule(this.repo);

  final ScheduleRepo repo;

  @override
  Future<Either<Failure, String>> call(params) =>
      repo.saveMySchedule(params.schedule).run();
}

class ScheduleParam extends Params {
  final Schedule schedule;

  ScheduleParam(this.schedule);

  @override
  List<Object?> get props => [schedule];
}
