// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Address with _$Address {
  const factory Address({
    String? code,
    @JsonKey(name: 'id') int? id,
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

  // String get fullAddress => "${street ?? ''}, ${city ?? ''}, ${country ?? ''}";

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$$AddressImplFromJson(json);
}
