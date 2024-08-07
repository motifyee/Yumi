// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      guid: (json['guid'] as num?)?.toInt(),
      accountId: (json['accountId'] as num?)?.toInt(),
      invoiceId: (json['invoiceId'] as num?)?.toInt(),
      accountName: json['accountName'] as String?,
      journalType: json['journalType'] as String?,
      createdDate: json['createdDate'] as String?,
      debit: (json['debit'] as num?)?.toDouble(),
      credit: (json['credit'] as num?)?.toDouble(),
      previousBalance: (json['previous_Balance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'guid': instance.guid,
      'accountId': instance.accountId,
      'invoiceId': instance.invoiceId,
      'accountName': instance.accountName,
      'journalType': instance.journalType,
      'createdDate': instance.createdDate,
      'debit': instance.debit,
      'credit': instance.credit,
      'previous_Balance': instance.previousBalance,
    };
