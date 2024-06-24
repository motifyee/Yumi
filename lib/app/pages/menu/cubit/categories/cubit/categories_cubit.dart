import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/domain/categories/entity/category.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/pagination.dart';

part 'categories_cubit.freezed.dart';

@freezed
class CategoriesState with _$CategoriesState {
  factory CategoriesState({
    @Default(Pagination()) Pagination<Category> categoriesPage,
  }) = _Initial;
}

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesState());

  Future<void> getCategories() async {
    if (!state.categoriesPage.canRequest) return;

    emit(state.copyWith.categoriesPage(isLoading: true));

    // if (G.isCustomerApp) {}
    final v = switch (G.appTarget) {
      AppTargetUser.customers => 1,
      AppTargetUser.chefs => throw UnimplementedError(),
      _ => throw UnimplementedError(),
    };
  }
}
