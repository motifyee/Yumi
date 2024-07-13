import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yumi/statics/api_statics.dart';

class IngredientService {
  static Future<dynamic> getIngredients({required BuildContext context}) async {
    final res = await DioClient.simpleDio().get(ApiKeys.getApiKeyString(apiKey: ApiKeys.ingredient));
    return jsonDecode(res.toString());
  }
}
