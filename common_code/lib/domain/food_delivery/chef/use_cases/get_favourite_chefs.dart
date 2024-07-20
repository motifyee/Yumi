import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/food_delivery/chef/data/respositories/chef_repo.dart';
import 'package:common_code/domain/food_delivery/chef/entity/chef.dart';

import 'package:common_code/domain/entities/pagination.dart';

class GetFavouriteChefs
    extends UseCase<PaginatedData<Chef>, GetFavouriteChefsParam> {
  final ChefRepo repo;

  GetFavouriteChefs({ChefRepo? repo}) : repo = repo ?? getIt<ChefRepo>();

  @override
  Future<Either<Failure, PaginatedData<Chef>>> call(
          GetFavouriteChefsParam params) =>
      repo.getFavouriteChefs(params.pagination).run();
}

class GetFavouriteChefsParam extends Params {
  final Pagination pagination;

  GetFavouriteChefsParam(this.pagination);

  @override
  List<Object?> get props => [pagination];
}
