import 'package:bloc/bloc.dart';
import 'package:common_code/common_code.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:common_code/domain/food_delivery/calories/entity/calorie.dart';
import 'package:common_code/domain/food_delivery/calories/use_case/load_calories.dart';

part 'calories_cubit.freezed.dart';
part 'calories_cubit.g.dart';
part 'calories_state.dart';

class CaloriesCubit extends Cubit<CaloriesState> {
  CaloriesCubit() : super(CaloriesState());

  loadCalories() async {
    if (!state.calories.canRequest) return;

    emit(state.copyWith.calories(isLoading: true));

    final params = LoadCaloriesParams(pagination: state.calories.pagination);
    final task = await LoadCalories().call(params);

    task.fold(
      (l) => null, // TODO: Handle Failure
      (r) => emit(
        state.copyWith(
          calories: r.copyWith(
            data: [...state.calories.data, ...r.data],
          ) as PaginatedData<Calorie>,
        ),
      ),
    );
  }
}
