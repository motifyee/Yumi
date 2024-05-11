part of 'meal_list_bloc.dart';

@immutable
abstract class MealListEvent {}

class MealListResetEvent implements MealListEvent {
  MenuTarget? menuTarget;
  int? categoryId;

  MealListResetEvent({this.menuTarget, this.categoryId});
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

  MealListUpdateCategoryEvent({
    required this.selectedCategory,
    this.chefId,
    required this.context,
  });
}

class MealListGetFavoriteMealsEvent implements MealListEvent {}

class MealListAddFavoriteMealEvent implements MealListEvent {
  final MealModel meal;

  MealListAddFavoriteMealEvent({required this.meal});
}

class MealListRemoveFavoriteMealEvent implements MealListEvent {
  final MealModel meal;

  MealListRemoveFavoriteMealEvent({required this.meal});
}
