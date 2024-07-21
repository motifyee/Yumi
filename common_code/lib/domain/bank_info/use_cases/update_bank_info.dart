import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/bank_info/data/repos/bank_info_repo.dart';
import 'package:common_code/domain/bank_info/entities/bankinfo_model.dart';

class UpdateBankInfo extends UseCase<String, UpdateBankInfoParams> {
  final BankInfoRepo repo;

  UpdateBankInfo({BankInfoRepo? repo}) : repo = repo ?? getIt<BankInfoRepo>();

  @override
  Future<Either<Failure, String>> call(UpdateBankInfoParams params) =>
      repo.updateBankInfo(params.bankInfo).run();
}

class UpdateBankInfoParams extends Params {
  final BankInfo bankInfo;

  UpdateBankInfoParams(this.bankInfo);

  @override
  List<Object?> get props => [bankInfo];
}
