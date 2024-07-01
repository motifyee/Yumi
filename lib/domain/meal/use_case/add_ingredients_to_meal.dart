import 'package:fpdart/src/either.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/meal/entity/ingredients.dart';
import 'package:yumi/domain/meal/entity/meal.dart';

class AddIngredientsToMeal extends UseCase<Meal, AddIngredientsToMealParams> {
  @override
  Future<Either<Failure, Meal>> call(AddIngredientsToMealParams params) async {
    return Right(params.meal.copyWith(ingredients: params.ingredients));
  }
}

class AddIngredientsToMealParams extends Params {
  final List<Ingredients> ingredients;
  final Meal meal;

  AddIngredientsToMealParams({required this.ingredients, required this.meal});

  @override
  List<Object?> get props => [ingredients, meal];
}