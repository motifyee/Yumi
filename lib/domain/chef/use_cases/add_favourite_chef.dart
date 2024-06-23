import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/chef/data/respositories/chef_repo.dart';

class AddFavouriteChef extends UseCase<bool, AddFavouriteChefParam> {
  final ChefRepo repo;

  AddFavouriteChef({ChefRepo? repo}) : repo = repo ?? getIt<ChefRepo>();

  @override
  Future<Either<Failure, bool>> call(AddFavouriteChefParam params) =>
      repo.addFavouriteChef(params.chefId).run();
}

class AddFavouriteChefParam extends Params {
  final String chefId;

  AddFavouriteChefParam(this.chefId);

  @override
  List<Object?> get props => [chefId];
}
