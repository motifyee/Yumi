// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      chefId: json['chefId'] as String?,
      driverId: json['driverId'] as String?,
      customerId: json['customerId'] as String?,
      message: json['message'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      code: json['code'] as String?,
      accessToken: json['access_Token'] as String?,
      expiresIn: json['expires_In'] as String?,
      address: json['address'] as String?,
      multiAddressID: (json['multiAddressID'] as num?)?.toInt(),
      addressName: json['address_Name'] as String?,
      location: json['location'] as String?,
      addressLatitude: (json['address_Latitude'] as num?)?.toDouble(),
      addressLongitude: (json['address_Longitude'] as num?)?.toDouble(),
      workstatus: (json['status_Work'] as num?)?.toInt(),
      accountApproved: json['account_Approved'] as bool?,
      accountApprovedDate: json['account_Approved_Date'] as String?,
      mobileVerified: json['mobile_Verified'] as bool?,
      mobileVerifiedDate: json['mobile_Verified_Date'] as String?,
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'chefId': instance.chefId,
      'driverId': instance.driverId,
      'customerId': instance.customerId,
      'message': instance.message,
      'userName': instance.userName,
      'email': instance.email,
      'code': instance.code,
      'access_Token': instance.accessToken,
      'expires_In': instance.expiresIn,
      'address': instance.address,
      'multiAddressID': instance.multiAddressID,
      'address_Name': instance.addressName,
      'location': instance.location,
      'address_Latitude': instance.addressLatitude,
      'address_Longitude': instance.addressLongitude,
      'status_Work': instance.workstatus,
      'account_Approved': instance.accountApproved,
      'account_Approved_Date': instance.accountApprovedDate,
      'mobile_Verified': instance.mobileVerified,
      'mobile_Verified_Date': instance.mobileVerifiedDate,
    };
