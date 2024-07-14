import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:yumi/domain/wallet/data/repo/wallet_repo.dart';
import 'package:yumi/domain/wallet/data/source/wallet_source.dart';
import 'package:yumi/domain/wallet/entity/wallet.dart';

class WalletRepoRemote extends WalletRepo {
  final WalletSource walletSource;

  WalletRepoRemote({WalletSource? walletSource})
      : walletSource = walletSource ?? getIt<WalletSource>();

  @override
  TaskEither<Failure, Wallet> getWallet() {
    return TaskEither<Failure, Wallet>.tryCatch(
      () => walletSource.getWallet(),
      (error, stackTrace) => ServerFailure(error.toString()),
    );
  }
}
