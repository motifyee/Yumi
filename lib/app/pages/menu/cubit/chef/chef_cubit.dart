import 'package:dependencies/dependencies.dart';
import 'package:common_code/domain/address/entity/address.dart';
import 'package:common_code/domain/food_delivery/chef/entity/chef.dart';
import 'package:common_code/domain/food_delivery/chef/entity/chef_work_status.dart';
import 'package:common_code/domain/food_delivery/chef/use_cases/add_favourite_chef.dart';
import 'package:common_code/domain/food_delivery/chef/use_cases/get_chefs.dart';
import 'package:common_code/domain/food_delivery/chef/use_cases/get_favourite_chefs.dart';
import 'package:common_code/domain/food_delivery/chef/use_cases/is_favourite_chef.dart';
import 'package:common_code/domain/food_delivery/chef/use_cases/remove_favourite_chef.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:yumi/global.dart';
import 'package:common_code/domain/entities/pagination.dart';

part 'chef_state.dart';
part 'chef_cubit.freezed.dart';

class ChefsCubit extends Cubit<ChefsState> {
  ChefsCubit() : super(ChefsState());

  Future<void> getChefs({
    required bool isPreOrder,
    ChefWorkStatus? status,
  }) async {
    final Address? userLocation = G().rd<UserCubit>().state.address;
    if (userLocation?.latitude == null) return;
    if (userLocation?.longitude == null) return;

    if (!state.chefsPagination.canRequest) return;
    emit(state.copyWith.chefsPagination(isLoading: true));

    final params = GetChefsParam(
      status: status,
      isPreOrder: isPreOrder,
      pagination: state.chefsPagination,
      latitude: userLocation!.latitude!,
      longitude: userLocation.longitude!,
    );
    final chefs = await GetChefs().call(params);

    if (isClosed) return;

    chefs.fold(
      (l) => emit(
        state.copyWith(
          chefsPagination: state.chefsPagination.copyWith(isLoading: false),
          error: l.error.toString(),
          errorReported: false,
        ),
      ),
      (r) => emit(
        state.copyWith(
          chefs: [...r.data, ...state.chefs],
          chefsPagination: r.pagination.copyWith(isLoading: false),
        ),
      ),
    );
  }

  Future<void> getFavouriteChefs() async {
    final Address? userLocation = G().rd<UserCubit>().state.address;

    if (userLocation?.latitude == null || userLocation?.longitude == null) {
      return;
    }

    if (!state.chefsPagination.canRequest) return;

    emit(state.copyWith.chefsPagination(isLoading: true));

    final params = GetFavouriteChefsParam(state.chefsPagination);
    final favouriteChefs = await GetFavouriteChefs().call(params);

    if (isClosed) return;

    favouriteChefs.fold(
      (l) => emit(state.copyWith.chefsPagination(isLoading: false)),
      (r) => emit(
        state.copyWith(
          chefs: [...state.chefs, ...r.data],
          chefsPagination: r.pagination.copyWith(isLoading: false),
        ),
      ),
    );
  }

  Future<bool?> isFavouriteChef({
    required Chef chef,
  }) async {
    if (chef.id?.isEmpty ?? true) return null;

    final params = IsFavouriteChefParams(chef.id!);
    final isFavourite = await IsFavouriteChef().call(params);

    return isFavourite.fold(
      (l) => null,
      (r) {
        final chefs = List<Chef>.from(state.chefs);
        final chefIdx = chefs.indexWhere((c) => c.id == chef.id);
        chefs[chefIdx] = chef.copyWith(isFavorite: r);

        if (isClosed) return r;

        emit(state.copyWith(chefs: chefs));

        return r;
      },
    );
  }

  Future<bool> addFavouriteChef({
    required Chef chef,
  }) async {
    if (chef.id?.isEmpty ?? true) return false;

    final params = AddFavouriteChefParams(chef.id!);
    final favouriteChef = await AddFavouriteChef().call(params);

    return favouriteChef.fold(
      (l) => false,
      (r) {
        final chefs = List<Chef>.from(state.chefs);
        final chefIdx = chefs.indexWhere((c) => c.id == chef.id);
        chefs[chefIdx] = chef.copyWith(isFavorite: r);

        if (isClosed) return r;

        emit(state.copyWith(chefs: chefs));

        return r;
      },
    );
  }

  Future<bool> removeFavouriteChef({
    required Chef chef,
  }) async {
    if (chef.id?.isEmpty ?? true) return false;

    final params = RemoveFavouriteChefParams(chef.id!);
    final favouriteChef = await RemoveFavouriteChef().call(params);

    return favouriteChef.fold(
      (l) => false,
      (r) {
        final chefs = List<Chef>.from(state.chefs);
        final chefIdx = chefs.indexWhere((c) => c.id == chef.id);
        chefs[chefIdx] = chef.copyWith(isFavorite: r);

        if (isClosed) return r;

        emit(state.copyWith(chefs: chefs));

        return r;
      },
    );
  }

  Future<void> reset() async {
    if (!isClosed) emit(ChefsState());
  }
}
