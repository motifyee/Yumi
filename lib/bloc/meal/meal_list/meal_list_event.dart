part of 'meal_list_bloc.dart';

@immutable
abstract class MealListEvent {}

class MealListResetEvent implements MealListEvent {
  MenuTarget? menuTarget;
  MealListResetEvent({this.menuTarget});
}

class MealListUpdateEvent implements MealListEvent {
  BuildContext context;

  MealListUpdateEvent({required this.context});
}

class MealListUpdateCategoryEvent implements MealListEvent {
  int selectedCategory;
  BuildContext context;

  MealListUpdateCategoryEvent(
      {required this.selectedCategory, required this.context});
}

class MealListUpdateCaloriesEvent implements MealListEvent {
  String? searchText;
  BuildContext context;

  MealListUpdateCaloriesEvent(
      {required this.searchText, required this.context});
}
