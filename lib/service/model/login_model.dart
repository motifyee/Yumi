// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    String? chefId,
    String? message,
    String? userName,
    String? email,
    @JsonKey(name: 'access_Token') String? accessToken,
    String? code,
    @JsonKey(name: 'expires_In') String? expiresIn,
    String? address,
    @JsonKey(name: 'address_Name') String? addressName,
    int? multiAddressID,
    String? location,
    @JsonKey(name: 'address_Latitude') double? addressLatitude,
    @JsonKey(name: 'address_Longitude') double? addressLongitude,
    @JsonKey(name: 'status_Work') int? statusWork,
    @JsonKey(name: 'account_Approved') bool? accountApproved,
    @JsonKey(name: 'account_Approved_Date') String? accountApprovedDate,
    @JsonKey(name: 'mobile_Verified') bool? mobileVerified,
    @JsonKey(name: 'mobile_Verified_Date') String? mobileVerifiedDate,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
