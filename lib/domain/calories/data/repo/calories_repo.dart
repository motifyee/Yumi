import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/calories/entity/calories.dart';
import 'package:yumi/statics/pager.dart';

abstract class CaloriesRepo {
  TaskEither<Failure, Pager<Calories>> loadCalories(
      {required Pager<Calories> pager});
}
