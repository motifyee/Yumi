import 'package:dio/dio.dart';
import 'package:yumi/statics/api_statics.dart';

class WalletService {
  static Future<dynamic> getWallet({
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response res = await DioClient.simpleDio().get(ApiKeys.wallet,
        queryParameters: {
          ...?queryParameters,
        }..removeWhere((key, value) => value == null));
    return res;
  }
}
