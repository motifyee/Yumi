import 'package:fpdart/src/task_either.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/domain/meal/data/repo/meal_repo.dart';
import 'package:yumi/domain/meal/data/source/meal_source.dart';
import 'package:yumi/domain/meal/entity/meal.dart';
import 'package:yumi/statics/paginatedData.dart';

class MealRepoRemote extends MealRepo {
  final MealSource mealSource;

  MealRepoRemote({MealSource? mealSource})
      : mealSource = mealSource ?? getIt<MealSource>();

  @override
  TaskEither<Failure, Meal> addMealToFavorite({required Meal meal}) =>
      TaskEither.tryCatch(() => mealSource.addMealToFavorite(meal: meal),
          (error, stackTrace) => ServerFailure(error.toString()));

  @override
  TaskEither<Failure, String> createMeal({required Meal meal}) =>
      TaskEither.tryCatch(() => mealSource.createMeal(meal: meal),
          (error, stackTrace) => ServerFailure(error.toString()));

  @override
  TaskEither<Failure, Meal> deleteMeal({required Meal meal}) =>
      TaskEither.tryCatch(() => mealSource.deleteMeal(meal: meal),
          (error, stackTrace) => ServerFailure(error.toString()));

  @override
  TaskEither<Failure, PaginatedData<Meal>> getFavoriteMeals(
          {required PaginatedData<Meal> pagination}) =>
      TaskEither.tryCatch(
          () => mealSource.getFavoriteMeals(pagination: pagination),
          (error, stackTrace) => ServerFailure(error.toString()));

  @override
  TaskEither<Failure, Meal> getMealById({required int mealId}) =>
      TaskEither.tryCatch(() => mealSource.getMealById(mealId: mealId),
          (error, stackTrace) => ServerFailure(error.toString()));

  @override
  TaskEither<Failure, PaginatedData<Meal>> getMeals(
          {required PaginatedData<Meal> pagination,
          double? lat,
          double? long,
          bool? isPreorder = false}) =>
      TaskEither.tryCatch(
          () => mealSource.getMeals(
              pagination: pagination,
              lat: lat,
              long: long,
              isPreorder: isPreorder),
          (error, stackTrace) => ServerFailure(error.toString()));

  @override
  TaskEither<Failure, PaginatedData<Meal>> getMealsByCategory(
          {required PaginatedData<Meal> pagination,
          required int categoryId,
          double? lat,
          double? long,
          bool? isPreorder = false}) =>
      TaskEither.tryCatch(
          () => mealSource.getMealsByCategory(
              pagination: pagination,
              categoryId: categoryId,
              lat: lat,
              long: long,
              isPreorder: isPreorder),
          (error, stackTrace) => ServerFailure(error.toString()));

  @override
  TaskEither<Failure, PaginatedData<Meal>> getMealsByChef(
          {required PaginatedData<Meal> pagination,
          required String chefId,
          bool? isPreorder = false}) =>
      TaskEither.tryCatch(
          () => mealSource.getMealsByChef(
              pagination: pagination, chefId: chefId, isPreorder: isPreorder),
          (error, stackTrace) => ServerFailure(error.toString()));

  @override
  TaskEither<Failure, PaginatedData<Meal>> getMealsByChefByCategory(
          {required PaginatedData<Meal> pagination,
          required int categoryId,
          required String chefId,
          bool? isPreorder = false}) =>
      TaskEither.tryCatch(
          () => mealSource.getMealsByChefByCategory(
              pagination: pagination,
              categoryId: categoryId,
              chefId: chefId,
              isPreorder: isPreorder),
          (error, stackTrace) => ServerFailure(error.toString()));

  @override
  TaskEither<Failure, Meal> removeMealToFavorite({required Meal meal}) =>
      TaskEither.tryCatch(() => mealSource.removeMealToFavorite(meal: meal),
          (error, stackTrace) => ServerFailure(error.toString()));

  @override
  TaskEither<Failure, String> updateMeal({required Meal meal}) =>
      TaskEither.tryCatch(() => mealSource.updateMeal(meal: meal),
          (error, stackTrace) => ServerFailure(error.toString()));
}
