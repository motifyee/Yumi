import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/calories/entity/calories.dart';
import 'package:yumi/statics/pagination_helper.dart';

abstract class CaloriesRepo {
  TaskEither<Failure, PaginationHelper<Calories>> loadCalories(
      {required PaginationHelper<Calories> paginationHelper});
}
