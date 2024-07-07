// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VoucherImpl _$$VoucherImplFromJson(Map<String, dynamic> json) =>
    _$VoucherImpl(
      id: json['id'] as String,
      voucherName: json['voucher_Name'] as String,
      amount: (json['amount'] as num).toDouble(),
      startDate: const DateTimeToIso8601StringConverter()
          .fromJson(json['start_Date'] as String),
      endDate: const DateTimeToIso8601StringConverter()
          .fromJson(json['end_Date'] as String),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$VoucherImplToJson(_$VoucherImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'voucher_Name': instance.voucherName,
      'amount': instance.amount,
      'start_Date':
          const DateTimeToIso8601StringConverter().toJson(instance.startDate),
      'end_Date':
          const DateTimeToIso8601StringConverter().toJson(instance.endDate),
      'status': instance.status,
    };
