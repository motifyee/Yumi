part of 'ingredient_list_bloc.dart';

@immutable
abstract class IngredientListEvent {}

class IngredientListUpdateEvent implements IngredientListEvent {
  BuildContext context;

  IngredientListUpdateEvent({required this.context});
}
