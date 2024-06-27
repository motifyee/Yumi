part of 'ingredient_form_bloc.dart';

@immutable
abstract class IngredientFormEvent {}

class IngredientFormAddEvent implements IngredientFormEvent {
  Ingredients ingredientsModel;

  IngredientFormAddEvent({required this.ingredientsModel});
}

class IngredientFormRemoveEvent implements IngredientFormEvent {
  Ingredients ingredientsModel;

  IngredientFormRemoveEvent({required this.ingredientsModel});
}

class IngredientFormUpdateEvent implements IngredientFormEvent {
  List<Ingredients> ingredientsModel;

  IngredientFormUpdateEvent({required this.ingredientsModel});
}
