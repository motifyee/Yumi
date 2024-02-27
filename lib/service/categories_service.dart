import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yumi/statics/api_statics.dart';

class CategoriesService {
  static Future<dynamic> getCategories(
      {required BuildContext context,
      Map<String, dynamic>? queryParameters}) async {
    final res = await DioClient.simpleDio(context).get(
        ApiKeys.getApiKeyString(apiKey: ApiKeys.categories),
        queryParameters: queryParameters);
    return jsonDecode(res.toString());
  }
}
