import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/calories/entity/calories.dart';
import 'package:yumi/domain/calories/use_case/load_calories.dart';
import 'package:yumi/statics/pagination_helper.dart';

part 'calories_cubit.freezed.dart';
part 'calories_cubit.g.dart';
part 'calories_state.dart';

class CaloriesCubit extends Cubit<CaloriesState> {
  CaloriesCubit() : super(CaloriesState.initail());

  loadCalories() async {
    if (state.paginationHelper.canRequest) {
      emit(state.copyWith(
          paginationHelper: state.paginationHelper.copyWith(isLoading: true)
              as PaginationHelper<Calories>));

      final Either<Failure, PaginationHelper<Calories>> task =
          await LoadCalories().call(
              LoadCaloriesParams(paginationHelper: state.paginationHelper));
      task.fold((l) => null, (r) => emit(state.copyWith(paginationHelper: r)));
    }
  }
}
