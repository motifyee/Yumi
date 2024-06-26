import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/calories/entity/calories.dart';
import 'package:yumi/domain/calories/use_case/load_calories.dart';
import 'package:yumi/statics/paginatedData.dart';

part 'calories_cubit.freezed.dart';
part 'calories_cubit.g.dart';
part 'calories_state.dart';

class CaloriesCubit extends Cubit<CaloriesState> {
  CaloriesCubit() : super(CaloriesState.initail());

  loadCalories() async {
    if (state.pagination.canRequest) {
      emit(state.copyWith(
          pagination: state.pagination.copyWith(isLoading: true)
              as PaginatedData<Calories>));

      final Either<Failure, PaginatedData<Calories>> task = await LoadCalories()
          .call(LoadCaloriesParams(pagination: state.pagination));
      task.fold((l) => null, (r) => emit(state.copyWith(pagination: r)));
    }
  }
}
