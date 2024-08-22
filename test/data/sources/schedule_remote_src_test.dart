import 'package:common_code/common_code.dart';
import 'package:common_code/domain/profile/data/sources/remote/profile_remote_src.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart' as ftest;
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:common_code/domain/schedule/data/sources/remote/schedule_remote_source.dart';

import 'testcases.dart';

void main() {
  ftest.TestWidgetsFlutterBinding.ensureInitialized();

  runWhen();

  group('Test All Sources', () {
    for (var testCase in testCases) {
      group('${testCase.src.toString()}: Should return', () {
        test(
            '${testCase.entityType.toString()} when response is 200 and has valid data',
            () async {
          final value = Future.value(
            Response<Map<String, dynamic>>(
              data: testCase.entity ??
                  (
                    testCase.entityType == String
                        ? "string"
                        : (testCase.entityType is List ? [] : {}),
                  ),
              statusCode: 200,
              requestOptions: RequestOptions(),
            ),
          );
          when(() => mockClient.get(testCase.url)).thenAnswer((ans) => value);
          when(() => mockClient.post(testCase.url)).thenAnswer((ans) => value);
          when(() => mockClient.put(testCase.url)).thenAnswer((ans) => value);
          when(() => mockClient.delete(testCase.url))
              .thenAnswer((ans) => value);

          expect(await testCase.call(), isNotNull);
        });
      });

      group('${testCase.src.toString()}: Should throw', () {
        test(
            'a ServerException when DioException\'s response is not 2xx or 304',
            () async {
          when(() => mockClient.get(testCase.url)).thenAnswer(
            (ans) => throw DioException(
              requestOptions: RequestOptions(),
              response: Response(requestOptions: RequestOptions()),
            ),
          );

          expect(
            testCase.call(),
            throwsA(isA<ServerException>()),
          );
        });

        test('a NetworkException when DioException has no response', () async {
          when(() => mockClient.get(testCase.url)).thenAnswer(
            (ans) => throw DioException(
              requestOptions: RequestOptions(),
            ),
          );

          expect(
            testCase.call(),
            throwsA(isA<NetworkException>()),
          );
        });

        test('a TypeError when response is 200 and has invalid data', () async {
          when(() => mockClient.get(testCase.url)).thenAnswer(
            (ans) => Future.value(
              Response(
                data: '',
                statusCode: 200,
                requestOptions: RequestOptions(),
              ),
            ),
          );

          expect(
            testCase.call(),
            throwsA(isA<TypeError>()),
          );
        });
      });
    }
  });
  group('ScheduleSrc', () {
    final mockClient = MockClient();
    final scheduleSrcTest = ScheduleRemoteSrc(client: mockClient);

    group('Should return Schedule', () {
      test('when response is 200 and has valid data', () async {
        when(() => mockClient.get('/accounts/schedule')).thenAnswer(
          (ans) => Future.value(
            Response<Map<String, dynamic>>(
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
      test('a ServerException when DioException\'s response is not 2xx or 304',
          () async {
        when(() => mockClient.get('/accounts/schedule')).thenAnswer(
          (ans) => throw DioException(
            requestOptions: RequestOptions(),
            response: Response(requestOptions: RequestOptions()),
          ),
        );

        expect(
          () => scheduleSrcTest.getMySchedule(),
          throwsA(isA<ServerException>()),
        );
      });

      test('a NetworkException when DioException has no response', () async {
        when(() => mockClient.get('/accounts/schedule')).thenAnswer(
          (ans) => throw DioException(
            requestOptions: RequestOptions(),
          ),
        );

        expect(
          () => scheduleSrcTest.getMySchedule(),
          throwsA(isA<NetworkException>()),
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

  group('ProfileSrc', () {
    final mockClient = MockClient();
    final scheduleSrcTest = ProfileRemoteSrc(client: mockClient);

    group('Should return Profile', () {
      test('when response is 200 and has valid data', () async {
        when(() => mockClient.get('chefs/abc')).thenAnswer(
          (ans) => Future.value(
            Response<Map<String, dynamic>>(
              data: {},
              statusCode: 200,
              requestOptions: RequestOptions(),
            ),
          ),
        );

        final res = await scheduleSrcTest.loadProfile('abc', 'any@email.com');
        expect(res, isNotNull);
      });
    });

    group('Should throw', () {
      test('a ServerException when DioException\'s response is not 2xx or 304',
          () async {
        when(() => mockClient.get('/accounts/schedule')).thenAnswer(
          (ans) => throw DioException(
            requestOptions: RequestOptions(),
            response: Response(requestOptions: RequestOptions()),
          ),
        );

        expect(
          () => scheduleSrcTest.loadProfile('abc', 'any@email.com'),
          throwsA(isA<ServerException>()),
        );
      });

      test('a NetworkException when DioException has no response', () async {
        when(() => mockClient.get('/accounts/schedule')).thenAnswer(
          (ans) => throw DioException(
            requestOptions: RequestOptions(),
          ),
        );

        expect(
          () => scheduleSrcTest.loadProfile('abc', 'any@email.com'),
          throwsA(isA<NetworkException>()),
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
          () => scheduleSrcTest.loadProfile('abc', 'any@email.com'),
          throwsA(isA<TypeError>()),
        );
      });
    });
  });
}
