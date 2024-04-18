part of 'chefs_list_bloc.dart';

@immutable
abstract class ChefsListEvent {}

class GetChefsListEvent implements ChefsListEvent {
  final BuildContext context;
  final MenuTarget menuTarget;
  final bool isFavorite;

  GetChefsListEvent(
      {required this.context,
      required this.menuTarget,
      this.isFavorite = false});
}

class AddChefToFavoriteEvent implements ChefsListEvent {
  final ChefModel chef;
  AddChefToFavoriteEvent({required this.chef});
}

class RemoveChefToFavoriteEvent implements ChefsListEvent {
  final ChefModel chef;
  RemoveChefToFavoriteEvent({required this.chef});
}

class ResetChefsListEvent implements ChefsListEvent {}
