import 'package:common_code/domain/bank_info/entities/bankinfo_model.dart';

abstract class BankInfoSrc {
  Future<BankInfo> getBankInfo();
  Future<String> updateBankInfo(BankInfo bankInfo);
  Future<String> addBankInfo(BankInfo bankInfo);
}
