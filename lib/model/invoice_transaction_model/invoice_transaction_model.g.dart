// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvoiceTransactionModelImpl _$$InvoiceTransactionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InvoiceTransactionModelImpl(
      status: json['status'] as int?,
      paymentType: json['paymentType'] as int?,
      treasuryAmountPaid: (json['treasuryAmountPaid'] as num?)?.toDouble(),
      treasuryId: json['treasuryId'] as int?,
      transactionType: json['transactionType'] as int?,
    );

Map<String, dynamic> _$$InvoiceTransactionModelImplToJson(
        _$InvoiceTransactionModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'paymentType': instance.paymentType,
      'treasuryAmountPaid': instance.treasuryAmountPaid,
      'treasuryId': instance.treasuryId,
      'transactionType': instance.transactionType,
    };
