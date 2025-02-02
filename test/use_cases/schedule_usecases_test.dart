import 'package:dependencies/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:common_code/core/failures.dart';
import 'package:common_code/core/use_cases.dart';
import 'package:common_code/domain/schedule/data/repos/remote/schedule_remote_repo.dart';
import 'package:common_code/domain/schedule/entities/schedule.dart';
import 'package:common_code/domain/schedule/use_cases/load_schedule.dart';

class MockScheduleRemoteRepo extends Mock implements ScheduleRemoteRepo {}

void main() {
  final mockScheduleRemoteRepo = MockScheduleRemoteRepo();

  group('LoadSchedule', () {
    final loadscheduleTest = LoadSchedule(mockScheduleRemoteRepo);
    test('when ScheduleRemoteRepo returns a Schedule', () async {
      when(() => mockScheduleRemoteRepo.getMySchedule()).thenAnswer(
        (ans) => TaskEither.fromEither(const Right(Schedule(id: 'test'))),
      );

      final result = await loadscheduleTest.call(NoParams());

      expect(result.isLeft(), false);
      expect(result.isRight(), true);
      expect(result, const Right<Failure, Schedule>(Schedule(id: 'test')));

      verify(() => mockScheduleRemoteRepo.getMySchedule()).called(1);
      verifyNoMoreInteractions(mockScheduleRemoteRepo);
    });
  });
}
