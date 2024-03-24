// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Address with _$Address {
  const factory Address({
    String? code,
    // @JsonKey(name: 'id') String? id,
    // String? userId,
    @JsonKey(name: 'address') String? addressDetails,
    @JsonKey(name: 'addressName') String? addresssTitle,
    @JsonKey(name: 'location') String? location,
    // String? zip,
    @JsonKey(name: 'Address_Latitude') double? latitude,
    @JsonKey(name: 'Address_Longitude') double? longitude,
    bool? isDefault,
  }) = _Address;

  const Address._();

  // String get fullAddress => "${street ?? ''}, ${city ?? ''}, ${country ?? ''}";

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$$AddressImplFromJson(json);
}