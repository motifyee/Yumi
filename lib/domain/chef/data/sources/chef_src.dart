import 'package:yumi/domain/chef/entity/chef.dart';
import 'package:yumi/statics/pagination.dart';

abstract class ChefSrc {
  Future<Pagination<Chef>> getChefs({
    required bool isPreOrder,
    required double latitude,
    required double longitude,
    required ChefWorkStatus status,
    required Pagination pagination,
  });
  Future<ChefWorkStatus> getChefWorkStatus(String chefId);
  Future<bool> isFavouriteChef(String chefId);
  Future<Pagination<Chef>> getFavouriteChefs(Pagination pagination);
  Future<bool> addFavouriteChef(String chefId);
  Future<bool> removeFavouriteChef(String chefId);
}
