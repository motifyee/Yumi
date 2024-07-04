import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:yumi/core/exceptions.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/schedule/data/repos/remote/schedule_remote_repo.dart';
import 'package:yumi/domain/schedule/data/sources/remote/schedule_remote_source.dart';
import 'package:yumi/domain/schedule/entities/schedule.dart';

import 'schedule_remote_repo_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ScheduleRemoteSrc>()])
void main() {
  final mockScheduleRemoteSrc = MockScheduleRemoteSrc();
  final scheduleRepoTest = ScheduleRemoteRepo(src: mockScheduleRemoteSrc);

  group('ScheduleRemoteRepo', () {
    group('Should return schedule entity', () {
      test('when scheduleRemoteSrc returns a schedule entity', () async {
        when(mockScheduleRemoteSrc.getMySchedule())
            .thenAnswer((_) => Future.value(const Schedule()));

        final result = await scheduleRepoTest.getMySchedule().run();

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, const Right<Failure, Schedule>(Schedule()));

        verify(mockScheduleRemoteSrc.getMySchedule()).called(1);
        verifyNoMoreInteractions(mockScheduleRemoteSrc);
      });
    });

    group('Should return left with', () {
      test('a ServerFailure when as ServerException occurs', () async {
        when(mockScheduleRemoteSrc.getMySchedule())
            .thenThrow(ServerException('test'));

        final result = await scheduleRepoTest.getMySchedule().run();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, Schedule>(ServerFailure('test')));
      });
    });
  });
}
