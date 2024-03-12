import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/statics/api_statics.dart';

class MealService {
  static Future<dynamic> createMeal(
      {required BuildContext context, required MealModel mealModel}) async {
    final res = await DioClient.simpleDio(context).post(
        ApiKeys.getApiKeyString(apiKey: ApiKeys.meal),
        data: jsonEncode(mealModel.toJson()));
    return res.data;
  }

  static Future<dynamic> updateMeal(
      {required BuildContext context, required MealModel mealModel}) async {
    final res = await DioClient.simpleDio(context).put(
        '${ApiKeys.getApiKeyString(apiKey: ApiKeys.meal)}/${mealModel.id}',
        data: jsonEncode(mealModel.toJson()));
    return res.data;
  }

  static Future<dynamic> deleteMeal(
      {required BuildContext context, required MealModel mealModel}) async {
    final res = await DioClient.simpleDio(context).put(
        '${ApiKeys.getApiKeyString(apiKey: ApiKeys.meal)}/${mealModel.id}/delete',
        data: {"is_Deleted": true});
    return res.data;
  }

  static Future<dynamic> getMeals(
      {required BuildContext context,
      required Map<String, dynamic>? queryParameters,
      String? chefId,
      bool? isPreorder = false}) async {
    final res = await DioClient.simpleDio(context).get(
      ApiKeys.getApiKeyString(apiKey: ApiKeys.getMeal),
      queryParameters: {
        ...?queryParameters,
        'chefId': chefId,
        'isPreorder': isPreorder
      }..removeWhere((key, value) => value == null),
    );

    return jsonDecode(res.toString());
  }

  static Future<dynamic> getMealsByCategory(
      {required BuildContext context,
      required Map<String, dynamic>? pagination,
      required int? categoryId,
      String? chefId,
      bool? isPreorder = false}) async {
    final res = await DioClient.simpleDio(context).get(
      ApiKeys.getApiKeyString(apiKey: ApiKeys.getMealByCategory),
      queryParameters: {
        ...?pagination,
        'chefId': chefId,
        'CategoryId': categoryId,
        'isPreorder': isPreorder
      }..removeWhere((key, value) => value == null),
    );

    return jsonDecode(res.toString());
  }

  static Future<dynamic> getMealsCalories(
      {required BuildContext context,
      required Map<String, dynamic>? pagination}) async {
    final res = await DioClient.simpleDio(context).get(
        ApiKeys.getApiKeyString(apiKey: ApiKeys.mealCalories),
        queryParameters: pagination);

    return jsonDecode(res.toString());
  }
}
