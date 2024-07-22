import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/food_delivery/chef/data/respositories/chef_repo.dart';

class IsFavouriteChef extends UseCase<bool, IsFavouriteChefParams> {
  final ChefRepo repo;

  IsFavouriteChef({ChefRepo? repo}) : repo = repo ?? getIt<ChefRepo>();

  @override
  Future<Either<Failure, bool>> call(IsFavouriteChefParams params) =>
      repo.isFavouriteChef(params.chefId).run();
}

class IsFavouriteChefParams extends Params {
  final String chefId;

  IsFavouriteChefParams(this.chefId);

  @override
  List<Object?> get props => [chefId];
}
