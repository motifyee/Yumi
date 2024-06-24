import 'package:fpdart/fpdart.dart';
import 'package:fpdart/src/task_either.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/setup/inject.dart';
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
      (error, stackTrace) => ServerFailure(error, stackTrace),
    );
  }
}
