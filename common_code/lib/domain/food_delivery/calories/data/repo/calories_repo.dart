import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart';

abstract class CaloriesRepo {
  TaskEither<Failure, PaginatedData<Calorie>> loadCalories({
    required Pagination pagination,
  });
}
