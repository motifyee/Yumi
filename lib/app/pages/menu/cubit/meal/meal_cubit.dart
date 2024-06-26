import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/meal/entity/meal.dart';
import 'package:yumi/domain/meal/use_case/get_meals.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/paginatedData.dart';
import 'package:yumi/statics/pagination.dart';

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
    return MealState(pagination: PaginatedData<Meal>(data: []), selectedCategory: 0, menuTarget: MenuTarget.order);
  }

  factory MealState.fromJson(Map<String, dynamic> json) => _$MealStateFromJson(json);
}

class MealCubit extends Cubit<MealState> {
  MealCubit() : super(MealState.initial());

  updateMeals({String? chefId, MenuTarget? menuTarget}) async {
    if (!state.pagination.canRequest) return;
    emit(state.copyWith(pagination: state.pagination.copyWith(isLoading: true) as PaginatedData<Meal>));
    final Either<Failure, PaginatedData<Meal>> task = await GetMeals().call(GetMealsParams(pagination: state.pagination, selectedCategory: state.selectedCategory, chefId: chefId, menuTarget: menuTarget));

    task.fold((l) => G.snackBar((l.error as DioException).response?.data['message']), (r) => emit(state.copyWith(pagination: r)));
  }
}
