import 'package:fpdart/fpdart.dart';
import 'package:common_code/domain/food_delivery/categories/entity/category.dart';
import 'package:common_code/common_code.dart';

abstract class CategoriesRepo {
  TaskEither<Failure, PaginatedData<Category>> getCategories({
    bool isPreOrder = false,
    PaginatedData? pagination,
  });
  TaskEither<Failure, PaginatedData<Category>> getChefCategories({
    bool isPreOrder = false,
    PaginatedData? pagination,
  });
  TaskEither<Failure, PaginatedData<Category>> getCustomerCategories({
    bool isPreOrder = false,
    double? latitude,
    double? longitude,
    PaginatedData? pagination,
  });
  TaskEither<Failure, PaginatedData<Category>> getCustomerCategoriesByChefId({
    required String chefId,
    bool isPreOrder = false,
    PaginatedData? pagination,
  });
}
