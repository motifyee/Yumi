// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      code: json['code'] as String?,
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      country: json['address'] as String?,
      city: json['addressName'] as String?,
      street: json['location'] as String?,
      zip: json['zip'] as String?,
      latitude: (json['Address_Lattitude'] as num?)?.toDouble(),
      longitude: (json['Address_Longitude'] as num?)?.toDouble(),
      isDefault: json['isDefault'] as bool?,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'id': instance.id,
      'userId': instance.userId,
      'address': instance.country,
      'addressName': instance.city,
      'location': instance.street,
      'zip': instance.zip,
      'Address_Lattitude': instance.latitude,
      'Address_Longitude': instance.longitude,
      'isDefault': instance.isDefault,
    };
