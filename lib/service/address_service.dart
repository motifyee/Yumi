import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:yumi/statics/api_statics.dart';

class AddressService {
  static Future<dynamic> getAddresses({
    required BuildContext context,
    required Map<String, dynamic> pagination,
  }) async {
    Response res = await DioClient.simpleDio(context).get(ApiKeys.address);
    return res;
  }
}
