import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/meal/entity/meal.dart';
import 'package:yumi/statics/pagination.dart';

abstract class MealRepo {
  TaskEither<Failure, String> createMeal({required Meal meal});
  TaskEither<Failure, String> updateMeal({required Meal meal});
  TaskEither<Failure, Meal> deleteMeal({required Meal meal});
  TaskEither<Failure, Meal> getMealById({required int mealId});
  TaskEither<Failure, Pagination<Meal>> getMeals({required Pagination<Meal> pagination, double? lat, double? long, bool? isPreorder = false});
  TaskEither<Failure, Pagination<Meal>> getMealsByCategory({required Pagination<Meal> pagination, required int categoryId, double? lat, double? long, bool? isPreorder = false});
  TaskEither<Failure, Pagination<Meal>> getMealsByChef({required Pagination<Meal> pagination, required String chefId, bool? isPreorder = false});
  TaskEither<Failure, Pagination<Meal>> getMealsByChefByCategory({required Pagination<Meal> pagination, required int categoryId, required String chefId, bool? isPreorder = false});
  TaskEither<Failure, Pagination<Meal>> getFavoriteMeals({required Pagination<Meal> pagination});
  TaskEither<Failure, Meal> addMealToFavorite({required Meal meal});
  TaskEither<Failure, Meal> removeMealToFavorite({required Meal meal});
}
