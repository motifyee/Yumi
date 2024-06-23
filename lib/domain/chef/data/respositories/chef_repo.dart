import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/chef/entity/chef.dart';
import 'package:yumi/statics/pagination.dart';

abstract class ChefRepo {
  TaskEither<Failure, List<Chef>> getChefs({
    required bool isPreOrder,
    required double latitude,
    required double longitude,
    required ChefWorkStatus status,
    required Pagination pagination,
  });
  TaskEither<Failure, ChefWorkStatus> getChefWorkStatus(String chefId);
  TaskEither<Failure, bool> isFavouriteChef(String chefId);
  TaskEither<Failure, List<Chef>> getFavouriteChefs(Pagination pagination);
  TaskEither<Failure, bool> addFavouriteChef(String chefId);
  TaskEither<Failure, bool> removeFavouriteChef(String chefId);
}
