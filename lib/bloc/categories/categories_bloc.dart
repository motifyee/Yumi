import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:yumi/model/categories_model.dart';
import 'package:yumi/service/categories_service.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesState(categoriesModelList: const [])) {
    on<GetCategoriesEvent>((event, emit) async {
      final res = await CategoriesService.getCategories(context: event.context);

      List<CategoriesModel> data = [];

      data = res['data'].map<CategoriesModel>((value) {
        return CategoriesModel.fromJson(value);
      }).toList();
      emit(CategoriesState.copyWith(categoriesModelListed: data));
    });
  }
}
