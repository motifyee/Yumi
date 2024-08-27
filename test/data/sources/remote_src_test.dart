import 'package:common_code/common_code.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart' as ftest;
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'bankinfo_src_testcases.dart';
import 'profile_src_testcases.dart';
import 'schedule_src_testcases.dart';
import 'testcase.dart';

void main() {
  ftest.TestWidgetsFlutterBinding.ensureInitialized();
  get() =>
      mockClient.get(any(), queryParameters: any(named: 'queryParameters'));
  post() => mockClient.post(
        any(),
        queryParameters: any(named: 'queryParameters'),
        data: any(named: 'data'),
      );
  put() => mockClient.put(
        any(),
        queryParameters: any(named: 'queryParameters'),
        data: any(named: 'data'),
      );
  delete() =>
      mockClient.delete(any(), queryParameters: any(named: 'queryParameters'));

  final testCases = [
    profileTestSrc,
    scheduleTestSrc,
    bankinfoTestSrc,
  ];

  for (var source in testCases) {
    if (source.whens != null) source.whens!();
    group('Test ${source.title}', () {
      for (var testCase in source.testCases) {
        group('${testCase.title}: Should return', () {
          test(
              '${testCase.entityType.toString()} when response is 200 and has valid data',
              () async {
            Object? data = testCase.entity;
            if (data == null) {
              if (testCase.entityType == String) {
                data = "string";
              } else if (testCase.entityType == String) {
                data = [];
              } else {
                data = <String, dynamic>{};
              }
            }

            final value = Future.value(
              Response(
                data: data,
                statusCode: 200,
                requestOptions: RequestOptions(),
              ),
            );
            when(get).thenAnswer((ans) => value);
            when(post).thenAnswer((ans) => value);
            when(put).thenAnswer((ans) => value);
            when(delete).thenAnswer((ans) => value);

            expect(await testCase.call(), isNotNull);
          });
        });

        group('${testCase.title}: Should throw', () {
          test(
              'a ServerException when DioException\'s response is not 2xx or 304',
              () async {
            final exception = DioException(
              requestOptions: RequestOptions(),
              response: Response(requestOptions: RequestOptions()),
            );
            when(get).thenThrow(exception);
            when(post).thenThrow(exception);
            when(put).thenThrow(exception);
            when(delete).thenThrow(exception);

            expect(
              testCase.call(),
              throwsA(isA<ServerException>()),
            );
          });

          test('a NetworkException when DioException has no response',
              () async {
            final exception = DioException(requestOptions: RequestOptions());
            when(get).thenThrow(exception);
            when(post).thenThrow(exception);
            when(put).thenThrow(exception);
            when(delete).thenThrow(exception);

            expect(
              testCase.call(),
              throwsA(isA<NetworkException>()),
            );
          });

          test('a GenericException when response is 200 and has invalid data',
              () async {
            final value = Future.value(
              Response(
                data: 123,
                statusCode: 200,
                requestOptions: RequestOptions(),
              ),
            );
            reset(mockClient);
            when(get).thenAnswer((ans) => value);
            when(post).thenAnswer((ans) => value);
            when(put).thenAnswer((ans) => value);
            when(delete).thenAnswer((ans) => value);

            expect(
              testCase.call(),
              throwsA(isA<GenericException>()),
            );
          });
        });
      }
    });
  }
}
