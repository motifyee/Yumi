import 'package:fpdart/fpdart.dart';
import 'package:common_code/core/failures.dart';
import 'package:yumi/domain/bank_info/entities/bankinfo_model.dart';

abstract class BankInfoRepo {
  TaskEither<Failure, BankInfo> getBankInfo();
  TaskEither<Failure, String> updateBankInfo(BankInfo bankInfo);
  TaskEither<Failure, String> addBankInfo(BankInfo bankInfo);
}
