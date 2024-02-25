import 'package:flutter/cupertino.dart';
import 'package:yumi/statics/api_statics.dart';

class ProfileService {
  static Future<dynamic> getProfile(
      {required BuildContext context, required String id}) async {
    final res = await DioClient.simpleDio(context)
        .get('${ApiKeys.getApiKeyString(apiKey: ApiKeys.profile)}/${id}');
    return res.data;
  }
}
