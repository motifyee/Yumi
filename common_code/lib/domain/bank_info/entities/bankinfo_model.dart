import 'package:dependencies/dependencies.dart';

part 'bankinfo_model.freezed.dart';
part 'bankinfo_model.g.dart';

@freezed
class BankInfo with _$BankInfo {
  const factory BankInfo({
    @Default('') String id,
    @Default('') String code,
    @JsonKey(name: 'bank_Name') @Default('') String bankName,
    @JsonKey(name: 'account_Name') @Default('') String accountName,
    @JsonKey(name: 'account_Number') @Default('') String accountNumber,
    @Default('') String currency,
    @Default('') String iban,
    @JsonKey(name: 'swift_Code') @Default('') String swiftCode,
    @JsonKey(name: 'bank_Branch_Address') @Default('') String branchAddress,
  }) = _bankInfo;

  // from json function
  factory BankInfo.fromJson(Map<String, dynamic> json) =>
      _$BankInfoFromJson(json);
}
