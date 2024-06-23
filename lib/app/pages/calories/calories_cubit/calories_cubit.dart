import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/calories/entity/calories.dart';
import 'package:yumi/domain/calories/use_case/load_calories.dart';
import 'package:yumi/statics/pager.dart';

part 'calories_cubit.freezed.dart';
part 'calories_cubit.g.dart';
part 'calories_state.dart';

class CaloriesCubit extends Cubit<CaloriesState> {
  CaloriesCubit() : super(CaloriesState.initail());

  loadCalories() async {
    if (state.pager.canRequest) {
      emit(state.copyWith(
          pager: state.pager.copyWith(isLoading: true) as Pager<Calories>));

      final Either<Failure, Pager<Calories>> task =
          await LoadCalories().call(LoadCaloriesParams(pager: state.pager));
      task.fold((l) => null, (r) => emit(state.copyWith(pager: r)));
    }
  }
}
