import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/calories/entity/calories.dart';
import 'package:yumi/statics/pagination.dart';

abstract class CaloriesRepo {
  TaskEither<Failure, Pagination<Calories>> loadCalories(
      {required Pagination<Calories> pagination});
}
