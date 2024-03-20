part of 'chefs_list_bloc.dart';

@immutable
abstract class ChefsListEvent {}

class GetChefsListEvent implements ChefsListEvent {
  BuildContext context;
  MenuTarget menuTarget;

  GetChefsListEvent({required this.context, required this.menuTarget});
}

class ResetChefsListEvent implements ChefsListEvent {}
