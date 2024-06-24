import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/domain/address/entity/address.dart';
import 'package:yumi/domain/chef/entity/chef.dart';
import 'package:yumi/domain/chef/use_cases/add_favourite_chef.dart';
import 'package:yumi/domain/chef/use_cases/get_chefs.dart';
import 'package:yumi/domain/chef/use_cases/get_favourite_chefs.dart';
import 'package:yumi/domain/chef/use_cases/is_favourite_chef.dart';
import 'package:yumi/domain/chef/use_cases/remove_favourite_chef.dart';
import 'package:yumi/domain/user/cubit/user_cubit.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/pagination.dart';

part 'chef_state.dart';
part 'chef_cubit.freezed.dart';

class ChefsCubit extends Cubit<ChefsState> {
  ChefsCubit() : super(ChefsState());

  Future<void> getChefs({
    required bool isPreOrder,
    required double latitude,
    required double longitude,
    required ChefWorkStatus status,
    required Pagination pagination,
  }) async {
    Address? userLocation = G.rd<UserCubit>().state.address;

    if (userLocation?.latitude == null || userLocation?.longitude == null) {
      return;
    }

    if (!state.chefs.canRequest) return;
    emit(state.copyWith.chefs(isLoading: true));

    final params = GetChefsParam(
      isPreOrder: isPreOrder,
      latitude: latitude,
      longitude: longitude,
      status: status,
      pagination: pagination,
    );
    final chefs = await GetChefs().call(params);

    chefs.fold(
      (l) => emit(state.copyWith.chefs(isLoading: false)),
      (r) => emit(
        state.copyWith(
          chefs: r.copyWith(
            data: [...r.data, ...state.chefs.data],
          ) as Pagination<Chef>,
        ),
      ),
    );
  }

  Future<void> getFavouriteChefs({
    required Pagination pagination,
  }) async {
    Address? userLocation = G.rd<UserCubit>().state.address;

    if (userLocation?.latitude == null || userLocation?.longitude == null) {
      return;
    }

    if (!state.chefs.canRequest) return;

    emit(state.copyWith.chefs(isLoading: true));

    final params = GetFavouriteChefsParam(pagination);
    final favouriteChefs = await GetFavouriteChefs().call(params);

    favouriteChefs.fold(
      (l) => emit(state.copyWith.chefs(isLoading: false)),
      (r) => emit(
        state.copyWith(
          chefs: r.copyWith(
            data: [...r.data, ...state.chefs.data],
          ) as Pagination<Chef>,
        ),
      ),
    );
  }

  Future<bool?> isFavouriteChef({
    required Chef chef,
  }) async {
    if (chef.id?.isEmpty ?? true) return null;

    final params = IsFavouriteChefParam(chef.id!);
    final isFavourite = await IsFavouriteChef().call(params);

    return isFavourite.fold(
      (l) => null,
      (r) {
        final chefs = List<Chef>.from(state.chefs.data);
        final chefIdx = chefs.indexWhere((c) => c.id == chef.id);
        chefs[chefIdx] = chef.copyWith(isFavorite: r);

        emit(state.copyWith.chefs(data: chefs));

        return r;
      },
    );
  }

  Future<bool> addFavouriteChef({
    required Chef chef,
  }) async {
    if (chef.id?.isEmpty ?? true) return false;

    final params = AddFavouriteChefParam(chef.id!);
    final favouriteChef = await AddFavouriteChef().call(params);

    return favouriteChef.fold(
      (l) => false,
      (r) {
        final chefs = List<Chef>.from(state.chefs.data);
        final chefIdx = chefs.indexWhere((c) => c.id == chef.id);
        chefs[chefIdx] = chef.copyWith(isFavorite: r);

        emit(state.copyWith.chefs(data: chefs));

        return r;
      },
    );
  }

  Future<bool> removeFavouriteChef({
    required Chef chef,
  }) async {
    if (chef.id?.isEmpty ?? true) return false;

    final params = RemoveFavouriteChefParam(chef.id!);
    final favouriteChef = await RemoveFavouriteChef().call(params);

    return favouriteChef.fold(
      (l) => false,
      (r) {
        final chefs = List<Chef>.from(state.chefs.data);
        final chefIdx = chefs.indexWhere((c) => c.id == chef.id);
        chefs[chefIdx] = chef.copyWith(isFavorite: r);

        emit(state.copyWith.chefs(data: chefs));

        return r;
      },
    );
  }

  Future<void> reset() async {
    emit(ChefsState());
  }
}
// }
