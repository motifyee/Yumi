class BankInfo {
  final String id;
  final String code;
  final String bankName;
  final String accountName;
  final int accountNumber;
  final String currency;
  final String iban;
  final String swiftCode;
  final String branchAddress;

  BankInfo({
    this.id = '',
    this.code = '',
    this.bankName = '',
    this.accountName = '',
    this.accountNumber = 0,
    this.currency = '',
    this.iban = '',
    this.swiftCode = '',
    this.branchAddress = '',
  });

  BankInfo copyWith({
    String? id,
    String? bankName,
    String? code,
    String? accountName,
    int? accountNumber,
    String? currency,
    String? iban,
    String? swiftCode,
    String? branchAddress,
  }) {
    return BankInfo(
      id: id ?? this.id,
      code: code ?? this.code,
      bankName: bankName ?? this.bankName,
      accountName: accountName ?? this.accountName,
      accountNumber: accountNumber ?? this.accountNumber,
      currency: currency ?? this.currency,
      iban: iban ?? this.iban,
      swiftCode: swiftCode ?? this.swiftCode,
      branchAddress: branchAddress ?? this.branchAddress,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'bank_Name': bankName,
      'account_Name': accountName,
      'account_Number': accountNumber,
      'currency': currency,
      'iban': iban,
      'swift_Code': swiftCode,
      'bank_Branch_Address': branchAddress,
    };
  }

  static BankInfo fromJson({required dynamic value}) {
    var info = BankInfo(
      id: value['id'] ?? '',
      code: value['code'] ?? '',
      bankName: value['bank_Name'] ?? '',
      accountName: value['account_Name'] ?? '',
      accountNumber: value['account_Number']?.round() ?? '',
      currency: value['currency'] ?? '',
      iban: value['iban'] ?? '',
      swiftCode: value['swift_Code'] ?? '',
      branchAddress: value['bank_Branch_Address'] ?? '',
    );

    return info;
  }
}
