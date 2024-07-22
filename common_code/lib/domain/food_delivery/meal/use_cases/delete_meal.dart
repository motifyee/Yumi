import 'package:common_code/common_code.dart';
import 'package:common_code/domain/food_delivery/meal/data/repo/meal_repo.dart';
import 'package:fpdart/src/either.dart';

class DeleteMeal extends UseCase<Meal, DeleteMealParams> {
  final MealRepo mealRepo;

  DeleteMeal({MealRepo? mealRepo}) : mealRepo = mealRepo ?? getIt<MealRepo>();
  @override
  Future<Either<Failure, Meal>> call(DeleteMealParams params) {
    return mealRepo.deleteMeal(meal: params.meal).run();
  }
}

class DeleteMealParams extends Params {
  final Meal meal;

  DeleteMealParams({required this.meal});

  @override
  List<Object?> get props => [meal];
}
