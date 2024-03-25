// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      code: json['code'] as String?,
      id: json['id'] as int?,
      country: json['address'] as String?,
      city: json['address_Name'] as String?,
      street: json['location'] as String?,
      latitude: (json['address_Latitude'] as num?)?.toDouble(),
      longitude: (json['address_Longitude'] as num?)?.toDouble(),
      isDefault: json['isDefault'] as bool?,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'id': instance.id,
      'address': instance.country,
      'address_Name': instance.city,
      'location': instance.street,
      'address_Latitude': instance.latitude,
      'address_Longitude': instance.longitude,
      'isDefault': instance.isDefault,
    };
