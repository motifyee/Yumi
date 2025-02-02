import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/food_delivery/meal/data/repo/meal_repo.dart';

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
