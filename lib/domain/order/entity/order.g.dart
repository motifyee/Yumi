// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: (json['id'] as num?)?.toInt(),
      chefID: json['chef_ID'] as String?,
      driverID: json['driver_ID'] as String?,
      employeeNote: json['employeeNote'] as String?,
      clientNote: json['clientNote'] as String?,
      preparationNote: json['preparationNote'] as String?,
      shippedAddressId: (json['shippedAddressId'] as num?)?.toInt(),
      deliveryAreaPrice: (json['deliveryAreaPrice'] as num?)?.toDouble(),
      deliveryCostPrice: (json['deliveryCostPrice'] as num?)?.toDouble(),
      finalPrice: (json['finalPrice'] as num?)?.toDouble(),
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      invoiceTax: (json['invoiceTax'] as num?)?.toDouble(),
      invoiceDiscount: (json['invoiceDiscount'] as num?)?.toDouble(),
      bankID: (json['bankID'] as num?)?.toInt(),
      createdDate: json['createdDate'] as String?,
      updatedDate: json['updatedDate'] as String?,
      scheduleDate: json['schedule_Date'] as String?,
      chefName: json['chefName'] as String?,
      clientName: json['clientName'] as String?,
      clientMobile: json['clientMobile'] as String?,
      clientDefaultAddress: json['clientDefaultAddress'] as String?,
      driverAccept: json['driver_Accept'] as bool?,
      driverAcceptDate: json['driver_Accept_Date'] as String?,
      driverReceived: json['driver_Received'] as bool?,
      driverReceivedDate: json['driver_Received_Date'] as String?,
      chefAccept: json['chef_Accept'] as bool?,
      chefAcceptDate: json['chef_Accept_Date'] as String?,
      chefStart: json['chef_Start'] as bool?,
      chefStartDate: json['chef_Start_Date'] as String?,
      chefFinished: json['chef_Finished'] as bool?,
      chefFinishedDate: json['chef_Finished_Date'] as String?,
      clientReceived: json['client_Received'] as bool?,
      clientReceivedDate: json['client_Received_Date'] as String?,
      isPickUp: json['is_Pickup'] as bool?,
      addressLatitude: (json['address_Latitude'] as num?)?.toDouble(),
      addressLongitude: (json['address_Longitude'] as num?)?.toDouble(),
      location: json['location'] as String?,
      invoiceDetails: (json['invoiceDetails'] as List<dynamic>?)
              ?.map((e) => InvoiceDetails.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isLoading: json['isLoading'] as bool? ?? false,
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chef_ID': instance.chefID,
      'driver_ID': instance.driverID,
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
      'createdDate': instance.createdDate,
      'updatedDate': instance.updatedDate,
      'schedule_Date': instance.scheduleDate,
      'chefName': instance.chefName,
      'clientName': instance.clientName,
      'clientMobile': instance.clientMobile,
      'clientDefaultAddress': instance.clientDefaultAddress,
      'driver_Accept': instance.driverAccept,
      'driver_Accept_Date': instance.driverAcceptDate,
      'driver_Received': instance.driverReceived,
      'driver_Received_Date': instance.driverReceivedDate,
      'chef_Accept': instance.chefAccept,
      'chef_Accept_Date': instance.chefAcceptDate,
      'chef_Start': instance.chefStart,
      'chef_Start_Date': instance.chefStartDate,
      'chef_Finished': instance.chefFinished,
      'chef_Finished_Date': instance.chefFinishedDate,
      'client_Received': instance.clientReceived,
      'client_Received_Date': instance.clientReceivedDate,
      'is_Pickup': instance.isPickUp,
      'address_Latitude': instance.addressLatitude,
      'address_Longitude': instance.addressLongitude,
      'location': instance.location,
      'invoiceDetails': instance.invoiceDetails,
      'isLoading': instance.isLoading,
    };

_$InvoiceDetailsImpl _$$InvoiceDetailsImplFromJson(Map<String, dynamic> json) =>
    _$InvoiceDetailsImpl(
      productVarintId: (json['productVarintId'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toDouble(),
      productVarintPrice: (json['productVarintPrice'] as num?)?.toDouble(),
      totalProductVarintFinalPrice:
          (json['totalProductVarintFinalPrice'] as num?)?.toDouble(),
      productVarintName: json['productVarintName'] as String?,
      image: json['image'] as String?,
      note: json['note'] as String?,
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$InvoiceDetailsImplToJson(
        _$InvoiceDetailsImpl instance) =>
    <String, dynamic>{
      'productVarintId': instance.productVarintId,
      'quantity': instance.quantity,
      'productVarintPrice': instance.productVarintPrice,
      'totalProductVarintFinalPrice': instance.totalProductVarintFinalPrice,
      'productVarintName': instance.productVarintName,
      'image': instance.image,
      'note': instance.note,
      'product': instance.product,
    };

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      productID: (json['productID'] as num?)?.toInt(),
      productName: json['productName'] as String?,
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'productID': instance.productID,
      'productName': instance.productName,
      'ingredients': instance.ingredients,
    };
