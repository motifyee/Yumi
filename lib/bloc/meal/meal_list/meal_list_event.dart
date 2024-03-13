part of 'meal_list_bloc.dart';

@immutable
abstract class MealListEvent {}

class MealListResetEvent implements MealListEvent {
  MenuTarget? menuTarget;
  MealListResetEvent({this.menuTarget});
}

class MealListUpdateEvent implements MealListEvent {
  BuildContext context;
  String? chefId;
  MenuTarget? menuTarget;

  MealListUpdateEvent({required this.context, this.chefId, this.menuTarget});
}

class MealListUpdateCategoryEvent implements MealListEvent {
  int selectedCategory;
  String? chefId;
  BuildContext context;

  MealListUpdateCategoryEvent(
      {required this.selectedCategory, this.chefId, required this.context});
}

class MealListUpdateCaloriesEvent implements MealListEvent {
  String? searchText;
  BuildContext context;

  MealListUpdateCaloriesEvent(
      {required this.searchText, required this.context});
}
