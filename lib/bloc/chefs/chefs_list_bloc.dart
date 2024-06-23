import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/domain/address/entity/address.dart';
import 'package:yumi/domain/user/cubit/user_cubit.dart';

import 'package:yumi/domain/chef/entity/chef.dart';
import 'package:yumi/app/pages/menu/meal_model.dart';
import 'package:yumi/service/chef_service.dart';
import 'package:yumi/statics/pager.dart';

part 'chefs_list_event.dart';
part 'chefs_list_state.dart';

class ChefsListBloc extends Bloc<ChefsListEvent, ChefsListState> {
  ChefsListBloc()
      : super(ChefsListState(chefs: const [], pager: const Pager())) {
    on<GetChefsListEvent>((event, emit) async {
      Address? userLocation = event.context.read<UserCubit>().state.address;

      if (userLocation?.latitude == null || userLocation?.longitude == null) {
        return;
      }

      if (state.pager.pageNumber < state.pager.lastPage &&
          !state.pager.isLoading) {
        emit(state.copyWith(pager: state.pager.copyWith(isLoading: true)));

        late Response res;
        List<Chef> data = [];
        if (event.isFavorite) {
          res = await ChefService.getFavoriteChefs(
            queryParameters: state.pager.toJson(),
          );
          data = res.data['data']
              .map<Chef>((chef) => Chef.fromJson({...chef, ...chef['chef']}))
              .toList();
        } else {
          res = await ChefService.getChefs(
            context: event.context,
            isPreOrder: event.menuTarget == MenuTarget.preOrder,
            latitude: userLocation!.latitude!,
            longitude: userLocation.longitude!,
            status: event.status,
            queryParameters: state.pager.toJson(),
          );

          data = res.data['data']
              .map<Chef>((chef) => Chef.fromJson({...?chef, ...?chef?['chef']}))
              .toList();
        }

        emit(state.copyWith(
          chefs: [...state.chefs, ...data],
          pager: state.pager.copyWith(
            pageNumber: res.data['pagination']['page'],
            lastPage: res.data['pagination']['pages'],
            isLoading: false,
          ),
        ));
      }
    });

    on<GetChefIsFavoriteEvent>((event, emit) async {
      final Response res =
          await ChefService.getIsChefFavorite(chefId: event.chef.id!);
      if (res.statusCode == 200) {
        List<Chef> chefs = List.from(state.chefs);
        chefs[chefs.indexWhere((e) => e.id == event.chef.id)] =
            chefs[chefs.indexWhere((e) => e.id == event.chef.id)]
                .copyWith(isFavorite: res.data['isChefFavorit']);

        emit(state.copyWith(chefs: chefs));
      }
    });

    on<AddChefToFavoriteEvent>((event, emit) async {
      final Response res =
          await ChefService.addFavoriteChef(chefId: event.chef.id!);
      if (res.statusCode == 200) {
        List<Chef> chefs = state.chefs;
        // ..firstWhere((e) => e.id == event.chef.id).isFavorite = true;

        emit(state.copyWith(chefs: chefs));
      }
    });

    on<RemoveChefToFavoriteEvent>((event, emit) async {
      final Response res =
          await ChefService.removeFavoriteChef(chefId: event.chef.id!);
      if (res.statusCode == 200) {
        List<Chef> chefs = state.chefs;
        // ..firstWhere((e) => e.id == event.chef.id).isFavorite = false;

        emit(state.copyWith(chefs: chefs));
      }
    });

    on<ResetChefsListEvent>((event, emit) {
      emit(ChefsListState(chefs: const [], pager: const Pager()));
    });
  }
}
