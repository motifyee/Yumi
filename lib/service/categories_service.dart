import 'dart:convert';

import 'package:yumi/statics/api_statics.dart';

class CategoriesService {
  static Future<dynamic> getCategories(
      {Map<String, dynamic>? pagination, bool isPreOrder = false}) async {
    final res = await DioClient.simpleDio().get(
      ApiKeys.getApiKeyString(apiKey: ApiKeys.categories),
      queryParameters: {...?pagination, 'isPreOrder': isPreOrder}
        ..removeWhere((key, value) => value == null),
    );

    return jsonDecode(res.toString());
  }

  static Future<dynamic> getCategoriesForChef(
      {Map<String, dynamic>? pagination, bool isPreOrder = false}) async {
    final res = await DioClient.simpleDio().get(
      ApiKeys.getApiKeyString(apiKey: ApiKeys.categoriesForChef),
      queryParameters: {...?pagination, 'isPreOrder': isPreOrder}
        ..removeWhere((key, value) => value == null),
    );

    return jsonDecode(res.toString());
  }

  static Future<dynamic> getCategoriesForCustomer(
      {Map<String, dynamic>? pagination,
      double? lat,
      double? long,
      bool isPreOrder = false}) async {
    final res = await DioClient.simpleDio().get(
      ApiKeys.getApiKeyString(apiKey: ApiKeys.categoriesForCustomer),
      queryParameters: {
        ...?pagination,
        'isPreOrder': isPreOrder,
        'longitude': long,
        'latitude': lat,
      }..removeWhere((key, value) => value == null),
    );

    return jsonDecode(res.toString());
  }

  static Future<dynamic> getCategoriesForCustomerByChefId(
      {Map<String, dynamic>? pagination,
      required String chefId,
      bool isPreOrder = false}) async {
    final res = await DioClient.simpleDio().get(
      ApiKeys.getApiKeyString(apiKey: ApiKeys.categoriesForCustomerByChefId),
      queryParameters: {
        ...?pagination,
        'isPreOrder': isPreOrder,
        'chefId': chefId,
      }..removeWhere((key, value) => value == null),
    );

    return jsonDecode(res.toString());
  }
}
