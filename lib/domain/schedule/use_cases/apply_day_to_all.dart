import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/schedule/entities/schedule.dart';

class ApplyDayToAll extends UseCase<Schedule, ApplyDayToAllParams> {
  @override
  Future<Either<Failure, Schedule>> call(params) async {
    var schedule = params.schedule;

    for (final day in params.schedule.activeDays) {
      schedule = schedule.copyWithScheduleDay(
        day.copyWith(
          start: params.day.start,
          end: params.day.end,
        ),
      );
    }

    return Right(schedule);
  }
}

class ApplyDayToAllParams extends Params {
  final ScheduleDay day;
  final Schedule schedule;

  ApplyDayToAllParams(this.day, this.schedule);

  @override
  List<Object?> get props => [day, schedule];
}
