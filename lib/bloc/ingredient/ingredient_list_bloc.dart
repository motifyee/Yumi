import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/service/ingredient_service.dart';

part 'ingredient_list_event.dart';
part 'ingredient_list_state.dart';

class IngredientListBloc
    extends Bloc<IngredientListEvent, IngredientListState> {
  IngredientListBloc() : super(IngredientListState(ingredients: const [])) {
    on<IngredientListUpdateEvent>((event, emit) async {
      final res =
          await IngredientService.getIngredients(context: event.context);

      List<IngredientsModel> data = res['data']
          .map<IngredientsModel>((value) => IngredientsModel.fromJson(value))
          .toList();

      emit(state.copyWith(ingredients: data));
    });
  }
}
