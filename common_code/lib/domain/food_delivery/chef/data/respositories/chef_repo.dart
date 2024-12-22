import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';

abstract class ChefRepo {
  TaskEither<Failure, PaginatedData<Chef>> getChefs({
    required bool isPreOrder,
    required double latitude,
    required double longitude,
    required ChefWorkStatus? workStatus,
    required Pagination pagination,
  });
  TaskEither<Failure, ChefWorkStatus> getChefWorkStatus(String chefId);
  TaskEither<Failure, bool> isFavouriteChef(String chefId);
  TaskEither<Failure, PaginatedData<Chef>> getFavouriteChefs(
    Pagination pagination,
  );
  TaskEither<Failure, bool> addFavouriteChef(String chefId);
  TaskEither<Failure, bool> removeFavouriteChef(String chefId);
}
