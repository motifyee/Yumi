import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/service/meal_service.dart';
import 'package:yumi/statics/pagination_helper.dart';

part 'meal_list_event.dart';
part 'meal_list_state.dart';

class MealListBloc extends Bloc<MealListEvent, MealListState> {
  MealListBloc()
      : super(MealListState(
          meals: const [],
          selectedCategory: 0,
          paginationHelper: PaginationHelper(),
          menuTarget: MenuTarget.order,
        )) {
    on<MealListUpdateEvent>((event, emit) async {
      if (state.paginationHelper.pageNumber < state.paginationHelper.lastPage &&
          !state.paginationHelper.isLoading) {
        emit(state.copyWith(
            paginationHelper:
                state.paginationHelper.copyWith(isLoading: true)));

        late dynamic res = [];
        List<MealModel> data = [];

        if (state.selectedCategory == 0) {
          if (state.menuTarget == MenuTarget.order) {
            res = await MealService.getMeals(
                context: event.context,
                queryParameters: {...state.paginationHelper.toJson()});
          }
          if (state.menuTarget == MenuTarget.preOrder) {
            res = await MealService.getMealsPre(
                context: event.context,
                queryParameters: {...state.paginationHelper.toJson()});
          }
          data = res['data'].map<MealModel>((value) {
            return MealModel.fromJson(value);
          }).toList();
        } else {
          if (state.menuTarget == MenuTarget.order) {
            res = await MealService.getMealsByCategory(
                context: event.context,
                id: state.selectedCategory,
                queryParameters: {...state.paginationHelper.toJson()});
          }
          if (state.menuTarget == MenuTarget.preOrder) {
            res = await MealService.getMealsPreByCategory(
                context: event.context,
                id: state.selectedCategory,
                queryParameters: {...state.paginationHelper.toJson()});
          }

          data = res['data'].map<MealModel>((value) {
            return MealModel.fromJson(value['product']);
          }).toList();
        }

        emit(state.copyWith(
            meals: data,
            paginationHelper: state.paginationHelper.copyWith(
              pageNumber: res['pagination']['page'],
              lastPage: res['pagination']['pages'],
              isLoading: false,
            )));
      }
    });

    on<MealListUpdateCategoryEvent>((event, emit) {
      emit(state.copyWith(
          meals: [],
          selectedCategory: event.selectedCategory,
          paginationHelper: PaginationHelper()));

      event.context
          .read<MealListBloc>()
          .add(MealListUpdateEvent(context: event.context));
    });

    on<MealListResetEvent>((event, emit) {
      emit(MealListState(
        meals: const [],
        selectedCategory: 0,
        paginationHelper: PaginationHelper(),
        menuTarget: event.menuTarget ?? state.menuTarget,
      ));
    });
  }
}
