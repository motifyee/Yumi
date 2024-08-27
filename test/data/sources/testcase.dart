import 'package:common_code/common_code.dart';
import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements APIClient {}

class MockEndpoints extends Mock implements Endpoints {}

abstract class Functions {
  String getAPI(String api);
  Endpoints endpoints = Endpoints();
}

class MockFunctions extends Mock implements Functions {}

final mockClient = MockClient();
final mockEndpoints = MockEndpoints();

class TestCaseSrc {
  String title;
  Function? whens;
  List<TestCase> testCases;
  TestCaseSrc({
    required this.title,
    this.whens,
    required this.testCases,
  });
}

class TestCase {
  String title;
  Type entityType;
  dynamic entity;
  Future Function() call;
  TestCase({
    required this.title,
    required this.entityType,
    this.entity,
    required this.call,
  });
}
