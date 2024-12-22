import 'package:common_code/common_code.dart';

abstract class ChefSrc {
  Future<PaginatedData<Chef>> getChefs({
    required bool isPreOrder,
    required double latitude,
    required double longitude,
    required ChefWorkStatus? workStatus,
    required Pagination pagination,
  });
  Future<ChefWorkStatus> getChefWorkStatus(String chefId);
  Future<bool> isFavouriteChef(String chefId);
  Future<PaginatedData<Chef>> getFavouriteChefs(Pagination paginatedData);
  Future<bool> addFavouriteChef(String chefId);
  Future<bool> removeFavouriteChef(String chefId);
}
