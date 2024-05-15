import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/pages/auth/registeration/model/address.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/domain/chef/entity/chef.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/service/chef_service.dart';
import 'package:yumi/statics/pagination_helper.dart';

part 'chefs_list_event.dart';
part 'chefs_list_state.dart';

class ChefsListBloc extends Bloc<ChefsListEvent, ChefsListState> {
  ChefsListBloc()
      : super(ChefsListState(
            chefs: const [], paginationHelper: const PaginationHelper())) {
    on<GetChefsListEvent>((event, emit) async {
      Address? userLocation = event.context.read<UserBloc>().state.address;
      if (userLocation == null ||
          userLocation.latitude == null ||
          userLocation.longitude == null) {
        return;
      }

      if (state.paginationHelper.pageNumber < state.paginationHelper.lastPage &&
          !state.paginationHelper.isLoading) {
        emit(state.copyWith(
            paginationHelper:
                state.paginationHelper.copyWith(isLoading: true)));

        late Response res;
        List<Chef> data = [];
        if (event.isFavorite) {
          res = await ChefService.getFavoriteChefs(
            queryParameters: state.paginationHelper.toJson(),
          );
          data = res.data['data']
              .map<Chef>((chef) => Chef.fromJson({...chef, ...chef['chef']}))
              .toList();
        } else {
          res = await ChefService.getChefs(
            context: event.context,
            isPreOrder: event.menuTarget == MenuTarget.preOrder,
            latitude: userLocation.latitude!,
            longitude: userLocation.longitude!,
            queryParameters: state.paginationHelper.toJson(),
          );

          data = res.data['data']
              .map<Chef>((chef) => Chef.fromJson({...?chef, ...?chef?['chef']}))
              .toList();
        }

        emit(state.copyWith(
          chefs: [...state.chefs, ...data],
          paginationHelper: state.paginationHelper.copyWith(
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
        List<Chef> chefs = state.chefs;
        // ..firstWhere((e) => e.id == event.chef.id).isFavorite = true;

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
      emit(ChefsListState(
          chefs: const [], paginationHelper: const PaginationHelper()));
    });
  }
}
