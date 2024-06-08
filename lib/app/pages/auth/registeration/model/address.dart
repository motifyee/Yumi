// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Address with _$Address {
  const factory Address({
    String? code,
    String? name,
    String? userName,
    String? mobile,
    @JsonKey(name: 'id') int? addressId,
    @JsonKey(name: 'multiAddressID') int? multiAddressID,
    // String? userId,
    @JsonKey(name: 'address') String? addressDetails,
    @JsonKey(name: 'address_Name') String? addressTitle,
    @JsonKey(name: 'location') String? location,
    // String? zip,
    @JsonKey(name: 'address_Latitude') double? latitude,
    @JsonKey(name: 'address_Longitude') double? longitude,
    bool? isDefault,
    @Default(false) bool? isDeleted,
  }) = _Address;

  const Address._();

  int? get id => addressId ?? multiAddressID;

  // String get fullAddress => "${street ?? ''}, ${city ?? ''}, ${country ?? ''}";

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$$AddressImplFromJson(json);
}
