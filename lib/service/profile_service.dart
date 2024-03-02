import 'package:flutter/cupertino.dart';
import 'package:yumi/statics/api_statics.dart';

class ProfileService {
  static Future<dynamic> getProfile(
      {required BuildContext context, required String id}) async {
    final res = await DioClient.simpleDio(context)
        .get('${ApiKeys.getApiKeyString(apiKey: ApiKeys.profile)}/$id');
    return res.data;
  }

  static Future<dynamic> updateProfile(
      {required BuildContext context,
      required Map<String, dynamic> data}) async {
    try {
      final res = await DioClient.simpleDio(context).put(
          '${ApiKeys.getApiKeyString(apiKey: ApiKeys.profile)}?id=${data['guid']}',
          data: data);
      return res.data;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
