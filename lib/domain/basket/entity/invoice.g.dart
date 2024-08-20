// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvoiceImpl _$$InvoiceImplFromJson(Map json) => _$InvoiceImpl(
      createdBy: (json['createdBy'] as num?)?.toInt(),
      createdDate: json['createdDate'] as String?,
      chefID: json['chef_ID'] as String?,
      clientNote: json['clientNote'] as String? ?? '',
      preparationNotes: json['preparationNotes'] as String? ?? '',
      employeeNote: json['employeeNote'] as String? ?? '',
      deliveryCostPrice: (json['deliveryCostPrice'] as num?)?.toDouble() ?? 4.5,
      deliveryAreaPrice: (json['deliveryAreaPrice'] as num?)?.toDouble() ?? 4.5,
      invoiceDiscount: (json['invoiceDiscount'] as num?)?.toDouble() ?? 0.0,
      invoiceTax: (json['invoiceTax'] as num?)?.toDouble() ?? 0.0,
      finalPrice: (json['finalPrice'] as num?)?.toDouble() ?? 0.0,
      totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0.0,
      scheduleDate: _$JsonConverterFromJson<String, DateTime>(
          json['schedule_Date'],
          const DateTimeToIso8601StringConverter().fromJson),
      invoiceCode: json['invoiceCode'] as String?,
      paymentType: (json['paymentType'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$InvoiceImplToJson(_$InvoiceImpl instance) =>
    <String, dynamic>{
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
      'chef_ID': instance.chefID,
      'clientNote': instance.clientNote,
      'preparationNotes': instance.preparationNotes,
      'employeeNote': instance.employeeNote,
      'deliveryCostPrice': instance.deliveryCostPrice,
      'deliveryAreaPrice': instance.deliveryAreaPrice,
      'invoiceDiscount': instance.invoiceDiscount,
      'invoiceTax': instance.invoiceTax,
      'finalPrice': instance.finalPrice,
      'totalPrice': instance.totalPrice,
      'schedule_Date': _$JsonConverterToJson<String, DateTime>(
          instance.scheduleDate,
          const DateTimeToIso8601StringConverter().toJson),
      'invoiceCode': instance.invoiceCode,
      'paymentType': instance.paymentType,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
