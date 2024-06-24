import 'package:dio/dio.dart';
import 'package:yumi/domain/wallet/data/source/wallet_source.dart';
import 'package:yumi/domain/wallet/entity/wallet.dart';
import 'package:yumi/statics/api_statics.dart';

class WalletSourceRemote extends WalletSource {
  @override
  Future<Wallet> getWallet({Map<String, dynamic>? queryParameters}) async {
    final Response res = await DioClient.simpleDio().get(ApiKeys.wallet,
        queryParameters: {
          ...?queryParameters,
        }..removeWhere((key, value) => value == null));
    return Wallet.fromJson(res.data);
  }
}
