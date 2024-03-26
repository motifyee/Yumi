// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      code: json['code'] as String?,
      id: json['id'] as int?,
      addressDetails: json['address'] as String?,
      addressTitle: json['address_Name'] as String?,
      location: json['location'] as String?,
      latitude: (json['address_Latitude'] as num?)?.toDouble(),
      longitude: (json['address_Longitude'] as num?)?.toDouble(),
      isDefault: json['isDefault'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'id': instance.id,
      'address': instance.addressDetails,
      'address_Name': instance.addressTitle,
      'location': instance.location,
      'address_Latitude': instance.latitude,
      'address_Longitude': instance.longitude,
      'isDefault': instance.isDefault,
      'isDeleted': instance.isDeleted,
    };
