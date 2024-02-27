part of 'meal_list_bloc.dart';

@immutable
abstract class MealListEvent {}

class MealListUpdateEvent implements MealListEvent {
  BuildContext context;

  MealListUpdateEvent({required this.context});
}

class MealListUpdateCategoryEvent implements MealListEvent {
  final int selectedCategory;

  MealListUpdateCategoryEvent({required this.selectedCategory});
}
