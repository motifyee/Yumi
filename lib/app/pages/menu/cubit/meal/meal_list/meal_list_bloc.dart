import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/domain/user/cubit/user_cubit.dart';

import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/global.dart';
import 'package:yumi/app/pages/menu/meal.dart';
import 'package:yumi/service/meal_service.dart';
import 'package:yumi/statics/pagination.dart';

part 'meal_list_event.dart';
part 'meal_list_state.dart';

class MealListBloc extends Bloc<MealListEvent, MealListState> {
  MealListBloc()
      : super(MealListState(
          meals: const [],
          selectedCategory: 0,
          pagination: const Pagination(),
          menuTarget: MenuTarget.order,
        )) {
    on<MealListUpdateEvent>((event, emit) async {
      if (state.pagination.pageNumber < state.pagination.lastPage &&
          !state.pagination.isLoading) {
        emit(
          state.copyWith(
              pagination: state.pagination.copyWith(isLoading: true)),
        );

        late dynamic res = [];
        List<Meal> data = [];

        try {
          if (event.chefId == null) {
            if (state.selectedCategory == 0) {
              res = await MealService.getMeals(
                context: event.context ?? G.cContext,
                lat: G.context.read<UserCubit>().state.address?.latitude,
                long: G.context.read<UserCubit>().state.address?.longitude,
                isPreorder: event.menuTarget != null
                    ? event.menuTarget == MenuTarget.preOrder
                    : state.menuTarget == MenuTarget.preOrder,
                queryParameters: {...state.pagination.toJson()},
              );

              data = res['data'].map<Meal>((value) {
                return Meal.fromJson({
                  ...?value,
                  ...?value['meal'],
                  ...?value['product'],
                });
              }).toList();
            } else {
              res = await MealService.getMealsByCategory(
                context: event.context ?? G.cContext,
                categoryId: state.selectedCategory,
                lat: G.context.read<UserCubit>().state.address?.latitude,
                long: G.context.read<UserCubit>().state.address?.longitude,
                isPreorder: event.menuTarget != null
                    ? event.menuTarget == MenuTarget.preOrder
                    : state.menuTarget == MenuTarget.preOrder,
                pagination: {...state.pagination.toJson()},
              );

              data = res['data'].map<Meal>((value) {
                return Meal.fromJson({
                  ...?value,
                  ...?value['meal'],
                  ...?value['product'],
                });
              }).toList();
            }
          }
          if (event.chefId != null) {
            if (state.selectedCategory == 0) {
              res = await MealService.getMealsByChef(
                context: event.context ?? G.cContext,
                chefId: event.chefId,
                isPreorder: event.menuTarget != null
                    ? event.menuTarget == MenuTarget.preOrder
                    : state.menuTarget == MenuTarget.preOrder,
                queryParameters: {...state.pagination.toJson()},
              );

              data = res['data'].map<Meal>((value) {
                return Meal.fromJson({
                  ...?value,
                  ...?value['meal'],
                  ...?value['product'],
                });
              }).toList();
            } else {
              res = await MealService.getMealsByChefByCategory(
                context: event.context ?? G.cContext,
                chefId: event.chefId,
                categoryId: state.selectedCategory,
                isPreorder: event.menuTarget != null
                    ? event.menuTarget == MenuTarget.preOrder
                    : state.menuTarget == MenuTarget.preOrder,
                pagination: {...state.pagination.toJson()},
              );

              data = res['data'].map<Meal>((value) {
                return Meal.fromJson({
                  ...?value,
                  ...?value['meal'],
                  ...?value['product'],
                });
              }).toList();
            }
          }

          emit(state.copyWith(
              meals: [...state.meals, ...data],
              pagination: state.pagination.copyWith(
                pageNumber: res['pagination']['page'],
                lastPage: res['pagination']['pages'],
                isLoading: false,
              )));
        } catch (e) {
          emit(state.copyWith(
              pagination: state.pagination.copyWith(
            isLoading: false,
          )));
        }
      }
    });

    on<MealListUpdateCategoryEvent>((event, emit) {
      if (state.pagination.isLoading) return;
      emit(
        state.copyWith(
          meals: [],
          selectedCategory: event.selectedCategory,
          pagination: const Pagination(),
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
        pagination: const Pagination(),
        menuTarget: event.menuTarget ?? state.menuTarget,
      ));
    });

    on<MealListGetFavoriteMealsEvent>((event, emit) async {
      if (state.pagination.pageNumber < state.pagination.lastPage &&
          !state.pagination.isLoading) {
        emit(
          state.copyWith(
              pagination: state.pagination.copyWith(isLoading: true)),
        );

        Response res = await MealService.getFavoriteMeals(
            pagination: {...state.pagination.toJson()});

        List<Meal> data = res.data['data'].map<Meal>((value) {
          return Meal.fromJson({
            ...value,
            'id': value['productId'],
            'isFavoritProduct': true,
          });
        }).toList();

        emit(state.copyWith(
            meals: [...state.meals, ...data],
            pagination: state.pagination.copyWith(
              pageNumber: res.data['pagination']['page'],
              lastPage: res.data['pagination']['pages'],
              isLoading: false,
            )));
      }
    });

    on<MealListAddFavoriteMealEvent>((event, emit) async {
      Response res = await MealService.addMealToFavorite(meal: event.meal);
      if (res.statusCode == 200) {
        List<Meal> meals = List.from(state.meals);
        if (meals.indexWhere((e) => e.id == event.meal.id) > -1) {
          final idx = meals.indexWhere((e) => e.id == event.meal.id);
          meals[idx] = meals[idx].copyWith(isFavoritProduct: true);
        } else {
          meals.add(event.meal.copyWith(isFavoritProduct: true));
        }
        emit(state.copyWith(
          meals: meals,
        ));
      }
    });

    on<MealListRemoveFavoriteMealEvent>((event, emit) async {
      Response res = await MealService.removeMealToFavorite(meal: event.meal);
      if (res.statusCode == 200) {
        List<Meal> meals = List.from(state.meals);
        if (meals.indexWhere((e) => e.id == event.meal.id) > -1) {
          final idx = meals.indexWhere((e) => e.id == event.meal.id);
          meals[idx] = meals[idx].copyWith(isFavoritProduct: true);
        } else {
          meals.add(event.meal.copyWith(isFavoritProduct: false));
        }
        emit(state.copyWith(
          meals: meals,
        ));
      }
    });

    on<MealListResetBlocEvent>((event, emit) {
      emit(MealListState(
        meals: const [],
        selectedCategory: 0,
        pagination: const Pagination(),
        menuTarget: MenuTarget.order,
      ));
    });
  }
}
