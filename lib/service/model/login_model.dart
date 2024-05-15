// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    String? chefId,
    String? driverId,
    String? customerId,
    String? message,
    String? userName,
    String? email,
    String? code,
    @JsonKey(name: 'access_Token') String? accessToken,
    @JsonKey(name: 'expires_In') String? expiresIn,
    String? address,
    int? multiAddressID,
    @JsonKey(name: 'address_Name') String? addressName,
    String? location,
    @JsonKey(name: 'address_Latitude') double? addressLatitude,
    @JsonKey(name: 'address_Longitude') double? addressLongitude,
    @JsonKey(name: 'status_Work') int? workstatus,
    @JsonKey(name: 'account_Approved') bool? accountApproved,
    @JsonKey(name: 'account_Approved_Date') String? accountApprovedDate,
    @JsonKey(name: 'mobile_Verified') bool? mobileVerified,
    @JsonKey(name: 'mobile_Verified_Date') String? mobileVerifiedDate,
  }) = _LoginResponse;

  const LoginResponse._();

  String get id => chefId ?? driverId ?? customerId ?? '';

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
