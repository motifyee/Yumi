import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/domain/categories/entity/category.dart';
import 'package:yumi/domain/categories/use_cases/get_categories.dart';
import 'package:yumi/domain/categories/use_cases/get_chef_categories.dart';
import 'package:yumi/domain/categories/use_cases/get_customer_categories.dart';
import 'package:yumi/domain/categories/use_cases/get_customer_categories_by_chef_id.dart';
import 'package:yumi/domain/user/cubit/user_cubit.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/paginatedData.dart';

part 'categories_cubit.freezed.dart';

@freezed
class CategoriesState with _$CategoriesState {
  factory CategoriesState({
    @Default(PaginatedData()) PaginatedData<Category> categoriesPage,
  }) = _Initial;
}

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesState());
// TODO seprate to four functions
  Future<void> getAllCategories({
    required bool isPreOrder,
  }) async {
    if (!state.categoriesPage.canRequest) return;

    emit(state.copyWith.categoriesPage(isLoading: true));

    PaginatedData<Category> categoriesPage = state.categoriesPage;

    if (G.isCustomerApp) {
      final params = GetCustomerCategoriesParams(
        isPreOrder: isPreOrder,
        pagination: state.categoriesPage,
        latitude: G.rd<UserCubit>().state.address?.latitude,
        longitude: G.rd<UserCubit>().state.address?.longitude,
      );

      final task = await GetCustomerCategories().call(params);
      categoriesPage = task.fold((l) => state.categoriesPage, (r) => r);
    } else if (G.isChefApp) {
      final params = GetCategoriesParams(
        isPreOrder: isPreOrder,
        pagination: state.categoriesPage,
      );

      final task = await GetCategories().call(params);
      categoriesPage = task.fold((l) => state.categoriesPage, (r) => r);
    }

    final List<Category> categories = [
      ...state.categoriesPage.data,
      ...categoriesPage.data
    ];

    emit(state.copyWith(
      categoriesPage: categoriesPage.copyWith(
        isLoading: false,
        data: categories,
      ) as PaginatedData<Category>,
    ));
  }

  Future<void> getChefCategories({
    required bool isPreOrder,
    String? chefId, // for customer app only
  }) async {
    if (!state.categoriesPage.canRequest) return;

    emit(state.copyWith.categoriesPage(isLoading: true));

    PaginatedData<Category> categoriesPage = state.categoriesPage;

    if (G.isCustomerApp) {
      final params = GetCustomerCategoriesByChefIdParams(
        isPreOrder: isPreOrder,
        pagination: state.categoriesPage,
        chefId: chefId ?? '',
      );

      final task = await GetCustomerCategoriesByChefId().call(params);
      categoriesPage = task.fold((l) => state.categoriesPage, (r) => r);
    } else if (G.isChefApp) {
      final params = GetChefCategoriesParams(
        isPreOrder: isPreOrder,
        pagination: state.categoriesPage,
      );

      final task = await GetChefCategories().call(params);
      categoriesPage = task.fold((l) => state.categoriesPage, (r) => r);
    }

    final List<Category> categories = [
      ...state.categoriesPage.data,
      ...categoriesPage.data
    ];

    emit(state.copyWith(
      categoriesPage: categoriesPage.copyWith(
        isLoading: false,
        data: categories,
      ) as PaginatedData<Category>,
    ));
  }

  void reset() {
    emit(state.copyWith(
      categoriesPage: const PaginatedData(),
    ));
  }
}
