import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/categories/data/repo/categories_repo.dart';
import 'package:yumi/domain/categories/entity/category.dart';
import 'package:yumi/statics/pagination.dart';

class GetCustomerCategoriesByChefId
    extends UseCase<Pagination<Category>, GetCustomerCategoriesByChefIdParams> {
  final CategoriesRepo repo;

  GetCustomerCategoriesByChefId({CategoriesRepo? repo})
      : repo = repo ?? getIt<CategoriesRepo>();

  @override
  Future<Either<Failure, Pagination<Category>>> call(
    GetCustomerCategoriesByChefIdParams params,
  ) =>
      repo
          .getCustomerCategoriesByChefId(
            chefId: params.chefId,
            isPreOrder: params.isPreOrder,
            pagination: params.pagination,
          )
          .run();
}

class GetCustomerCategoriesByChefIdParams extends Params {
  final String chefId;
  final bool isPreOrder;
  final Pagination? pagination;

  GetCustomerCategoriesByChefIdParams({
    required this.chefId,
    this.isPreOrder = false,
    this.pagination,
  });

  @override
  List<Object?> get props => [isPreOrder, pagination];
}
