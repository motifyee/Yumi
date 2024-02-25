part of 'categories_bloc.dart';

@immutable
abstract class CategoriesEvent {}

class GetCategoriesEvent implements CategoriesEvent {
  final BuildContext context;

  GetCategoriesEvent({required this.context});
}
