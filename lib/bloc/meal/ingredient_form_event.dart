part of 'ingredient_form_bloc.dart';

@immutable
abstract class IngredientFormEvent {}

class IngredientFormUpdateEvent implements IngredientFormEvent {
  IngredientsModel ingredientsModel;

  IngredientFormUpdateEvent({required this.ingredientsModel});
}
