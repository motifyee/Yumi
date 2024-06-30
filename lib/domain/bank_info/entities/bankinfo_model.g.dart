// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bankinfo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$bankInfoImpl _$$bankInfoImplFromJson(Map<String, dynamic> json) =>
    _$bankInfoImpl(
      id: json['id'] as String? ?? '',
      code: json['code'] as String? ?? '',
      bankName: json['bank_Name'] as String? ?? '',
      accountName: json['account_Name'] as String? ?? '',
      accountNumber: json['account_Number'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      iban: json['iban'] as String? ?? '',
      swiftCode: json['swift_Code'] as String? ?? '',
      branchAddress: json['bank_Branch_Address'] as String? ?? '',
    );

Map<String, dynamic> _$$bankInfoImplToJson(_$bankInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'bank_Name': instance.bankName,
      'account_Name': instance.accountName,
      'account_Number': instance.accountNumber,
      'currency': instance.currency,
      'iban': instance.iban,
      'swift_Code': instance.swiftCode,
      'bank_Branch_Address': instance.branchAddress,
    };
