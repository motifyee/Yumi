import 'dart:convert';

import 'package:yumi/model/login_model.dart';
import 'package:yumi/statics/api_statics.dart';

Future<dynamic> loginService({required LoginModel login}) async {
  try {
    final res = await DioClient.simpleDio()
        .post(ApiKeys.login, data: jsonEncode(login.toJson()));
    return res.data;
  } catch (err) {
    print(err);
  }
}
