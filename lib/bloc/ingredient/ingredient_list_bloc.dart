import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:yumi/app/pages/menu/ingredient.dart';
import 'package:yumi/service/ingredient_service.dart';

part 'ingredient_list_event.dart';
part 'ingredient_list_state.dart';

class IngredientListBloc
    extends Bloc<IngredientListEvent, IngredientListState> {
  IngredientListBloc() : super(IngredientListState(ingredients: const [])) {
    on<IngredientListUpdateEvent>((event, emit) async {
      emit(state.copyWith(loading: true));

      final res =
          await IngredientService.getIngredients(context: event.context);

      List<Ingredient> data = res['data']
          .map<Ingredient>((value) => Ingredient.fromJson(value))
          .toList();

      emit(state.copyWith(ingredients: data, loading: false));
    });
  }
}
