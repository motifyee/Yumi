import 'package:dio/dio.dart';
import 'package:common_code/domain/food_delivery/meal/data/source/meal_source.dart';
import 'package:common_code/common_code.dart';

class MealSourceRemote extends MealSource {
  @override
  Future<String> createMeal({required Meal meal}) async {
    Response res;
    try {
      res = await APIClient().post(Endpoints().meal, data: meal.toJson());
    } catch (e) {
      throw e.exceptionFromDio;
    }

    return res.data;
  }

  @override
  Future<Meal> deleteMeal({required Meal meal}) async {
    try {
      await APIClient().put('${Endpoints().meal}/${meal.id}/delete',
          data: {"is_Deleted": true});
    } catch (e) {
      throw e.exceptionFromDio;
    }
    return meal;
  }

  @override
  Future<PaginatedData<Meal>> getFavoriteMeals(
      {required PaginatedData<Meal> pagination}) async {
    Response res;
    try {
      res = await APIClient().get(Endpoints().favoriteMeals,
          queryParameters: {...pagination.toJson()});
    } catch (e) {
      throw e.exceptionFromDio;
    }
    List<Meal> data;
    try {
      data = res.data['data']
          .map<Meal>((e) => Meal.fromJson(
              {...?e, 'id': e['productId'], 'isFavoritProduct': true}))
          .toList();
    } catch (e) {
      throw GenericException(e.toString());
    }

    return pagination.copyWith(
        data: <Meal>[...pagination.data, ...data].unique((e) => e.id),
        isLoading: false,
        pageNumber: res.data['pagination']['page'],
        lastPage: res.data['pagination']['pages']) as PaginatedData<Meal>;
  }

  @override
  Future<Meal> getMealById({required int mealId}) async {
    Response res;
    try {
      res = await APIClient().get(Endpoints.actionApiKeyString(
          id: mealId.toString(), apiKey: Endpoints().getMealById));
    } catch (e) {
      throw e.exceptionFromDio;
    }

    return Meal.fromJson(res.data);
  }

  @override
  Future<PaginatedData<Meal>> getMeals(
      {required PaginatedData<Meal> pagination,
      double? lat,
      double? long,
      bool? isPreorder = false}) async {
    Response res;

    try {
      res = await APIClient().get(Endpoints().getMeal,
          queryParameters: {
            ...pagination.toJson(),
            'isPreorder': isPreorder,
            'longitude': long,
            'latitude': lat
          }..removeWhere((key, value) => value == null));
    } catch (e) {
      throw e.exceptionFromDio;
    }
    List<Meal> data = res.data['data']
        .map<Meal>((e) => Meal.fromJson(
            {...?e, ...e?['meal'], 'id': e?['meal']?['id'] ?? e?['productId']}))
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
    Response res;
    try {
      res = await APIClient().get(Endpoints().getMealByCategory,
          queryParameters: {
            ...pagination.toJson(),
            'categoryId': categoryId,
            'isPreorder': isPreorder,
            'longitude': long,
            'latitude': lat
          }..removeWhere((key, value) => value == null));
    } catch (e) {
      throw e.exceptionFromDio;
    }

    List<Meal> data = res.data['data']
        .map<Meal>((e) => Meal.fromJson(
            {...?e, ...e?['meal'], 'id': e?['meal']?['id'] ?? e?['productId']}))
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
    Response res;
    try {
      res = await APIClient().get(Endpoints().getMealByChef,
          queryParameters: {
            ...pagination.toJson(),
            'chefId': chefId,
            'isPreorder': isPreorder
          }..removeWhere((key, value) => value == null));
    } catch (e) {
      throw e.exceptionFromDio;
    }
    List<Meal> data = res.data['data']
        .map<Meal>((e) => Meal.fromJson(
            {...?e, ...e?['meal'], 'id': e?['meal']?['id'] ?? e?['productId']}))
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
    Response res;
    try {
      res = await APIClient().get(Endpoints().getMealByChefByCategory,
          queryParameters: {
            ...pagination.toJson(),
            'chefId': chefId,
            'CategoryId': categoryId,
            'isPreorder': isPreorder
          }..removeWhere((key, value) => value == null));
    } catch (e) {
      throw e.exceptionFromDio;
    }

    final meals = res.data['data'].map<Meal>((e) {
      return Meal.fromJson({
        ...?e,
        ...e?['product'],
        'id': e?['meal']?['id'] ?? e?['productId'] ?? e?['product']['id']
      });
    }).toList();

    return pagination.copyWith(
        data: <Meal>[...pagination.data, ...meals].unique((e) => e.id),
        isLoading: false,
        pageNumber: res.data['pagination']['page'],
        lastPage: res.data['pagination']['pages']) as PaginatedData<Meal>;
  }

  @override
  Future<Meal> addMealToFavorite({required Meal meal}) async {
    Response res;
    try {
      res = await APIClient().post(Endpoints().favoriteMeals,
          data: {'code': CodeGenerator.getRandomCode()},
          queryParameters: {'productId': meal.id});
    } catch (e) {
      throw e.exceptionFromDio;
    }
    if (res.statusCode == 200) return meal.copyWith(isFavoriteProduct: true);
    return meal;
  }

  @override
  Future<Meal> removeMealToFavorite({required Meal meal}) async {
    Response res;
    try {
      res = await APIClient().delete(Endpoints().favoriteMeals,
          queryParameters: {'productId': meal.id});
    } catch (e) {
      throw e.exceptionFromDio;
    }
    if (res.statusCode == 200) return meal.copyWith(isFavoriteProduct: false);
    return meal;
  }

  @override
  Future<String> updateMeal({required Meal meal}) async {
    Response res;
    try {
      res = await APIClient()
          .put('${Endpoints().meal}/${meal.id}', data: meal.toJson());
    } catch (e) {
      throw e.exceptionFromDio;
    }
    return res.data;
  }
}
