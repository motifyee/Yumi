import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/domain/user/cubit/user_cubit.dart';

import 'package:yumi/global.dart';
import 'package:yumi/model/categories_model.dart';
import 'package:yumi/service/categories_service.dart';
import 'package:yumi/statics/pagination_helper.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc()
      : super(CategoriesState(
            categoriesModelList: const [],
            categoriesModelListLength: 0,
            paginationHelper: const PaginationHelper())) {
    on<GetCategoriesEvent>((event, emit) async {
      if (state.paginationHelper.pageNumber < state.paginationHelper.lastPage &&
          !state.paginationHelper.isLoading) {
        emit(state.copyWith(
            paginationHelper:
                state.paginationHelper.copyWith(isLoading: true)));

        dynamic res;

        if (AppTarget.user == AppTargetUser.customers) {
          if (event.chefId == null) {
            res = await CategoriesService.getCategoriesForCustomer(
              pagination: state.paginationHelper.toJson(),
              isPreOrder: event.isPreOrder,
              lat: G.context.read<UserCubit>().state.address?.latitude,
              long: G.context.read<UserCubit>().state.address?.longitude,
            );
          } else {
            res = await CategoriesService.getCategoriesForCustomerByChefId(
              pagination: state.paginationHelper.toJson(),
              isPreOrder: event.isPreOrder,
              chefId: event.chefId!,
            );
          }
        }

        if (AppTarget.user == AppTargetUser.chefs) {
          if (event.isAll) {
            res = await CategoriesService.getCategories(
              pagination: state.paginationHelper.toJson(),
              isPreOrder: event.isPreOrder,
            );
          } else {
            res = await CategoriesService.getCategoriesForChef(
              pagination: state.paginationHelper.toJson(),
              isPreOrder: event.isPreOrder,
            );
          }
        }

        List<CategoriesModel> data = [];
        data = res['data'].map<CategoriesModel>((value) {
          return CategoriesModel.fromJson(value);
        }).toList();

        emit(state.copyWith(
          categoriesModelListed: [...state.categoriesModelList, ...data],
          paginationHelper: state.paginationHelper.copyWith(
            pageNumber: res['pagination']['page'],
            lastPage: res['pagination']['pages'],
            isLoading: false,
          ),
        ));
      }
    });

    on<ResetCategoryEvent>((event, emit) {
      emit(CategoriesState(
        categoriesModelList: const [],
        categoriesModelListLength: 0,
        paginationHelper: const PaginationHelper(),
      ));
    });
  }
}
