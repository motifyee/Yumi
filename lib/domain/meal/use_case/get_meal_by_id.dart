import 'package:common_code/common_code.dart';
import 'package:fpdart/src/either.dart';
import 'package:yumi/domain/meal/data/repo/meal_repo.dart';
import 'package:yumi/domain/meal/entity/meal.dart';

class GetMealById extends UseCase<Meal, GetMealByIdParams> {
  final MealRepo mealRepo;

  GetMealById({MealRepo? mealRepo}) : mealRepo = mealRepo ?? getIt<MealRepo>();

  @override
  Future<Either<Failure, Meal>> call(GetMealByIdParams params) {
    return mealRepo.getMealById(mealId: params.mealId).run();
  }
}

class GetMealByIdParams extends Params {
  final int mealId;

  GetMealByIdParams({required this.mealId});

  @override
  List<Object?> get props => [mealId];
}
