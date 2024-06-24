import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/wallet/entity/wallet.dart';

abstract class WalletRepo {
  TaskEither<Failure, Wallet> getWallet();
}
