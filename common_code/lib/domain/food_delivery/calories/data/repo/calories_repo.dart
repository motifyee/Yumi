import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart';
import 'package:common_code/domain/food_delivery/calories/entity/calorie.dart';

abstract class CaloriesRepo {
  TaskEither<Failure, PaginatedData<Calorie>> loadCalories({
    required Pagination pagination,
  });
}
