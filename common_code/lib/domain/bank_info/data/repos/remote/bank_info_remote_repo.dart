import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart';
import 'package:common_code/domain/bank_info/data/repos/bank_info_repo.dart';
import 'package:common_code/domain/bank_info/data/sources/bank_info_src.dart';
import 'package:common_code/domain/bank_info/entities/bankinfo_model.dart';

class BankInfoRemoteRepo implements BankInfoRepo {
  final BankInfoSrc src;

  BankInfoRemoteRepo({BankInfoSrc? src}) : src = src ?? getIt<BankInfoSrc>();

  @override
  TaskEither<Failure, String> addBankInfo(BankInfo bankInfo) {
    return TaskEither.tryCatch(
      () => src.addBankInfo(bankInfo),
      (error, stackTrace) => Failure.fromException(error as CException),
    );
  }

  @override
  TaskEither<Failure, BankInfo> getBankInfo() {
    return TaskEither.tryCatch(
      () => src.getBankInfo(),
      (error, stackTrace) => Failure.fromException(error as CException),
    );
  }

  @override
  TaskEither<Failure, String> updateBankInfo(BankInfo bankInfo) {
    return TaskEither.tryCatch(
      () => src.updateBankInfo(bankInfo),
      (error, stackTrace) => Failure.fromException(error as CException),
    );
  }
}
