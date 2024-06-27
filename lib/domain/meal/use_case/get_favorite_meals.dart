import 'package:fpdart/fpdart.dart';
import 'package:fpdart/src/either.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/meal/data/repo/meal_repo.dart';
import 'package:yumi/domain/meal/entity/meal.dart';
import 'package:yumi/statics/paginatedData.dart';

class GetFavoriteMeals extends UseCase<PaginatedData<Meal>, GetFavoriteMealsParams> {
  final MealRepo mealRepo;

  GetFavoriteMeals({MealRepo? mealRepo}) : mealRepo = mealRepo ?? getIt<MealRepo>();

  @override
  Future<Either<Failure, PaginatedData<Meal>>> call(GetFavoriteMealsParams params) => mealRepo.getFavoriteMeals(pagination: params.paginatedData).run();
}

class GetFavoriteMealsParams extends Params {
  final PaginatedData<Meal> paginatedData;

  GetFavoriteMealsParams({required this.paginatedData});

  @override
  List<Object?> get props => [paginatedData];
}
