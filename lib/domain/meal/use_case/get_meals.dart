import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart';
import 'package:yumi/domain/meal/data/repo/meal_repo.dart';
import 'package:yumi/domain/meal/entity/meal.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:yumi/global.dart';

class GetMeals extends UseCase<PaginatedData<Meal>, GetMealsParams> {
  final MealRepo mealRepo;

  GetMeals({MealRepo? mealRepo}) : mealRepo = mealRepo ?? getIt<MealRepo>();

  @override
  Future<Either<Failure, PaginatedData<Meal>>> call(GetMealsParams params) {
    if (params.chefId == null) {
      if (params.selectedCategory == 0) {
        return mealRepo
            .getMeals(
                pagination: params.pagination,
                lat: G().context.read<UserCubit>().state.address?.latitude,
                long: G().context.read<UserCubit>().state.address?.longitude,
                isPreorder: params.menuTarget == MenuTarget.preOrder)
            .run();
      } else {
        return mealRepo
            .getMealsByCategory(
                pagination: params.pagination,
                categoryId: params.selectedCategory,
                lat: G().context.read<UserCubit>().state.address?.latitude,
                long: G().context.read<UserCubit>().state.address?.longitude,
                isPreorder: params.menuTarget == MenuTarget.preOrder)
            .run();
      }
    } else {
      if (params.selectedCategory == 0) {
        return mealRepo
            .getMealsByChef(
                pagination: params.pagination,
                chefId: params.chefId!,
                isPreorder: params.menuTarget == MenuTarget.preOrder)
            .run();
      } else {
        return mealRepo
            .getMealsByChefByCategory(
                pagination: params.pagination,
                categoryId: params.selectedCategory,
                chefId: params.chefId!)
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

  GetMealsParams(
      {required this.pagination,
      required this.selectedCategory,
      this.chefId,
      this.menuTarget});

  @override
  List<Object?> get props => [];
}
