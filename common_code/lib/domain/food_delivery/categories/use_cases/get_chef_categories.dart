import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/food_delivery/categories/data/repo/categories_repo.dart';

class GetChefCategories
    extends UseCase<PaginatedData<Category>, GetChefCategoriesParams> {
  final CategoriesRepo repo;

  GetChefCategories({CategoriesRepo? repo})
      : repo = repo ?? getIt<CategoriesRepo>();

  @override
  Future<Either<Failure, PaginatedData<Category>>> call(
    GetChefCategoriesParams params,
  ) =>
      repo
          .getChefCategories(
            isPreOrder: params.isPreOrder,
            pagination: params.pagination,
          )
          .run();
}

class GetChefCategoriesParams extends Params {
  final bool isPreOrder;
  final PaginatedData? pagination;

  GetChefCategoriesParams({this.isPreOrder = false, this.pagination});

  @override
  List<Object?> get props => [isPreOrder, pagination];
}
