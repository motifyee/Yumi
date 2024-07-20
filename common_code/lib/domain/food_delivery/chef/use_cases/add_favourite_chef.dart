import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/food_delivery/chef/data/respositories/chef_repo.dart';

class AddFavouriteChef extends UseCase<bool, AddFavouriteChefParams> {
  final ChefRepo repo;

  AddFavouriteChef({ChefRepo? repo}) : repo = repo ?? getIt<ChefRepo>();

  @override
  Future<Either<Failure, bool>> call(AddFavouriteChefParams params) =>
      repo.addFavouriteChef(params.chefId).run();
}

class AddFavouriteChefParams extends Params {
  final String chefId;

  AddFavouriteChefParams(this.chefId);

  @override
  List<Object?> get props => [chefId];
}
