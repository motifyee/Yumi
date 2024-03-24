// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  String? get code =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'id') String? id,
// String? userId,
  @JsonKey(name: 'address')
  String? get addressDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'addressName')
  String? get addresssTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'location')
  String? get location => throw _privateConstructorUsedError; // String? zip,
  @JsonKey(name: 'Address_Latitude')
  double? get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'Address_Longitude')
  double? get longitude => throw _privateConstructorUsedError;
  bool? get isDefault => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
  $Res call(
      {String? code,
      @JsonKey(name: 'address') String? addressDetails,
      @JsonKey(name: 'addressName') String? addresssTitle,
      @JsonKey(name: 'location') String? location,
      @JsonKey(name: 'Address_Latitude') double? latitude,
      @JsonKey(name: 'Address_Longitude') double? longitude,
      bool? isDefault});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? addressDetails = freezed,
    Object? addresssTitle = freezed,
    Object? location = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? isDefault = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      addressDetails: freezed == addressDetails
          ? _value.addressDetails
          : addressDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      addresssTitle: freezed == addresssTitle
          ? _value.addresssTitle
          : addresssTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      isDefault: freezed == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressImplCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$AddressImplCopyWith(
          _$AddressImpl value, $Res Function(_$AddressImpl) then) =
      __$$AddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? code,
      @JsonKey(name: 'address') String? addressDetails,
      @JsonKey(name: 'addressName') String? addresssTitle,
      @JsonKey(name: 'location') String? location,
      @JsonKey(name: 'Address_Latitude') double? latitude,
      @JsonKey(name: 'Address_Longitude') double? longitude,
      bool? isDefault});
}

/// @nodoc
class __$$AddressImplCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$AddressImpl>
    implements _$$AddressImplCopyWith<$Res> {
  __$$AddressImplCopyWithImpl(
      _$AddressImpl _value, $Res Function(_$AddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? addressDetails = freezed,
    Object? addresssTitle = freezed,
    Object? location = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? isDefault = freezed,
  }) {
    return _then(_$AddressImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      addressDetails: freezed == addressDetails
          ? _value.addressDetails
          : addressDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      addresssTitle: freezed == addresssTitle
          ? _value.addresssTitle
          : addresssTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      isDefault: freezed == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressImpl extends _Address {
  const _$AddressImpl(
      {this.code,
      @JsonKey(name: 'address') this.addressDetails,
      @JsonKey(name: 'addressName') this.addresssTitle,
      @JsonKey(name: 'location') this.location,
      @JsonKey(name: 'Address_Latitude') this.latitude,
      @JsonKey(name: 'Address_Longitude') this.longitude,
      this.isDefault})
      : super._();

  factory _$AddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressImplFromJson(json);

  @override
  final String? code;
// @JsonKey(name: 'id') String? id,
// String? userId,
  @override
  @JsonKey(name: 'address')
  final String? addressDetails;
  @override
  @JsonKey(name: 'addressName')
  final String? addresssTitle;
  @override
  @JsonKey(name: 'location')
  final String? location;
// String? zip,
  @override
  @JsonKey(name: 'Address_Latitude')
  final double? latitude;
  @override
  @JsonKey(name: 'Address_Longitude')
  final double? longitude;
  @override
  final bool? isDefault;

  @override
  String toString() {
    return 'Address(code: $code, addressDetails: $addressDetails, addresssTitle: $addresssTitle, location: $location, latitude: $latitude, longitude: $longitude, isDefault: $isDefault)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.addressDetails, addressDetails) ||
                other.addressDetails == addressDetails) &&
            (identical(other.addresssTitle, addresssTitle) ||
                other.addresssTitle == addresssTitle) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, addressDetails,
      addresssTitle, location, latitude, longitude, isDefault);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      __$$AddressImplCopyWithImpl<_$AddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressImplToJson(
      this,
    );
  }
}

abstract class _Address extends Address {
  const factory _Address(
      {final String? code,
      @JsonKey(name: 'address') final String? addressDetails,
      @JsonKey(name: 'addressName') final String? addresssTitle,
      @JsonKey(name: 'location') final String? location,
      @JsonKey(name: 'Address_Latitude') final double? latitude,
      @JsonKey(name: 'Address_Longitude') final double? longitude,
      final bool? isDefault}) = _$AddressImpl;
  const _Address._() : super._();

  factory _Address.fromJson(Map<String, dynamic> json) = _$AddressImpl.fromJson;

  @override
  String? get code;
  @override // @JsonKey(name: 'id') String? id,
// String? userId,
  @JsonKey(name: 'address')
  String? get addressDetails;
  @override
  @JsonKey(name: 'addressName')
  String? get addresssTitle;
  @override
  @JsonKey(name: 'location')
  String? get location;
  @override // String? zip,
  @JsonKey(name: 'Address_Latitude')
  double? get latitude;
  @override
  @JsonKey(name: 'Address_Longitude')
  double? get longitude;
  @override
  bool? get isDefault;
  @override
  @JsonKey(ignore: true)
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
