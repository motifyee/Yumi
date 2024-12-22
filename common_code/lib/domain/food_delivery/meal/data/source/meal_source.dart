import 'package:common_code/common_code.dart';

abstract class MealSource {
  Future<String> createMeal({required Meal meal});
  Future<String> updateMeal({required Meal meal});
  Future<Meal> deleteMeal({required Meal meal});
  Future<Meal> getMealById({required int mealId});
  Future<PaginatedData<Meal>> getMeals(
      {required PaginatedData<Meal> pagination,
      double? lat,
      double? long,
      bool? isPreorder = false});
  Future<PaginatedData<Meal>> getMealsByCategory(
      {required PaginatedData<Meal> pagination,
      required int categoryId,
      double? lat,
      double? long,
      bool? isPreorder = false});
  Future<PaginatedData<Meal>> getMealsByChef(
      {required PaginatedData<Meal> pagination,
      required String chefId,
      bool? isPreorder = false});
  Future<PaginatedData<Meal>> getMealsByChefByCategory(
      {required PaginatedData<Meal> pagination,
      required int categoryId,
      required String chefId,
      bool? isPreorder = false});
  Future<PaginatedData<Meal>> getFavoriteMeals(
      {required PaginatedData<Meal> pagination});
  Future<Meal> addMealToFavorite({required Meal meal});
  Future<Meal> removeMealToFavorite({required Meal meal});
}
