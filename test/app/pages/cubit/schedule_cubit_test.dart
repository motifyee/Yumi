import 'package:bloc_test/bloc_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:yumi/app/pages/auth/registeration/pages/schedule_screen/cubit/schedule_cubit.dart';
import 'package:common_code/common_code.dart';
import 'package:yumi/domain/schedule/data/repos/remote/schedule_remote_repo.dart';
import 'package:yumi/domain/schedule/use_cases/load_schedule.dart';

class MockScheduleRemoteRepo extends Mock implements ScheduleRemoteRepo {}

class MockLoadSchedule extends Mock implements LoadSchedule {}

void main() {
  final mockScheduleRemoteRepo = MockScheduleRemoteRepo();
  final mockLoadSchedule = MockLoadSchedule();

  group('ScheduleCubit', () {
    group('should emit', () {
      blocTest(
        'nothing',
        build: () => ScheduleCubit(repo: mockScheduleRemoteRepo),
        expect: () => const <ScheduleState>[],
      );
      blocTest(
        '(status: Status.error) when LoadSchedule emits ServerFailure',
        setUp: () {
          when(() => mockLoadSchedule.call(NoParams())).thenAnswer(
            (_) => Future.value(Left(ServerFailure())),
          );

          when(() => mockScheduleRemoteRepo.getMySchedule())
              .thenAnswer((_) => TaskEither.fromEither(Left(ServerFailure())));
        },
        build: () => ScheduleCubit(repo: mockScheduleRemoteRepo),
        act: (cubit) => cubit.loadSchedule(),
        expect: () => const <ScheduleState>[
          ScheduleState(status: Status.loading),
          ScheduleState(status: Status.error),
        ],
      );
    });
  });
}
