// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registeration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterationImpl _$$RegisterationImplFromJson(Map<String, dynamic> json) =>
    _$RegisterationImpl(
      code: json['code'] as String?,
      fullName: json['fullName'] as String?,
      userName: json['userName'] as String?,
      mobile: json['mobile'] as String?,
      signupType: json['signupType'] as String?,
      countryID: json['countryID'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      branchId: json['branchId'] as String?,
    );

Map<String, dynamic> _$$RegisterationImplToJson(_$RegisterationImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'fullName': instance.fullName,
      'userName': instance.userName,
      'mobile': instance.mobile,
      'signupType': instance.signupType,
      'countryID': instance.countryID,
      'email': instance.email,
      'password': instance.password,
      'branchId': instance.branchId,
    };
