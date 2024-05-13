// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    String? chefId,
    String? driverId,
    String? customerId,
    @Default('') String message,
    @Default('') String userName,
    @Default('') String email,
    @Default('') String code,
    @Default(0) int multiAddressID,
    // @Default('') String bio,
    @JsonKey(name: 'access_Token') @Default('') String accessToken,
    @JsonKey(name: 'expires_In') @Default('') String expiresIn,
    String? address,
    @JsonKey(name: 'address_Name') String? addressName,
    @JsonKey(name: 'address_Lattitude') double? lat,
    @JsonKey(name: 'address_Longitude') double? long,
    @Default('') String location,
    @JsonKey(name: 'status_Work') int? status,
    @JsonKey(name: 'account_Approved') bool? accountApproved,
    @JsonKey(name: 'account_Approved_Date') String? accountApprovedDate,
    @JsonKey(name: 'mobile_Verified') bool? mobileVerified,
    @JsonKey(name: 'mobile_Verified_Date') String? mobileVerifiedDate,
  }) = _Initial;

  const UserModel._();

  String get id => chefId ?? driverId ?? customerId ?? '';

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

enum StatusEnum { ready, busy }
