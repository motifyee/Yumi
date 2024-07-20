import 'package:common_code/core/failures.dart';
import 'package:common_code/core/use_cases.dart';
import 'package:fpdart/fpdart.dart';
import 'package:common_code/domain/food_delivery/ingredients/entities/ingredient.dart';
import 'package:common_code/domain/food_delivery/meal/entities/meal.dart';

class AddIngredientsToMeal extends UseCase<Meal, AddIngredientsToMealParams> {
  @override
  Future<Either<Failure, Meal>> call(AddIngredientsToMealParams params) async {
    return Right(params.meal.copyWith(ingredients: params.ingredients));
  }
}

class AddIngredientsToMealParams extends Params {
  final List<Ingredient> ingredients;
  final Meal meal;

  AddIngredientsToMealParams({required this.ingredients, required this.meal});

  @override
  List<Object?> get props => [ingredients, meal];
}
