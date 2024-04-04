import 'package:flutter/cupertino.dart';
import 'package:yumi/statics/api_statics.dart';

class ProfileService {
  static Future<dynamic> getProfile(String id) async {
    final res = await DioClient.dio
        .get('${ApiKeys.getApiKeyString(apiKey: ApiKeys.profile)}/$id')
        .then((value) => value.data)
        .catchError((_) => false);
    return res;
  }

  static Future<dynamic> updateProfile(Map<String, dynamic> data) async {
    try {
      final res = await DioClient.dio.put(
          '${ApiKeys.getApiKeyString(apiKey: ApiKeys.profile)}?id=${data['guid']}',
          data: data);
      return res.data;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
