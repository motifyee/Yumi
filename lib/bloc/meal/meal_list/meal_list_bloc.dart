import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/util/status.dart';
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
        emit(
          state.copyWith(
              paginationHelper:
                  state.paginationHelper.copyWith(isLoading: true)),
        );

        late dynamic res = [];
        List<MealModel> data = [];

        if (event.chefId == null) {
          if (state.selectedCategory == 0) {
            res = await MealService.getMeals(
              context: event.context,
              isPreorder: event.menuTarget != null
                  ? event.menuTarget == MenuTarget.preOrder
                  : state.menuTarget == MenuTarget.preOrder,
              queryParameters: {...state.paginationHelper.toJson()},
            );

            data = res['data'].map<MealModel>((value) {
              return MealModel.fromJson(value);
            }).toList();
          } else {
            res = await MealService.getMealsByCategory(
              context: event.context,
              categoryId: state.selectedCategory,
              isPreorder: event.menuTarget != null
                  ? event.menuTarget == MenuTarget.preOrder
                  : state.menuTarget == MenuTarget.preOrder,
              pagination: {...state.paginationHelper.toJson()},
            );

            data = res['data'].map<MealModel>((value) {
              return MealModel.fromJson(value['product']);
            }).toList();
          }
        }
        if (event.chefId != null) {
          if (state.selectedCategory == 0) {
            res = await MealService.getMealsByChef(
              context: event.context,
              chefId: event.chefId,
              isPreorder: event.menuTarget != null
                  ? event.menuTarget == MenuTarget.preOrder
                  : state.menuTarget == MenuTarget.preOrder,
              queryParameters: {...state.paginationHelper.toJson()},
            );

            data = res['data'].map<MealModel>((value) {
              return MealModel.fromJson(value);
            }).toList();
          } else {
            res = await MealService.getMealsByChefByCategory(
              context: event.context,
              chefId: event.chefId,
              categoryId: state.selectedCategory,
              isPreorder: event.menuTarget != null
                  ? event.menuTarget == MenuTarget.preOrder
                  : state.menuTarget == MenuTarget.preOrder,
              pagination: {...state.paginationHelper.toJson()},
            );

            data = res['data'].map<MealModel>((value) {
              return MealModel.fromJson(value['product']);
            }).toList();
          }
        }

        emit(state.copyWith(
            meals: [...state.meals, ...data],
            paginationHelper: state.paginationHelper.copyWith(
              pageNumber: res['pagination']['page'],
              lastPage: res['pagination']['pages'],
              isLoading: false,
            )));
      }
    });

    on<MealListUpdateCaloriesEvent>((event, emit) async {
      if (state.paginationHelper.pageNumber < state.paginationHelper.lastPage &&
          !state.paginationHelper.isLoading) {
        emit(state.copyWith(
            paginationHelper: state.paginationHelper
                .copyWith(isLoading: true, pageSize: 100)));

        late dynamic res = [];
        List<MealModel> data = [];

        res = await MealService.getMealsCalories(
            context: event.context,
            pagination: {...state.paginationHelper.toJson()});

        data = res['data'].map<MealModel>((value) {
          return MealModel.fromJson(value);
        }).toList();

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
      emit(
        state.copyWith(
          meals: [],
          selectedCategory: event.selectedCategory,
          paginationHelper: PaginationHelper(),
        ),
      );

      add(MealListUpdateEvent(
        context: event.context,
        chefId: event.chefId,
      ));
    });

    on<MealListResetEvent>((event, emit) {
      emit(MealListState(
        meals: const [],
        selectedCategory: event.categoryId ?? 0,
        paginationHelper: PaginationHelper(),
        menuTarget: event.menuTarget ?? state.menuTarget,
      ));
    });
  }
}
