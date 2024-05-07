// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvoiceTransactionModelImpl _$$InvoiceTransactionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InvoiceTransactionModelImpl(
      status: (json['status'] as num?)?.toInt(),
      paymentType: (json['paymentType'] as num?)?.toInt(),
      treasuryAmountPaid: (json['treasuryAmountPaid'] as num?)?.toDouble(),
      treasuryId: (json['treasuryId'] as num?)?.toInt(),
      transactionType: (json['transactionType'] as num?)?.toInt(),
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
