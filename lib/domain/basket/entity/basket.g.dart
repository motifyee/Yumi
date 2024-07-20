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
  writeNotNull('voucherId', instance.voucherId);
  writeNotNull('bankId', instance.bankId);
  writeNotNull('shippedAddressId', instance.shippedAddressId);
  val['isSchedule'] = instance.isSchedule;
  val['is_Pickup'] = instance.isPickup;
  val['is_Delivery'] = instance.isDelivery;
  val['is_Preorder'] = instance.isPreorder;
  writeNotNull('status', instance.status);
  val['isPaying'] = instance.isPaying;
  return val;
}
