part of 'meal_list_bloc.dart';

@immutable
abstract class MealListEvent {}

class MealListUpdateEvent implements MealListEvent {}

class MealListUpdateCategoryEvent implements MealListEvent {
  int selectedCategory;

  MealListUpdateCategoryEvent({required this.selectedCategory});
}
