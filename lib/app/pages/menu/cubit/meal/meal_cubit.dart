import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/domain/meal/entity/meal.dart';
import 'package:yumi/statics/pagination.dart';

part 'meal_cubit.freezed.dart';
part 'meal_cubit.g.dart';

@freezed
class MealState with _$MealState {
  const factory MealState({
    required Pagination<Meal> pagination,
    required int selectedCategory,
    required MenuTarget menuTarget,
    @Default(0) int mealsLength,
    @Default(0) int changesCounter,
    @Default(Status.init) Status status,
  }) = _MealState;

  factory MealState.initial() {
    return const MealState(pagination: Pagination<Meal>(data: []), selectedCategory: 0, menuTarget: MenuTarget.order);
  }

  factory MealState.fromJson(Map<String, dynamic> json) => _$MealStateFromJson(json);
}

class MealCubit extends Cubit<MealState> {
  MealCubit() : super(MealState.initial());

  updateMeals() {
    if (!state.pagination.canRequest) return;
    emit(state.copyWith(pagination: state.pagination.copyWith(isLoading: true) as Pagination<Meal>));
  }
}
