import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart';
import 'package:common_code/domain/food_delivery/meal/data/repo/meal_repo.dart';
import 'package:common_code/domain/food_delivery/meal/entities/meal.dart';

class GetMeals extends UseCase<PaginatedData<Meal>, GetMealsParams> {
  final MealRepo mealRepo;

  GetMeals({MealRepo? mealRepo}) : mealRepo = mealRepo ?? getIt<MealRepo>();

  @override
  Future<Either<Failure, PaginatedData<Meal>>> call(GetMealsParams params) {
    if (params.chefId == null) {
      if (params.selectedCategory == 0) {
        return mealRepo
            .getMeals(
              lat: params.lat,
              long: params.long,
              pagination: params.pagination,
              isPreorder: params.menuTarget == MenuTarget.preOrder,
            )
            .run();
      } else {
        return mealRepo
            .getMealsByCategory(
              lat: params.lat,
              long: params.long,
              pagination: params.pagination,
              categoryId: params.selectedCategory,
              isPreorder: params.menuTarget == MenuTarget.preOrder,
            )
            .run();
      }
    } else {
      if (params.selectedCategory == 0) {
        return mealRepo
            .getMealsByChef(
              pagination: params.pagination,
              chefId: params.chefId!,
              isPreorder: params.menuTarget == MenuTarget.preOrder,
            )
            .run();
      } else {
        return mealRepo
            .getMealsByChefByCategory(
              pagination: params.pagination,
              categoryId: params.selectedCategory,
              chefId: params.chefId!,
            )
            .run();
      }
    }
  }
}

class GetMealsParams extends Params {
  final String? chefId;
  final MenuTarget? menuTarget;
  final PaginatedData<Meal> pagination;
  final int selectedCategory;
  final double? lat;
  final double? long;

  GetMealsParams({
    required this.pagination,
    required this.selectedCategory,
    this.chefId,
    this.menuTarget,
    this.lat,
    this.long,
  });

  @override
  List<Object?> get props => [];
}
