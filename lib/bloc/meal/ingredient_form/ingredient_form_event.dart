part of 'ingredient_form_bloc.dart';

@immutable
abstract class IngredientFormEvent {}

class IngredientFormAddEvent implements IngredientFormEvent {
  IngredientsModel ingredientsModel;

  IngredientFormAddEvent({required this.ingredientsModel});
}

class IngredientFormRemoveEvent implements IngredientFormEvent {
  IngredientsModel ingredientsModel;

  IngredientFormRemoveEvent({required this.ingredientsModel});
}

class IngredientFormUpdateEvent implements IngredientFormEvent {
  List<IngredientsModel> ingredientsModel;

  IngredientFormUpdateEvent({required this.ingredientsModel});
}
