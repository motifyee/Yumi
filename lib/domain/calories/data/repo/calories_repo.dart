import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/calories/entity/calories.dart';
import 'package:yumi/statics/paginatedData.dart';

abstract class CaloriesRepo {
  TaskEither<Failure, PaginatedData<Calories>> loadCalories(
      {required PaginatedData<Calories> pagination});
}
