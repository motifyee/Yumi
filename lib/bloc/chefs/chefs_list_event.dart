part of 'chefs_list_bloc.dart';

@immutable
abstract class ChefsListEvent {}

class GetChefsListEvent implements ChefsListEvent {
  BuildContext context;

  GetChefsListEvent({required this.context});
}

class ResetChefsListEvent implements ChefsListEvent {}
