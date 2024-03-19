import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yumi/statics/api_statics.dart';

class CategoriesService {
  static Future<dynamic> getCategories(
      {required BuildContext context,
      Map<String, dynamic>? pagination,
      bool isPreOrder = false}) async {
    final res = await DioClient.simpleDio(context).get(
      ApiKeys.getApiKeyString(apiKey: ApiKeys.categories),
      queryParameters: {...?pagination, 'isPreOrder': isPreOrder}
        ..removeWhere((key, value) => value == null),
    );

    return jsonDecode(res.toString());
  }

  static Future<dynamic> getCategoriesForChef(
      {required BuildContext context,
      Map<String, dynamic>? pagination,
      bool isPreOrder = false}) async {
    final res = await DioClient.simpleDio(context).get(
      ApiKeys.getApiKeyString(apiKey: ApiKeys.categoriesForChef),
      queryParameters: {...?pagination, 'isPreOrder': isPreOrder}
        ..removeWhere((key, value) => value == null),
    );

    return jsonDecode(res.toString());
  }

  static Future<dynamic> getCategoriesForCustomer(
      {required BuildContext context,
      Map<String, dynamic>? pagination,
      bool isPreOrder = false}) async {
    final res = await DioClient.simpleDio(context).get(
      ApiKeys.getApiKeyString(apiKey: ApiKeys.categoriesForCustomer),
      queryParameters: {...?pagination, 'isPreOrder': isPreOrder}
        ..removeWhere((key, value) => value == null),
    );

    return jsonDecode(res.toString());
  }
}
