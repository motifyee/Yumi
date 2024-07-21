import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/bank_info/data/repos/bank_info_repo.dart';
import 'package:common_code/domain/bank_info/entities/bankinfo_model.dart';

class AddBankInfo extends UseCase<String, AddBankInfoParams> {
  final BankInfoRepo repo;

  AddBankInfo({BankInfoRepo? repo}) : repo = repo ?? getIt<BankInfoRepo>();

  @override
  Future<Either<Failure, String>> call(AddBankInfoParams params) =>
      repo.addBankInfo(params.bankInfo).run();
}

class AddBankInfoParams extends Params {
  final BankInfo bankInfo;

  AddBankInfoParams(this.bankInfo);

  @override
  List<Object?> get props => [bankInfo];
}
