import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/domain/user/cubit/user_cubit.dart';

import 'package:yumi/global.dart';
import 'package:yumi/domain/categories/entity/category.dart';
import 'package:yumi/service/categories_service.dart';
import 'package:yumi/statics/paginatedData.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc()
      : super(CategoriesState(
            categoriesModelList: const [],
            categoriesModelListLength: 0,
            pagination: const PaginatedData())) {
    on<GetCategoriesEvent>((event, emit) async {
      if (state.pagination.pageNumber < state.pagination.lastPage &&
          !state.pagination.isLoading) {
        emit(state.copyWith(
            pagination: state.pagination.copyWith(isLoading: true)));

        dynamic res;

        if (AppTarget.user == AppTargetUser.customers) {
          if (event.chefId == null) {
            res = await CategoriesService.getCategoriesForCustomer(
              pagination: state.pagination.toJson(),
              isPreOrder: event.isPreOrder,
              lat: G.context.read<UserCubit>().state.address?.latitude,
              long: G.context.read<UserCubit>().state.address?.longitude,
            );
          } else {
            res = await CategoriesService.getCategoriesForCustomerByChefId(
              pagination: state.pagination.toJson(),
              isPreOrder: event.isPreOrder,
              chefId: event.chefId!,
            );
          }
        }

        if (AppTarget.user == AppTargetUser.chefs) {
          if (event.isAll) {
            res = await CategoriesService.getCategories(
              pagination: state.pagination.toJson(),
              isPreOrder: event.isPreOrder,
            );
          } else {
            res = await CategoriesService.getCategoriesForChef(
              pagination: state.pagination.toJson(),
              isPreOrder: event.isPreOrder,
            );
          }
        }

        List<Category> data = [];
        data = res['data'].map<Category>((value) {
          return Category.fromJson(value);
        }).toList();

        emit(state.copyWith(
          categoriesModelListed: [...state.categoriesModelList, ...data],
          pagination: state.pagination.copyWith(
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
        pagination: const PaginatedData(),
      ));
    });
  }
}
