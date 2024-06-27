import 'package:fpdart/src/either.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/meal/data/repo/meal_repo.dart';
import 'package:yumi/domain/meal/entity/meal.dart';
import 'package:yumi/statics/paginatedData.dart';

class RemoveMealFromFavorite extends UseCase<PaginatedData<Meal>, RemoveMealFromFavoriteParams> {
  final MealRepo mealRepo;

  RemoveMealFromFavorite({MealRepo? mealRepo}) : mealRepo = mealRepo ?? getIt<MealRepo>();

  @override
  Future<Either<Failure, PaginatedData<Meal>>> call(RemoveMealFromFavoriteParams params) {
    return mealRepo.removeMealToFavorite(meal: params.meal).run().then((value) {
      List<Meal> meals = List.from(params.paginatedData.data);
      final idx = meals.indexWhere((e) => e.id == params.meal.id);
      if (idx > -1) {
        meals[idx] = meals[idx].copyWith(isFavoriteProduct: false);
      } else {
        meals.add(params.meal.copyWith(isFavoriteProduct: false));
      }
      return Right(params.paginatedData.copyWith(data: meals) as PaginatedData<Meal>);
    });
  }
}

class RemoveMealFromFavoriteParams extends Params {
  final PaginatedData<Meal> paginatedData;
  final Meal meal;

  RemoveMealFromFavoriteParams({required this.paginatedData, required this.meal});

  @override
  List<Object?> get props => [paginatedData, meal];
}
