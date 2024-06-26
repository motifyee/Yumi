import 'package:yumi/domain/categories/entity/category.dart';
import 'package:yumi/statics/paginatedData.dart';

abstract class CategoriesSrc {
  Future<PaginatedData<Category>> getCategories({
    bool isPreOrder = false,
    PaginatedData? pagination,
  });
  Future<PaginatedData<Category>> getChefCategories({
    bool isPreOrder = false,
    PaginatedData? pagination,
  });
  Future<PaginatedData<Category>> getCustomerCategories({
    bool isPreOrder = false,
    double? latitude,
    double? longitude,
    PaginatedData? pagination,
  });
  Future<PaginatedData<Category>> getCustomerCategoriesByChefId({
    required String chefId,
    bool isPreOrder = false,
    PaginatedData? pagination,
  });
}
