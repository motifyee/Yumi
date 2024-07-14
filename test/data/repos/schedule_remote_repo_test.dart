import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:common_code/common_code.dart';
import 'package:yumi/domain/schedule/data/repos/remote/schedule_remote_repo.dart';
import 'package:yumi/domain/schedule/data/sources/remote/schedule_remote_source.dart';
import 'package:yumi/domain/schedule/entities/schedule.dart';

class MockScheduleRemoteSrc extends Mock implements ScheduleRemoteSrc {}

void main() {
  final mockScheduleRemoteSrc = MockScheduleRemoteSrc();
  final scheduleRepoTest = ScheduleRemoteRepo(src: mockScheduleRemoteSrc);

  group('ScheduleRemoteRepo', () {
    group('should return schedule entity', () {
      test('when scheduleRemoteSrc returns a schedule entity', () async {
        when(() => mockScheduleRemoteSrc.getMySchedule())
            .thenAnswer((_) => Future.value(const Schedule()));

        final result = await scheduleRepoTest.getMySchedule().run();

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, const Right<Failure, Schedule>(Schedule()));

        verify(() => mockScheduleRemoteSrc.getMySchedule()).called(1);
        verifyNoMoreInteractions(mockScheduleRemoteSrc);
      });
    });

    group('should return left with', () {
      test('a ServerFailure when as ServerException occurs', () async {
        when(() => mockScheduleRemoteSrc.getMySchedule()).thenThrow(
          ServerException(
            DioException(
              requestOptions: RequestOptions(),
              response: Response(
                data: {'message': 'test'},
                requestOptions: RequestOptions(),
              ),
            ),
          ),
        );

        final result = await scheduleRepoTest.getMySchedule().run();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, Schedule>(ServerFailure('test')));
      });
    });
  });
}
