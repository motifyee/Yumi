import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/categories/data/repo/categories_repo.dart';
import 'package:yumi/domain/categories/entity/category.dart';
import 'package:yumi/statics/paginatedData.dart';

class GetCustomerCategories
    extends UseCase<PaginatedData<Category>, GetCustomerCategoriesParams> {
  final CategoriesRepo repo;

  GetCustomerCategories({CategoriesRepo? repo})
      : repo = repo ?? getIt<CategoriesRepo>();

  @override
  Future<Either<Failure, PaginatedData<Category>>> call(
    GetCustomerCategoriesParams params,
  ) =>
      repo
          .getCustomerCategories(
            isPreOrder: params.isPreOrder,
            pagination: params.pagination,
            longitude: params.longitude,
            latitude: params.latitude,
          )
          .run();
}

class GetCustomerCategoriesParams extends Params {
  final bool isPreOrder;
  final PaginatedData? pagination;
  final double? longitude;
  final double? latitude;

  GetCustomerCategoriesParams({
    this.isPreOrder = false,
    this.pagination,
    this.longitude,
    this.latitude,
  });

  @override
  List<Object?> get props => [isPreOrder, pagination];
}