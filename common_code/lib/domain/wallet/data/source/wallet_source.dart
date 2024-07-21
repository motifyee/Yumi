import 'package:common_code/domain/wallet/entity/wallet.dart';

abstract class WalletSource {
  Future<Wallet> getWallet({Map<String, dynamic>? queryParameters});
}
