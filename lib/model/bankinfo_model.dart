import 'package:freezed_annotation/freezed_annotation.dart';

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

  //   this.code = '',
  //   this.id = '',
  //   this.bankName = '',
  //   this.accountName = '',
  //   this.accountNumber = 0,
  //   this.currency = '',
  //   this.iban = '',
  //   this.swiftCode = '',
  //   this.branchAddress = '',

  // BankInfo copyWith({
  //   String? id,
  //   String? bankName,
  //   String? code,
  //   String? accountName,
  //   int? accountNumber,
  //   String? currency,
  //   String? iban,
  //   String? swiftCode,
  //   String? branchAddress,
  // }) {
  //   return BankInfo(
  //     id: id ?? this.id,
  //     code: code ?? this.code,
  //     bankName: bankName ?? this.bankName,
  //     accountName: accountName ?? this.accountName,
  //     accountNumber: accountNumber ?? this.accountNumber,
  //     currency: currency ?? this.currency,
  //     iban: iban ?? this.iban,
  //     swiftCode: swiftCode ?? this.swiftCode,
  //     branchAddress: branchAddress ?? this.branchAddress,
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'code': code,
  //     'bank_Name': bankName,
  //     'account_Name': accountName,
  //     'account_Number': accountNumber,
  //     'currency': currency,
  //     'iban': iban,
  //     'swift_Code': swiftCode,
  //     'bank_Branch_Address': branchAddress,
  //   };
  // }

  // static BankInfo fromJson({required dynamic value}) {
  //   var info = BankInfo(
  //     id: value['id'] ?? '',
  //     code: value['code'] ?? '',
  //     bankName: value['bank_Name'] ?? '',
  //     accountName: value['account_Name'] ?? '',
  //     accountNumber: value['account_Number']?.round() ?? '',
  //     currency: value['currency'] ?? '',
  //     iban: value['iban'] ?? '',
  //     swiftCode: value['swift_Code'] ?? '',
  //     branchAddress: value['bank_Branch_Address'] ?? '',
  //   );

  //   return info;
  // }
}
