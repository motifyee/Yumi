import 'package:fpdart/src/either.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/wallet/data/repo/wallet_repo.dart';
import 'package:yumi/domain/wallet/entity/wallet.dart';

class GetWallet extends UseCase<Wallet, NoParams> {
  final WalletRepo walletRepo;

  GetWallet({WalletRepo? walletRepo}) : walletRepo = walletRepo ?? getIt<WalletRepo>();

  @override
  Future<Either<Failure, Wallet>> call(NoParams params) => walletRepo.getWallet().run();
}
