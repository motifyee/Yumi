import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yumi/domain/meal/entity/meal.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/util/code_generator.dart';

class MealService {
  static Future<dynamic> createMeal(
      {required BuildContext context, required Meal mealModel}) async {
    final res = await APIClient().post(
        EndPoints.getApiKeyString(apiKey: EndPoints.meal),
        data: jsonEncode(mealModel.toJson()));
    return res.data;
  }

  static Future<dynamic> updateMeal(
      {required BuildContext context, required Meal mealModel}) async {
    final res = await APIClient().put(
        '${EndPoints.getApiKeyString(apiKey: EndPoints.meal)}/${mealModel.id}',
        data: jsonEncode(mealModel.toJson()));
    return res.data;
  }

  static Future<dynamic> deleteMeal(
      {required BuildContext context, required Meal mealModel}) async {
    final res = await APIClient().put(
        '${EndPoints.getApiKeyString(apiKey: EndPoints.meal)}/${mealModel.id}/delete',
        data: {"is_Deleted": true});
    return res;
  }

  static Future<dynamic> getMeals({
    required BuildContext context,
    double? lat,
    double? long,
    required Map<String, dynamic>? queryParameters,
    bool? isPreorder = false,
  }) async {
    final res = await APIClient().get(
      EndPoints.getApiKeyString(apiKey: EndPoints.getMeal),
      queryParameters: {
        ...?queryParameters,
        'isPreorder': isPreorder,
        'longitude': long,
        'latitude': lat,
      }..removeWhere((key, value) => value == null),
    );

    return jsonDecode(res.toString());
  }

  static Future<dynamic> getMealsByCategory(
      {required BuildContext context,
      required Map<String, dynamic>? pagination,
      required int? categoryId,
      double? lat,
      double? long,
      bool? isPreorder = false}) async {
    final res = await APIClient().get(
      EndPoints.getApiKeyString(apiKey: EndPoints.getMealByCategory),
      queryParameters: {
        ...?pagination,
        'categoryId': categoryId,
        'isPreorder': isPreorder,
        'longitude': long,
        'latitude': lat,
      }..removeWhere((key, value) => value == null),
    );

    return jsonDecode(res.toString());
  }

  static Future<dynamic> getMealsByChef(
      {required BuildContext context,
      required Map<String, dynamic>? queryParameters,
      String? chefId,
      bool? isPreorder = false}) async {
    if (chefId?.isEmpty ?? true) return Future.value([]);

    final res = await APIClient().get(
      EndPoints.getApiKeyString(apiKey: EndPoints.getMealByChef),
      queryParameters: {
        ...?queryParameters,
        'chefId': chefId,
        'isPreorder': isPreorder
      }..removeWhere((key, value) => value == null),
    );

    return jsonDecode(res.toString());
  }

  static Future<dynamic> getMealsByChefByCategory(
      {required BuildContext context,
      required Map<String, dynamic>? pagination,
      required int? categoryId,
      String? chefId,
      bool? isPreorder = false}) async {
    final res = await APIClient().get(
      EndPoints.getApiKeyString(apiKey: EndPoints.getMealByChefByCategory),
      queryParameters: {
        ...?pagination,
        'chefId': chefId,
        'CategoryId': categoryId,
        'isPreorder': isPreorder
      }..removeWhere((key, value) => value == null),
    );

    return jsonDecode(res.toString());
  }

  static Future<dynamic> getMealById({required int mealId}) async {
    final res = await APIClient().get(
      EndPoints.actionApiKeyString(
        id: mealId.toString(),
        apiKey: EndPoints.getMealById,
      ),
    );

    return res;
  }

  static Future<dynamic> getFavoriteMeals(
      {required Map<String, dynamic>? pagination}) async {
    final res = await APIClient().get(
      EndPoints.favoriteMeals,
      queryParameters: {...?pagination},
    );

    return res;
  }

  static Future<Response> addMealToFavorite({required Meal meal}) async {
    final res = await APIClient().post(EndPoints.favoriteMeals,
        data: {'code': CodeGenerator.getRandomCode()},
        queryParameters: {'productId': meal.id});

    return res;
  }

  static Future<Response> removeMealToFavorite({required Meal meal}) async {
    final res = await APIClient().delete(EndPoints.favoriteMeals,
        queryParameters: {'productId': meal.id});

    return res;
  }
}
