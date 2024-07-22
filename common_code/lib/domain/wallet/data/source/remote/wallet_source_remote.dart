import 'package:dio/dio.dart';
import 'package:common_code/domain/wallet/data/source/wallet_source.dart';
import 'package:common_code/domain/wallet/entity/wallet.dart';
import 'package:common_code/common_code.dart';

class WalletSourceRemote extends WalletSource {
  @override
  Future<Wallet> getWallet({Map<String, dynamic>? queryParameters}) async {
    final Response res = await APIClient().get(EndPoints.wallet,
        queryParameters: {
          ...?queryParameters,
        }..removeWhere((key, value) => value == null));
    return Wallet.fromJson(res.data);
  }
}
