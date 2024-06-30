import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/bank_info/data/repos/bank_info_repo.dart';
import 'package:yumi/domain/bank_info/entities/bankinfo_model.dart';

class GetBankInfo extends UseCase<BankInfo, NoParams> {
  final BankInfoRepo repo;

  GetBankInfo({BankInfoRepo? repo}) : repo = repo ?? getIt<BankInfoRepo>();

  @override
  Future<Either<Failure, BankInfo>> call(NoParams params) =>
      repo.getBankInfo().run();
}
