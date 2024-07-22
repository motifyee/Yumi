import 'package:common_code/domain/food_delivery/meal/data/repo/meal_repo.dart';

import 'package:common_code/common_code.dart';
import 'package:common_code/util/global_context.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';

class GetMeals extends UseCase<PaginatedData<Meal>, GetMealsParams> {
  final MealRepo mealRepo;

  GetMeals({MealRepo? mealRepo}) : mealRepo = mealRepo ?? getIt<MealRepo>();

  @override
  Future<Either<Failure, PaginatedData<Meal>>> call(GetMealsParams params) {
    if (params.chefId == null) {
      if (params.selectedCategory == 0) {
        return mealRepo
            .getMeals(
                pagination: params.pagination, lat: GlobalContext().context.read<UserCubit>().state.address?.latitude, long: GlobalContext().context.read<UserCubit>().state.address?.longitude, isPreorder: params.menuTarget == MenuTarget.preOrder)
            .run();
      } else {
        return mealRepo
            .getMealsByCategory(
                pagination: params.pagination,
                categoryId: params.selectedCategory,
                lat: GlobalContext().context.read<UserCubit>().state.address?.latitude,
                long: GlobalContext().context.read<UserCubit>().state.address?.longitude,
                isPreorder: params.menuTarget == MenuTarget.preOrder)
            .run();
      }
    } else {
      if (params.selectedCategory == 0) {
        return mealRepo.getMealsByChef(pagination: params.pagination, chefId: params.chefId!, isPreorder: params.menuTarget == MenuTarget.preOrder).run();
      } else {
        return mealRepo.getMealsByChefByCategory(pagination: params.pagination, categoryId: params.selectedCategory, chefId: params.chefId!).run();
      }
    }
  }
}

class GetMealsParams extends Params {
  final String? chefId;
  final MenuTarget? menuTarget;
  final PaginatedData<Meal> pagination;
  final int selectedCategory;

  GetMealsParams({required this.pagination, required this.selectedCategory, this.chefId, this.menuTarget});

  @override
  List<Object?> get props => [];
}
