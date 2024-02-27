import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:yumi/model/categories_model.dart';
import 'package:yumi/service/categories_service.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/statics/pagination_helper.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc()
      : super(CategoriesState(
            categoriesModelList: [],
            categoriesModelListLength: 0,
            pageNumber: 0,
            lastPage: 1)) {
    on<GetCategoriesEvent>((event, emit) async {
      if (state.pageNumber < state.lastPage && !state.isLoading) {
        emit(state.copyWith(isLoading: true));
        final res = await CategoriesService.getCategories(
          context: event.context,
          queryParameters: PaginationHelper.toJson(
            pageNumber: state.pageNumber + 1,
            pageSize: ApiKeys.pageSize,
          ),
        );

        List<CategoriesModel> data = [];
        data = res['data'].map<CategoriesModel>((value) {
          return CategoriesModel.fromJson(value);
        }).toList();

        emit(state.copyWith(
          categoriesModelListed: [...state.categoriesModelList, ...data],
          pageNumber: res['pagination']['page'],
          lastPage: res['pagination']['pages'],
          isLoading: false,
        ));
      }
    });

    on<ResetCategoryEvent>((event, emit) {
      emit(CategoriesState(
          categoriesModelList: [],
          categoriesModelListLength: 0,
          pageNumber: 0,
          lastPage: 1));
    });
  }
}
