// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BasketImpl _$$BasketImplFromJson(Map<String, dynamic> json) => _$BasketImpl(
      id: json['id'] as int?,
      invoice: Invoice.fromJson(json['invoice'] as Map<String, dynamic>),
      invoiceDetails: (json['invoiceDetails'] as List<dynamic>)
          .map((e) => InvoiceDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      bankId: json['bankId'] as int? ?? 44,
      shippedAddressId: json['shippedAddressId'] as int?,
      isSchedule: json['isSchedule'] as bool? ?? false,
      isPickup: json['is_Pickup'] as bool? ?? true,
      isDelivery: json['isDelivery'] as bool? ?? false,
      isPreorder: json['is_Preorder'] as bool? ?? false,
      status: json['status'] as int? ?? 1,
    );

Map<String, dynamic> _$$BasketImplToJson(_$BasketImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoice': instance.invoice,
      'invoiceDetails': instance.invoiceDetails,
      'bankId': instance.bankId,
      'shippedAddressId': instance.shippedAddressId,
      'isSchedule': instance.isSchedule,
      'is_Pickup': instance.isPickup,
      'isDelivery': instance.isDelivery,
      'is_Preorder': instance.isPreorder,
      'status': instance.status,
    };

_$InvoiceImpl _$$InvoiceImplFromJson(Map<String, dynamic> json) =>
    _$InvoiceImpl(
      createdBy: json['createdBy'] as int?,
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
    );

Map<String, dynamic> _$$InvoiceImplToJson(_$InvoiceImpl instance) =>
    <String, dynamic>{
      'createdBy': instance.createdBy,
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

_$InvoiceDetailsImpl _$$InvoiceDetailsImplFromJson(Map<String, dynamic> json) =>
    _$InvoiceDetailsImpl(
      productVarintId: json['productVarintId'] as int?,
      quantity: const StringToDoubleAsIntStringConverter()
          .fromJson(json['quantity'] as double?),
      productVarintPrice: (json['productVarintPrice'] as num?)?.toDouble(),
      discountListId: json['discountListId'] as int? ?? 1205,
      note: json['note'] as String? ?? '',
    );

Map<String, dynamic> _$$InvoiceDetailsImplToJson(
        _$InvoiceDetailsImpl instance) =>
    <String, dynamic>{
      'productVarintId': instance.productVarintId,
      'quantity':
          const StringToDoubleAsIntStringConverter().toJson(instance.quantity),
      'productVarintPrice': instance.productVarintPrice,
      'discountListId': instance.discountListId,
      'note': instance.note,
    };
