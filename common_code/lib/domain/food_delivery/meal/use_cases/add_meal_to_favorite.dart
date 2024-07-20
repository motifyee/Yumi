import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart';
import 'package:common_code/domain/food_delivery/meal/data/repo/meal_repo.dart';
import 'package:common_code/domain/food_delivery/meal/entities/meal.dart';

class AddMealToFavorite
    extends UseCase<PaginatedData<Meal>, AddMealToFavoriteParams> {
  final MealRepo mealRepo;

  AddMealToFavorite({MealRepo? mealRepo})
      : mealRepo = mealRepo ?? getIt<MealRepo>();

  @override
  Future<Either<Failure, PaginatedData<Meal>>> call(
      AddMealToFavoriteParams params) {
    return mealRepo.addMealToFavorite(meal: params.meal).run().then((value) {
      List<Meal> meals = List.from(params.paginatedData.data);
      final idx = meals.indexWhere((e) => e.id == params.meal.id);
      if (idx > -1) {
        meals[idx] = meals[idx].copyWith(isFavoriteProduct: true);
      } else {
        meals.add(params.meal.copyWith(isFavoriteProduct: true));
      }
      return Right(
          params.paginatedData.copyWith(data: meals) as PaginatedData<Meal>);
    });
  }
}

class AddMealToFavoriteParams extends Params {
  final PaginatedData<Meal> paginatedData;
  final Meal meal;

  AddMealToFavoriteParams({required this.paginatedData, required this.meal});

  @override
  List<Object?> get props => [paginatedData, meal];
}
