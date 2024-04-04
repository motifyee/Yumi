// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InitialImpl _$$InitialImplFromJson(Map<String, dynamic> json) =>
    _$InitialImpl(
      chefId: json['chefId'] as String?,
      driverId: json['driverId'] as String?,
      customerId: json['customerId'] as String?,
      message: json['message'] as String? ?? '',
      userName: json['userName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      code: json['code'] as String? ?? '',
      multiAddressID: json['multiAddressID'] as int? ?? 0,
      accessToken: json['access_Token'] as String? ?? '',
      expiresIn: json['expires_In'] as String? ?? '',
      address: json['address'] as String?,
      addressName: json['address_Name'] as String?,
      lat: json['address_Lattitude'] as String?,
      long: json['address_Longitude'] as String?,
      location: json['location'] as String? ?? '',
    );

Map<String, dynamic> _$$InitialImplToJson(_$InitialImpl instance) =>
    <String, dynamic>{
      'chefId': instance.chefId,
      'driverId': instance.driverId,
      'customerId': instance.customerId,
      'message': instance.message,
      'userName': instance.userName,
      'email': instance.email,
      'code': instance.code,
      'multiAddressID': instance.multiAddressID,
      'access_Token': instance.accessToken,
      'expires_In': instance.expiresIn,
      'address': instance.address,
      'address_Name': instance.addressName,
      'address_Lattitude': instance.lat,
      'address_Longitude': instance.long,
      'location': instance.location,
    };
