import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:yumi/core/exceptions.dart';
import 'package:yumi/domain/schedule/data/sources/remote/schedule_remote_source.dart';

import 'schedule_remote_src_test.mocks.dart';

// TODO test all the rules of data sources for all data sources in a single test

@GenerateNiceMocks([MockSpec<Dio>()])
void main() {
  group('ScheduleSrc', () {
    final dio = MockDio();
    final scheduleSrcTest = ScheduleRemoteSrc(dio: dio);

    group('Should return Schedule', () {
      test('when response is 200 and has valid data', () async {
        when(dio.get('/accounts/schedule')).thenAnswer(
          (ans) => Future.value(
            Response(
              data: {},
              statusCode: 200,
              requestOptions: RequestOptions(),
            ),
          ),
        );

        final res = await scheduleSrcTest.getMySchedule();
        expect(res, isNotNull);
      });
    });

    group('Should throw', () {
      test('a ServerException when response is not 200', () async {
        when(dio.get('/accounts/schedule')).thenAnswer(
          (ans) => Future.value(
            Response(
              data: null,
              statusCode: 400,
              requestOptions: RequestOptions(),
            ),
          ),
        );

        expect(
          () => scheduleSrcTest.getMySchedule(),
          throwsA(isA<ServerException>()),
        );
      });

      test('a TypeError when response is 200 and has invalid data', () async {
        when(dio.get('/accounts/schedule')).thenAnswer(
          (ans) => Future.value(
            Response(
              data: '',
              statusCode: 200,
              requestOptions: RequestOptions(),
            ),
          ),
        );

        expect(
          () => scheduleSrcTest.getMySchedule(),
          throwsA(isA<TypeError>()),
        );
      });
    });
  });
}
