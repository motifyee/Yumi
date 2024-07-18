import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:yumi/domain/meal/data/repo/meal_repo.dart';
import 'package:yumi/domain/meal/entities/meal.dart';

class GetFavoriteMeals
    extends UseCase<PaginatedData<Meal>, GetFavoriteMealsParams> {
  final MealRepo mealRepo;

  GetFavoriteMeals({MealRepo? mealRepo})
      : mealRepo = mealRepo ?? getIt<MealRepo>();

  @override
  Future<Either<Failure, PaginatedData<Meal>>> call(
          GetFavoriteMealsParams params) =>
      mealRepo.getFavoriteMeals(pagination: params.paginatedData).run();
}

class GetFavoriteMealsParams extends Params {
  final PaginatedData<Meal> paginatedData;

  GetFavoriteMealsParams({required this.paginatedData});

  @override
  List<Object?> get props => [paginatedData];
}
