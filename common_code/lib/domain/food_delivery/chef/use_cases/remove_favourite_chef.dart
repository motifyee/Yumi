import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/food_delivery/chef/data/respositories/chef_repo.dart';

class RemoveFavouriteChef extends UseCase<bool, RemoveFavouriteChefParams> {
  final ChefRepo repo;

  RemoveFavouriteChef({ChefRepo? repo}) : repo = repo ?? getIt<ChefRepo>();

  @override
  Future<Either<Failure, bool>> call(RemoveFavouriteChefParams params) =>
      repo.removeFavouriteChef(params.chefId).run();
}

class RemoveFavouriteChefParams extends Params {
  final String chefId;

  RemoveFavouriteChefParams(this.chefId);

  @override
  List<Object?> get props => [chefId];
}
