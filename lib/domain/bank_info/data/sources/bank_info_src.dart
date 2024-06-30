import 'package:yumi/domain/bank_info/entities/bankinfo_model.dart';

abstract class BankInfoSrc {
  Future<BankInfo> getBankInfo();
  Future<BankInfo> updateBankInfo(BankInfo bankInfo);
  Future<BankInfo> addBankInfo(BankInfo bankInfo);
}
