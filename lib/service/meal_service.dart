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

  static Future<dynamic> getMeals(
      {required BuildContext context,
      required Map<String, dynamic>? queryParameters}) async {
    final res = await DioClient.simpleDio(context).get(
        ApiKeys.getApiKeyString(apiKey: ApiKeys.mealOrder),
        queryParameters: queryParameters);

    return jsonDecode(res.toString());
  }

  static Future<dynamic> getMealsByCategory(
      {required BuildContext context,
      required int id,
      required Map<String, dynamic>? queryParameters}) async {
    final res = await DioClient.simpleDio(context).get(
        '${ApiKeys.getApiKeyString(apiKey: ApiKeys.mealOrderByCategory)}$id',
        queryParameters: queryParameters);

    return jsonDecode(res.toString());
  }
}
