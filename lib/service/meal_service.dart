import 'dart:convert';

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
}
