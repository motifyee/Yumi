import 'package:flutter/cupertino.dart';
import 'package:yumi/statics/api_statics.dart';
import 'dart:math';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

class BankInfoService {
  static Future<dynamic> getBankInfo({required BuildContext context}) async {
    final res = await DioClient.simpleDio(context)
        .get('${ApiKeys.getApiKeyString(apiKey: ApiKeys.info)}/bank');
    return Map<String, dynamic>.from(res.data)['data'];
  }

  static Future<dynamic> updateBankInfo({
    required BuildContext context,
    required Map<String, dynamic> data,
  }) async {
    try {
      final res = await DioClient.simpleDio(context).put(
          '${ApiKeys.getApiKeyString(apiKey: ApiKeys.info)}/bank/${data['id']}',
          data: data);
      return res.data;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<dynamic> addBankInfo(
      {required BuildContext context,
      required Map<String, dynamic> data}) async {
    try {
      data['code'] = getRandomString(15);
      data.remove('id');

      final res = await DioClient.simpleDio(context).post(
          '${ApiKeys.getApiKeyString(apiKey: ApiKeys.info)}/bank',
          data: data);
      return res.data;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
