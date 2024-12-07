// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BasketImpl _$$BasketImplFromJson(Map<String, dynamic> json) => _$BasketImpl(
      id: (json['id'] as num?)?.toInt(),
      invoice: Invoice.fromJson(json['invoice'] as Map<String, dynamic>),
      invoiceDetails: (json['invoiceDetails'] as List<dynamic>)
          .map((e) => InvoiceDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      voucherId: json['voucherId'] as String?,
      bankId: (json['bankId'] as num?)?.toInt(),
      shippedAddressId: (json['shippedAddressId'] as num?)?.toInt(),
      isSchedule: json['isSchedule'] as bool? ?? false,
      isPickup: json['is_Pickup'] as bool? ?? true,
      isDelivery: json['is_Delivery'] as bool? ?? false,
      isPreorder: json['is_Preorder'] as bool? ?? false,
      status: (json['status'] as num?)?.toInt() ?? 1,
      isPaying: json['isPaying'] as bool? ?? false,
    );

Map<String, dynamic> _$$BasketImplToJson(_$BasketImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'invoice': instance.invoice,
      'invoiceDetails': instance.invoiceDetails,
      if (instance.voucherId case final value?) 'voucherId': value,
      if (instance.bankId case final value?) 'bankId': value,
      if (instance.shippedAddressId case final value?)
        'shippedAddressId': value,
      'isSchedule': instance.isSchedule,
      'is_Pickup': instance.isPickup,
      'is_Delivery': instance.isDelivery,
      'is_Preorder': instance.isPreorder,
      if (instance.status case final value?) 'status': value,
      'isPaying': instance.isPaying,
    };
