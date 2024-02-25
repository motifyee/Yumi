import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'meal_list_event.dart';
part 'meal_list_state.dart';

class MealListBloc extends Bloc<MealListEvent, MealListState> {
  MealListBloc() : super(MealListState(meals: const [], selectedCategory: 0)) {
    on<MealListUpdateEvent>((event, emit) {
      emit(MealListState(
          meals: const [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
          selectedCategory: state.selectedCategory));
    });
    on<MealListUpdateCategoryEvent>((event, emit) {
      emit(MealListState(
          meals: state.meals, selectedCategory: event.selectedCategory));
    });
  }
}
