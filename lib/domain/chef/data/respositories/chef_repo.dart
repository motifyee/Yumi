import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/chef/entity/chef.dart';
import 'package:yumi/domain/chef/entity/chef_work_status.dart';
import 'package:yumi/statics/pagination.dart';

abstract class ChefRepo {
  TaskEither<Failure, Pagination<Chef>> getChefs({
    required bool isPreOrder,
    required double latitude,
    required double longitude,
    required ChefWorkStatus? workStatus,
    required Pagination pagination,
  });
  TaskEither<Failure, ChefWorkStatus> getChefWorkStatus(String chefId);
  TaskEither<Failure, bool> isFavouriteChef(String chefId);
  TaskEither<Failure, Pagination<Chef>> getFavouriteChefs(
      Pagination pagination);
  TaskEither<Failure, bool> addFavouriteChef(String chefId);
  TaskEither<Failure, bool> removeFavouriteChef(String chefId);
}
