part of 'ingredient_form_bloc.dart';

@immutable
abstract class IngredientFormEvent {}

class IngredientFormAddEvent implements IngredientFormEvent {
  Ingredient ingredientsModel;

  IngredientFormAddEvent({required this.ingredientsModel});
}

class IngredientFormRemoveEvent implements IngredientFormEvent {
  Ingredient ingredientsModel;

  IngredientFormRemoveEvent({required this.ingredientsModel});
}

class IngredientFormUpdateEvent implements IngredientFormEvent {
  List<Ingredient> ingredientsModel;

  IngredientFormUpdateEvent({required this.ingredientsModel});
}
