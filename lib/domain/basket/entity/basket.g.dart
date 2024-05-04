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
      bankId: json['bankId'] as int?,
      shippedAddressId: json['shippedAddressId'] as int?,
      isSchedule: json['isSchedule'] as bool? ?? false,
      isPickup: json['is_Pickup'] as bool? ?? true,
      isDelivery: json['is_Delivery'] as bool? ?? true,
      isPreorder: json['is_Preorder'] as bool? ?? false,
      status: json['status'] as int? ?? 1,
    );

Map<String, dynamic> _$$BasketImplToJson(_$BasketImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['invoice'] = instance.invoice;
  val['invoiceDetails'] = instance.invoiceDetails;
  writeNotNull('bankId', instance.bankId);
  writeNotNull('shippedAddressId', instance.shippedAddressId);
  val['isSchedule'] = instance.isSchedule;
  val['is_Pickup'] = instance.isPickup;
  val['is_Delivery'] = instance.isDelivery;
  val['is_Preorder'] = instance.isPreorder;
  writeNotNull('status', instance.status);
  return val;
}

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
      quantity: json['quantity'] as String? ?? "0",
      productVarintPrice: (json['productVarintPrice'] as num?)?.toDouble() ?? 0,
      discountListId: json['discountListId'] as int? ?? 1205,
      note: json['note'] as String? ?? '',
    );

Map<String, dynamic> _$$InvoiceDetailsImplToJson(
        _$InvoiceDetailsImpl instance) =>
    <String, dynamic>{
      'productVarintId': instance.productVarintId,
      'quantity': instance.quantity,
      'productVarintPrice': instance.productVarintPrice,
      'discountListId': instance.discountListId,
      'note': instance.note,
    };
