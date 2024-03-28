// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      id: json['id'] as int?,
      chefID: json['chefID'] as String?,
      employeeNote: json['employeeNote'] as String?,
      clientNote: json['clientNote'] as String?,
      preparationNote: json['preparationNote'] as String?,
      shippedAddressId: json['shippedAddressId'] as String?,
      deliveryAreaPrice: (json['deliveryAreaPrice'] as num?)?.toDouble(),
      deliveryCostPrice: (json['deliveryCostPrice'] as num?)?.toDouble(),
      finalPrice: (json['finalPrice'] as num?)?.toDouble(),
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      invoiceTax: (json['invoiceTax'] as num?)?.toDouble(),
      invoiceDiscount: (json['invoiceDiscount'] as num?)?.toDouble(),
      bankID: json['bankID'] as int?,
      invoiceDetails: (json['invoiceDetails'] as List<dynamic>?)
          ?.map((e) => InvoiceDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chefID': instance.chefID,
      'employeeNote': instance.employeeNote,
      'clientNote': instance.clientNote,
      'preparationNote': instance.preparationNote,
      'shippedAddressId': instance.shippedAddressId,
      'deliveryAreaPrice': instance.deliveryAreaPrice,
      'deliveryCostPrice': instance.deliveryCostPrice,
      'finalPrice': instance.finalPrice,
      'totalPrice': instance.totalPrice,
      'invoiceTax': instance.invoiceTax,
      'invoiceDiscount': instance.invoiceDiscount,
      'bankID': instance.bankID,
      'invoiceDetails': instance.invoiceDetails,
    };

_$InvoiceDetailsImpl _$$InvoiceDetailsImplFromJson(Map<String, dynamic> json) =>
    _$InvoiceDetailsImpl(
      productVarintId: json['productVarintId'] as int?,
      quantity: (json['quantity'] as num?)?.toDouble(),
      productVarintPrice: (json['productVarintPrice'] as num?)?.toDouble(),
      totalProductVarintFinalPrice:
          (json['totalProductVarintFinalPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$InvoiceDetailsImplToJson(
        _$InvoiceDetailsImpl instance) =>
    <String, dynamic>{
      'productVarintId': instance.productVarintId,
      'quantity': instance.quantity,
      'productVarintPrice': instance.productVarintPrice,
      'totalProductVarintFinalPrice': instance.totalProductVarintFinalPrice,
    };
