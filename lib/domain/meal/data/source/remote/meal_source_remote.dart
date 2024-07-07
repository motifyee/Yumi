import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:yumi/domain/meal/data/source/meal_source.dart';
import 'package:yumi/domain/meal/entity/meal.dart';
import 'package:yumi/extensions/unique_list_extension.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/statics/code_generator.dart';
import 'package:yumi/statics/paginatedData.dart';
import 'package:yumi/statics/pagination.dart';

class MealSourceRemote extends MealSource {
  @override
  Future<String> createMeal({required Meal meal}) async {
    Response res = await DioClient.simpleDio().post(
        ApiKeys.getApiKeyString(apiKey: ApiKeys.meal),
        data: meal.toJson());
    return res.data;
  }

  @override
  Future<Meal> deleteMeal({required Meal meal}) async {
    await DioClient.simpleDio().put(
        '${ApiKeys.getApiKeyString(apiKey: ApiKeys.meal)}/${meal.id}/delete',
        data: {"is_Deleted": true});
    return meal;
  }

  @override
  Future<PaginatedData<Meal>> getFavoriteMeals(
      {required PaginatedData<Meal> pagination}) async {
    Response res = await DioClient.simpleDio()
        .get(ApiKeys.favoriteMeals, queryParameters: {...pagination.toJson()});
    List<Meal> data = res.data['data']
        .map<Meal>((e) => Meal.fromJson({
              ...e,
              ...e['meal'],
              'id': e['productId'],
              'isFavoritProduct': true
            }))
        .toList();

    return pagination.copyWith(
        data: <Meal>[...pagination.data, ...data].unique((e) => e.id),
        isLoading: false,
        pageNumber: res.data['pagination']['page'],
        lastPage: res.data['pagination']['pages']) as PaginatedData<Meal>;
  }

  @override
  Future<Meal> getMealById({required int mealId}) async {
    Response res = await DioClient.simpleDio().get(ApiKeys.actionApiKeyString(
        id: mealId.toString(), apiKey: ApiKeys.getMealById));

    return Meal.fromJson(res.data);
  }

  @override
  Future<PaginatedData<Meal>> getMeals(
      {required PaginatedData<Meal> pagination,
      double? lat,
      double? long,
      bool? isPreorder = false}) async {
    Response res = await DioClient.simpleDio()
        .get(ApiKeys.getApiKeyString(apiKey: ApiKeys.getMeal),
            queryParameters: {
              ...pagination.toJson(),
              'isPreorder': isPreorder,
              'longitude': long,
              'latitude': lat
            }..removeWhere((key, value) => value == null));
    List<Meal> data = res.data['data']
        .map<Meal>(
            (e) => Meal.fromJson({...e, ...e['meal'], 'id': e['productId']}))
        .toList();

    return pagination.copyWith(
        data: <Meal>[...pagination.data, ...data].unique((e) => e.id),
        isLoading: false,
        pageNumber: res.data['pagination']['page'],
        lastPage: res.data['pagination']['pages']) as PaginatedData<Meal>;
  }

  @override
  Future<PaginatedData<Meal>> getMealsByCategory(
      {required PaginatedData<Meal> pagination,
      required int categoryId,
      double? lat,
      double? long,
      bool? isPreorder = false}) async {
    Response res = await DioClient.simpleDio()
        .get(ApiKeys.getApiKeyString(apiKey: ApiKeys.getMealByCategory),
            queryParameters: {
              ...pagination.toJson(),
              'categoryId': categoryId,
              'isPreorder': isPreorder,
              'longitude': long,
              'latitude': lat
            }..removeWhere((key, value) => value == null));
    List<Meal> data = res.data['data']
        .map<Meal>(
            (e) => Meal.fromJson({...e, ...e['meal'], 'id': e['productId']}))
        .toList();

    return pagination.copyWith(
        data: <Meal>[...pagination.data, ...data].unique((e) => e.id),
        isLoading: false,
        pageNumber: res.data['pagination']['page'],
        lastPage: res.data['pagination']['pages']) as PaginatedData<Meal>;
  }

  @override
  Future<PaginatedData<Meal>> getMealsByChef(
      {required PaginatedData<Meal> pagination,
      required String chefId,
      bool? isPreorder = false}) async {
    Response res = await DioClient.simpleDio().get(
        ApiKeys.getApiKeyString(apiKey: ApiKeys.getMealByChef),
        queryParameters: {
          ...pagination.toJson(),
          'chefId': chefId,
          'isPreorder': isPreorder
        }..removeWhere((key, value) => value == null));
    List<Meal> data = res.data['data']
        .map<Meal>(
            (e) => Meal.fromJson({...e, ...e['meal'], 'id': e['productId']}))
        .toList();

    return pagination.copyWith(
        data: <Meal>[...pagination.data, ...data].unique((e) => e.id),
        isLoading: false,
        pageNumber: res.data['pagination']['page'],
        lastPage: res.data['pagination']['pages']) as PaginatedData<Meal>;
  }

  @override
  Future<PaginatedData<Meal>> getMealsByChefByCategory({
    required PaginatedData<Meal> pagination,
    required int categoryId,
    required String chefId,
    bool? isPreorder = false,
  }) async {
    Response res = await DioClient.simpleDio()
        .get(ApiKeys.getApiKeyString(apiKey: ApiKeys.getMealByChefByCategory),
            queryParameters: {
              ...pagination.toJson(),
              'chefId': chefId,
              'CategoryId': categoryId,
              'isPreorder': isPreorder
            }..removeWhere((key, value) => value == null));

    List data = (res.data['data'] as List);
    final meals = data.map<Meal>((e) {
      return Meal.fromJson({...e, ...e?['meal'], 'id': e['productId']});
    }).toList();

    return pagination.copyWith(
        data: <Meal>[...pagination.data, ...meals].unique((e) => e.id),
        isLoading: false,
        pageNumber: res.data['pagination']['page'],
        lastPage: res.data['pagination']['pages']) as PaginatedData<Meal>;
  }

  @override
  Future<Meal> addMealToFavorite({required Meal meal}) async {
    Response res = await DioClient.simpleDio().post(ApiKeys.favoriteMeals,
        data: {'code': CodeGenerator.getRandomCode()},
        queryParameters: {'productId': meal.id});
    if (res.statusCode == 200) return meal.copyWith(isFavoriteProduct: true);
    return meal;
  }

  @override
  Future<Meal> removeMealToFavorite({required Meal meal}) async {
    Response res = await DioClient.simpleDio()
        .delete(ApiKeys.favoriteMeals, queryParameters: {'productId': meal.id});
    if (res.statusCode == 200) return meal.copyWith(isFavoriteProduct: false);
    return meal;
  }

  @override
  Future<String> updateMeal({required Meal meal}) async {
    Response res = await DioClient.simpleDio().put(
        '${ApiKeys.getApiKeyString(apiKey: ApiKeys.meal)}/${meal.id}',
        data: meal.toJson());
    return res.data;
  }
}
