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
      password: json['password'] as String?,
      code: json['code'] as String? ?? '',
      multiAddressID: (json['multiAddressID'] as num?)?.toInt() ?? 0,
      accessToken: json['access_Token'] as String? ?? '',
      expiresIn: json['expires_In'] as String? ?? '',
      address: json['address'] as String?,
      addressName: json['address_Name'] as String?,
      lat: (json['address_Latitude'] as num?)?.toDouble(),
      long: (json['address_Longitude'] as num?)?.toDouble(),
      location: json['location'] as String? ?? '',
      status: (json['status_Work'] as num?)?.toInt(),
      accountApproved: json['account_Approved'] as bool?,
      contractApproved: json['contract_Approved'] as bool?,
      accountApprovedDate: json['account_Approved_Date'] as String?,
      mobileVerified: json['mobile_Verified'] as bool?,
      mobileVerifiedDate: json['mobile_Verified_Date'] as String?,
    );

Map<String, dynamic> _$$InitialImplToJson(_$InitialImpl instance) =>
    <String, dynamic>{
      'chefId': instance.chefId,
      'driverId': instance.driverId,
      'customerId': instance.customerId,
      'message': instance.message,
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
      'code': instance.code,
      'multiAddressID': instance.multiAddressID,
      'access_Token': instance.accessToken,
      'expires_In': instance.expiresIn,
      'address': instance.address,
      'address_Name': instance.addressName,
      'address_Latitude': instance.lat,
      'address_Longitude': instance.long,
      'location': instance.location,
      'status_Work': instance.status,
      'account_Approved': instance.accountApproved,
      'contract_Approved': instance.contractApproved,
      'account_Approved_Date': instance.accountApprovedDate,
      'mobile_Verified': instance.mobileVerified,
      'mobile_Verified_Date': instance.mobileVerifiedDate,
    };
