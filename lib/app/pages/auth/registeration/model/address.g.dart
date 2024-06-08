// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      code: json['code'] as String?,
      name: json['name'] as String?,
      userName: json['userName'] as String?,
      mobile: json['mobile'] as String?,
      addressId: (json['id'] as num?)?.toInt(),
      multiAddressID: (json['multiAddressID'] as num?)?.toInt(),
      addressDetails: json['address'] as String?,
      addressTitle: json['address_Name'] as String?,
      location: json['location'] as String?,
      latitude: (json['address_Latitude'] as num?)?.toDouble(),
      longitude: (json['address_Longitude'] as num?)?.toDouble(),
      isDefault: json['isDefault'] as bool?,
      isDeleted: json['isDeleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'userName': instance.userName,
      'mobile': instance.mobile,
      'id': instance.addressId,
      'multiAddressID': instance.multiAddressID,
      'address': instance.addressDetails,
      'address_Name': instance.addressTitle,
      'location': instance.location,
      'address_Latitude': instance.latitude,
      'address_Longitude': instance.longitude,
      'isDefault': instance.isDefault,
      'isDeleted': instance.isDeleted,
    };
