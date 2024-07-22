import 'package:common_code/common_code.dart';
import 'package:fpdart/src/either.dart';
import 'package:yumi/domain/meal/data/repo/meal_repo.dart';
import 'package:yumi/domain/meal/entity/meal.dart';

class CreateMeal extends UseCase<String, CreateMealParams> {
  final MealRepo mealRepo;

  CreateMeal({MealRepo? mealRepo}) : mealRepo = mealRepo ?? getIt<MealRepo>();
  @override
  Future<Either<Failure, String>> call(CreateMealParams params) {
    return mealRepo.createMeal(meal: params.meal).run();
  }
}

class CreateMealParams extends Params {
  final Meal meal;

  CreateMealParams({required this.meal});

  @override
  List<Object?> get props => [meal];
}
