// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      code: json['code'] as String?,
      country: json['address'] as String?,
      city: json['addressName'] as String?,
      street: json['location'] as String?,
      latitude: (json['Address_Latitude'] as num?)?.toDouble(),
      longitude: (json['Address_Longitude'] as num?)?.toDouble(),
      isDefault: json['isDefault'] as bool?,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'address': instance.country,
      'addressName': instance.city,
      'location': instance.street,
      'Address_Latitude': instance.latitude,
      'Address_Longitude': instance.longitude,
      'isDefault': instance.isDefault,
    };
