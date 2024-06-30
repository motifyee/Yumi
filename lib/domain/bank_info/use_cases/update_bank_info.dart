import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/bank_info/data/repos/bank_info_repo.dart';
import 'package:yumi/domain/bank_info/entities/bankinfo_model.dart';

class UpdateBankInfo extends UseCase<BankInfo, UpdateBankInfoParams> {
  final BankInfoRepo repo;

  UpdateBankInfo({BankInfoRepo? repo}) : repo = repo ?? getIt<BankInfoRepo>();

  @override
  Future<Either<Failure, BankInfo>> call(UpdateBankInfoParams params) =>
      repo.updateBankInfo(params.bankInfo).run();
}

class UpdateBankInfoParams extends Params {
  final BankInfo bankInfo;

  UpdateBankInfoParams(this.bankInfo);

  @override
  List<Object?> get props => [bankInfo];
}
