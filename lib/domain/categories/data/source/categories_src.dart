import 'package:yumi/domain/categories/entity/category.dart';
import 'package:yumi/statics/pagination.dart';

abstract class CategoriesSrc {
  Future<Pagination<Category>> getCategories({
    bool isPreOrder = false,
    Pagination? pagination,
  });
  Future<Pagination<Category>> getChefCategories({
    bool isPreOrder = false,
    Pagination? pagination,
  });
  Future<Pagination<Category>> getCustomerCategories({
    bool isPreOrder = false,
    double? latitude,
    double? longitude,
    Pagination? pagination,
  });
  Future<Pagination<Category>> getCustomerCategoriesByChefId({
    required String chefId,
    bool isPreOrder = false,
    Pagination? pagination,
  });
}
