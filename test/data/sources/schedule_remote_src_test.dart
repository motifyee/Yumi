import 'package:common_code/common_code.dart';
import 'package:dependencies/dependencies.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:common_code/domain/schedule/data/sources/remote/schedule_remote_source.dart';

// TODO test all the rules of data sources for all data sources in a single test

class MockClient extends Mock implements APIClient {}

void main() {
  group('ScheduleSrc', () {
    final mockClient = MockClient();
    final scheduleSrcTest = ScheduleRemoteSrc(client: mockClient);

    group('Should return Schedule', () {
      test('when response is 200 and has valid data', () async {
        when(() => mockClient.get('/accounts/schedule')).thenAnswer(
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
        when(() => mockClient.get('/accounts/schedule')).thenAnswer(
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
        when(() => mockClient.get('/accounts/schedule')).thenAnswer(
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
