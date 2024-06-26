import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/meal/entity/meal.dart';
import 'package:yumi/statics/paginatedData.dart';
import 'package:yumi/statics/pagination.dart';

abstract class MealRepo {
  TaskEither<Failure, String> createMeal({required Meal meal});
  TaskEither<Failure, String> updateMeal({required Meal meal});
  TaskEither<Failure, Meal> deleteMeal({required Meal meal});
  TaskEither<Failure, Meal> getMealById({required int mealId});
  TaskEither<Failure, PaginatedData<Meal>> getMeals({required PaginatedData<Meal> pagination, double? lat, double? long, bool? isPreorder = false});
  TaskEither<Failure, PaginatedData<Meal>> getMealsByCategory({required PaginatedData<Meal> pagination, required int categoryId, double? lat, double? long, bool? isPreorder = false});
  TaskEither<Failure, PaginatedData<Meal>> getMealsByChef({required PaginatedData<Meal> pagination, required String chefId, bool? isPreorder = false});
  TaskEither<Failure, PaginatedData<Meal>> getMealsByChefByCategory({required PaginatedData<Meal> pagination, required int categoryId, required String chefId, bool? isPreorder = false});
  TaskEither<Failure, PaginatedData<Meal>> getFavoriteMeals({required PaginatedData<Meal> pagination});
  TaskEither<Failure, Meal> addMealToFavorite({required Meal meal});
  TaskEither<Failure, Meal> removeMealToFavorite({required Meal meal});
}
