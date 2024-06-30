import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/bank_info/entities/bankinfo_model.dart';

abstract class BankInfoRepo {
  TaskEither<Failure, BankInfo> getBankInfo();
  TaskEither<Failure, BankInfo> updateBankInfo(BankInfo bankInfo);
  TaskEither<Failure, BankInfo> addBankInfo(BankInfo bankInfo);
}
