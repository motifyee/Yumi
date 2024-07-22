import 'package:bloc/bloc.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:common_code/domain/food_delivery/meal/entities/meal.dart';
import 'package:common_code/domain/food_delivery/meal/use_cases/add_meal_to_favorite.dart';
import 'package:common_code/domain/food_delivery/meal/use_cases/get_favorite_meals.dart';
import 'package:common_code/domain/food_delivery/meal/use_cases/get_meals.dart';
import 'package:common_code/domain/food_delivery/meal/use_cases/remove_meal_from_favorite.dart';
import 'package:yumi/global.dart';

part 'meal_cubit.freezed.dart';
part 'meal_cubit.g.dart';

@freezed
class MealState with _$MealState {
  const factory MealState({
    required PaginatedData<Meal> pagination,
    required int selectedCategory,
    required MenuTarget menuTarget,
    @Default(0) int mealsLength,
    @Default(0) int changesCounter,
    @Default(Status.init) Status status,
  }) = _MealState;

  factory MealState.initial() {
    return MealState(pagination: const PaginatedData<Meal>(data: []), selectedCategory: 0, menuTarget: MenuTarget.order);
  }

  factory MealState.fromJson(Map<String, dynamic> json) => _$MealStateFromJson(json);
}

class MealCubit extends Cubit<MealState> {
  MealCubit() : super(MealState.initial());

  reset({MenuTarget? menuTarget, int? categoryId}) {
    emit(state.copyWith(pagination: const PaginatedData<Meal>(), selectedCategory: categoryId ?? 0, menuTarget: menuTarget ?? state.menuTarget));
  }

  updateMeals({String? chefId, MenuTarget? menuTarget}) async {
    if (!state.pagination.canRequest) return;
    emit(state.copyWith(pagination: state.pagination.copyWith(isLoading: true) as PaginatedData<Meal>));
    final Either<Failure, PaginatedData<Meal>> task = await GetMeals().call(
      GetMealsParams(
        chefId: chefId,
        menuTarget: menuTarget,
        pagination: state.pagination,
        selectedCategory: state.selectedCategory,
      ),
    );

    task.fold((l) => G().snackBar(l.toString()), (r) => emit(state.copyWith(pagination: r)));
  }

  updateCategory({required int selectedCategory, String? chefId}) {
    emit(state.copyWith(pagination: const PaginatedData<Meal>(), selectedCategory: selectedCategory));
    updateMeals(chefId: chefId);
  }

  getFavoriteMeals() async {
    if (!state.pagination.canRequest) return;

    emit(state.copyWith(pagination: state.pagination.copyWith(isLoading: true) as PaginatedData<Meal>));

    final params = GetFavoriteMealsParams(paginatedData: state.pagination);
    final task = await GetFavoriteMeals().call(params);

    task.fold((l) => G().snackBar(l.toString()), (r) => emit(state.copyWith(pagination: r)));
  }

  addFavoriteMeal({required Meal meal}) async {
    final Either<Failure, PaginatedData<Meal>> task = await AddMealToFavorite().call(AddMealToFavoriteParams(paginatedData: state.pagination, meal: meal));

    task.fold((l) => G().snackBar(l.toString()), (r) => emit(state.copyWith(pagination: r)));
  }

  removeFavoriteMeal({required Meal meal}) async {
    final Either<Failure, PaginatedData<Meal>> task = await RemoveMealFromFavorite().call(RemoveMealFromFavoriteParams(paginatedData: state.pagination, meal: meal));
    task.fold((l) => G().snackBar(l.toString()), (r) => emit(state.copyWith(pagination: r)));
  }
}
