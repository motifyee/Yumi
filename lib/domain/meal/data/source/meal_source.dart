import 'package:yumi/domain/meal/entity/meal.dart';
import 'package:yumi/statics/pagination.dart';

abstract class MealSource {
  Future<String> createMeal({required Meal meal});
  Future<String> updateMeal({required Meal meal});
  Future<Meal> deleteMeal({required Meal meal});
  Future<Meal> getMealById({required int mealId});
  Future<Pagination<Meal>> getMeals({required Pagination<Meal> pagination, double? lat, double? long, bool? isPreorder = false});
  Future<Pagination<Meal>> getMealsByCategory({required Pagination<Meal> pagination, required int categoryId, double? lat, double? long, bool? isPreorder = false});
  Future<Pagination<Meal>> getMealsByChef({required Pagination<Meal> pagination, required String chefId, bool? isPreorder = false});
  Future<Pagination<Meal>> getMealsByChefByCategory({required Pagination<Meal> pagination, required int categoryId, required String chefId, bool? isPreorder = false});
  Future<Pagination<Meal>> getFavoriteMeals({required Pagination<Meal> pagination});
  Future<Meal> addMealToFavorite({required Meal meal});
  Future<Meal> removeMealToFavorite({required Meal meal});
}
