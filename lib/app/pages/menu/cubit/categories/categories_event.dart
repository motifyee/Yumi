part of 'categories_bloc.dart';

@immutable
abstract class CategoriesEvent {}

class ResetCategoryEvent implements CategoriesEvent {}

class GetCategoriesEvent implements CategoriesEvent {
  final BuildContext context;
  final bool isPreOrder;
  final bool isAll;
  final String? chefId;

  GetCategoriesEvent(
      {required this.context,
      required this.isPreOrder,
      this.chefId,
      this.isAll = false});
}
