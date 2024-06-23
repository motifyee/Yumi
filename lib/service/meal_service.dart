import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yumi/app/pages/menu/meal_model.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/statics/code_generator.dart';

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
    return res;
  }

  static Future<dynamic> getMeals({
    required BuildContext context,
    double? lat,
    double? long,
    required Map<String, dynamic>? queryParameters,
    bool? isPreorder = false,
  }) async {
    final res = await DioClient.simpleDio(context).get(
      ApiKeys.getApiKeyString(apiKey: ApiKeys.getMeal),
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
    final res = await DioClient.simpleDio(context).get(
      ApiKeys.getApiKeyString(apiKey: ApiKeys.getMealByCategory),
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

    final res = await DioClient.simpleDio(context).get(
      ApiKeys.getApiKeyString(apiKey: ApiKeys.getMealByChef),
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
    final res = await DioClient.simpleDio(context).get(
      ApiKeys.getApiKeyString(apiKey: ApiKeys.getMealByChefByCategory),
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
    final res = await DioClient.simpleDio().get(
      ApiKeys.actionApiKeyString(
        id: mealId.toString(),
        apiKey: ApiKeys.getMealById,
      ),
    );

    return res;
  }

  static Future<dynamic> getFavoriteMeals(
      {required Map<String, dynamic>? pagination}) async {
    final res = await DioClient.simpleDio().get(
      ApiKeys.favoriteMeals,
      queryParameters: {...?pagination},
    );

    return res;
  }

  static Future<Response> addMealToFavorite({required MealModel meal}) async {
    final res = await DioClient.simpleDio().post(ApiKeys.favoriteMeals,
        data: {'code': CodeGenerator.getRandomCode()},
        queryParameters: {'productId': meal.id});

    return res;
  }

  static Future<Response> removeMealToFavorite(
      {required MealModel meal}) async {
    final res = await DioClient.simpleDio()
        .delete(ApiKeys.favoriteMeals, queryParameters: {'productId': meal.id});

    return res;
  }
}
