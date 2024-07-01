import 'package:equatable/equatable.dart';

abstract class TestCase<TestParams> {
  unitTest({required TestParams params}) {}

  widgetTest({required TestParams params}) {}

  integrationTest({required TestParams params}) {}
}

abstract class TestParams extends Equatable {}
