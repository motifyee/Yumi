// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvoiceDetailImpl _$$InvoiceDetailImplFromJson(Map<String, dynamic> json) =>
    _$InvoiceDetailImpl(
      productVarintId: (json['productVarintId'] as num?)?.toInt(),
      quantity: json['quantity'] == null
          ? "0"
          : const StringToDoubleAsIntStringConverter()
              .fromJson((json['quantity'] as num).toDouble()),
      productVarintPrice: (json['productVarintPrice'] as num?)?.toDouble() ?? 0,
      discountListId: (json['discountListId'] as num?)?.toInt() ?? 1205,
      note: json['note'] as String? ?? '',
      meal: json['meal'] == null
          ? null
          : Meal.fromJson(json['meal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$InvoiceDetailImplToJson(_$InvoiceDetailImpl instance) =>
    <String, dynamic>{
      'productVarintId': instance.productVarintId,
      'quantity':
          const StringToDoubleAsIntStringConverter().toJson(instance.quantity),
      'productVarintPrice': instance.productVarintPrice,
      'discountListId': instance.discountListId,
      'note': instance.note,
    };
