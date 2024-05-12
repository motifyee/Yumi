// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      chefId: json['chefId'] as String?,
      message: json['message'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      accessToken: json['access_Token'] as String?,
      code: json['code'] as String?,
      expiresIn: json['expires_In'] as String?,
      address: json['address'] as String?,
      addressName: json['address_Name'] as String?,
      multiAddressID: (json['multiAddressID'] as num?)?.toInt(),
      location: json['location'] as String?,
      addressLatitude: (json['address_Latitude'] as num?)?.toDouble(),
      addressLongitude: (json['address_Longitude'] as num?)?.toDouble(),
      statusWork: (json['status_Work'] as num?)?.toInt(),
      accountApproved: json['account_Approved'] as bool?,
      accountApprovedDate: json['account_Approved_Date'] as String?,
      mobileVerified: json['mobile_Verified'] as bool?,
      mobileVerifiedDate: json['mobile_Verified_Date'] as String?,
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'chefId': instance.chefId,
      'message': instance.message,
      'userName': instance.userName,
      'email': instance.email,
      'access_Token': instance.accessToken,
      'code': instance.code,
      'expires_In': instance.expiresIn,
      'address': instance.address,
      'address_Name': instance.addressName,
      'multiAddressID': instance.multiAddressID,
      'location': instance.location,
      'address_Latitude': instance.addressLatitude,
      'address_Longitude': instance.addressLongitude,
      'status_Work': instance.statusWork,
      'account_Approved': instance.accountApproved,
      'account_Approved_Date': instance.accountApprovedDate,
      'mobile_Verified': instance.mobileVerified,
      'mobile_Verified_Date': instance.mobileVerifiedDate,
    };
