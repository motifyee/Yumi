import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:yumi/model/chef_model.dart';
import 'package:yumi/service/chef_service.dart';
import 'package:yumi/statics/pagination_helper.dart';

part 'chefs_list_event.dart';
part 'chefs_list_state.dart';

class ChefsListBloc extends Bloc<ChefsListEvent, ChefsListState> {
  ChefsListBloc()
      : super(ChefsListState(
            chefs: [], chefsLength: 0, paginationHelper: PaginationHelper())) {
    on<GetChefsListEvent>((event, emit) async {
      if (state.paginationHelper.pageNumber < state.paginationHelper.lastPage &&
          !state.paginationHelper.isLoading) {
        emit(state.copyWith(
            paginationHelper:
                state.paginationHelper.copyWith(isLoading: true)));

        final Response res = await ChefService.getChefs(
            context: event.context,
            queryParameters: state.paginationHelper.toJson());

        List<ChefModel> data = res.data['data']
            .map<ChefModel>((chef) => ChefModel.fromJson(chef))
            .toList();

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

    on<ResetChefsListEvent>((event, emit) {
      emit(ChefsListState(
          chefs: [], chefsLength: 0, paginationHelper: PaginationHelper()));
    });
  }
}
