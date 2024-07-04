import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/schedule/data/repos/remote/schedule_remote_repo.dart';
import 'package:yumi/domain/schedule/entities/schedule.dart';
import 'package:yumi/domain/schedule/use_cases/load_schedule.dart';

import 'schedule_usecases_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ScheduleRemoteRepo>()])
void main() {
  final mockScheduleRemoteRepo = MockScheduleRemoteRepo();

  group('LoadSchedule', () {
    // provide dummy replaces when in this case
    provideDummy<TaskEither<Failure, Schedule>>(
      TaskEither.fromEither(const Right(Schedule(id: 'test'))),
    );

    final loadscheduleTest = LoadSchedule(mockScheduleRemoteRepo);
    test('when ScheduleRemoteRepo returns a Schedule', () async {
      // when(mockScheduleRemoteRepo.getMySchedule()).thenAnswer(
      //     (ans) => TaskEither.fromEither(const Right(Schedule(id: 'test'))));

      final result = await loadscheduleTest.call(NoParams());

      expect(result.isLeft(), false);
      expect(result.isRight(), true);
      expect(result, const Right<Failure, Schedule>(Schedule(id: 'test')));

      verify(mockScheduleRemoteRepo.getMySchedule()).called(1);
      verifyNoMoreInteractions(mockScheduleRemoteRepo);
    });
  });
}
