import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/food_delivery/categories/data/repo/categories_repo.dart';

class GetCustomerCategoriesByChefId extends UseCase<PaginatedData<Category>,
    GetCustomerCategoriesByChefIdParams> {
  final CategoriesRepo repo;

  GetCustomerCategoriesByChefId({CategoriesRepo? repo})
      : repo = repo ?? getIt<CategoriesRepo>();

  @override
  Future<Either<Failure, PaginatedData<Category>>> call(
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
  final PaginatedData? pagination;

  GetCustomerCategoriesByChefIdParams({
    required this.chefId,
    this.isPreOrder = false,
    this.pagination,
  });

  @override
  List<Object?> get props => [isPreOrder, pagination];
}
