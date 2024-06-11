// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    String? chefId,
    String? driverId,
    String? customerId,
    @Default('') String message,
    @Default('') String userName,
    @Default('') String email,
    String? password,
    @Default('') String code,
    @Default(0) int multiAddressID,
    // @Default('') String bio,
    @JsonKey(name: 'access_Token') @Default('') String accessToken,
    @JsonKey(name: 'expires_In') @Default('') String expiresIn,
    String? address,
    @JsonKey(name: 'address_Name') String? addressName,
    @JsonKey(name: 'address_Latitude') double? lat,
    @JsonKey(name: 'address_Longitude') double? long,
    @Default('') String location,
    @JsonKey(name: 'status_Work') int? status,
    @JsonKey(name: 'account_Approved') bool? accountApproved,
    @JsonKey(name: 'contract_Approved') bool? contractApproved,
    @JsonKey(name: 'account_Approved_Date') String? accountApprovedDate,
    @JsonKey(name: 'mobile_Verified') bool? mobileVerified,
    @JsonKey(name: 'mobile_Verified_Date') String? mobileVerifiedDate,
  }) = _Initial;

  const User._();

  String get id => chefId ?? driverId ?? customerId ?? '';

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

enum UserStatus { offline, online, busy }
