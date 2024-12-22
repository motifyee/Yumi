import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/food_delivery/calories/data/repo/calories_repo.dart';
import 'package:common_code/domain/food_delivery/calories/data/source/calories_source.dart';

class CaloriesRepoRemote implements CaloriesRepo {
  final CaloriesSource caloriesSource;

  CaloriesRepoRemote({CaloriesSource? caloriesSource})
      : caloriesSource = caloriesSource ?? getIt<CaloriesSource>();

  @override
  TaskEither<Failure, PaginatedData<Calorie>> loadCalories({
    required Pagination pagination,
  }) =>
      TaskEither.tryCatch(
          () => caloriesSource.loadCalories(pagination: pagination),
          (error, stackTrace) => ServerFailure(error.toString()));
}
