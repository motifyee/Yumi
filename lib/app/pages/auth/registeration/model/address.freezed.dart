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
  String? get code => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  String? get mobile => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int? get addressId => throw _privateConstructorUsedError;
  @JsonKey(name: 'multiAddressID')
  int? get multiAddressID =>
      throw _privateConstructorUsedError; // String? userId,
  @JsonKey(name: 'address')
  String? get addressDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_Name')
  String? get addressTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'location')
  String? get location => throw _privateConstructorUsedError; // String? zip,
  @JsonKey(name: 'address_Latitude')
  double? get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_Longitude')
  double? get longitude => throw _privateConstructorUsedError;
  bool? get isDefault => throw _privateConstructorUsedError;
  bool? get isDeleted => throw _privateConstructorUsedError;

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
      String? name,
      String? userName,
      String? mobile,
      @JsonKey(name: 'id') int? addressId,
      @JsonKey(name: 'multiAddressID') int? multiAddressID,
      @JsonKey(name: 'address') String? addressDetails,
      @JsonKey(name: 'address_Name') String? addressTitle,
      @JsonKey(name: 'location') String? location,
      @JsonKey(name: 'address_Latitude') double? latitude,
      @JsonKey(name: 'address_Longitude') double? longitude,
      bool? isDefault,
      bool? isDeleted});
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
    Object? name = freezed,
    Object? userName = freezed,
    Object? mobile = freezed,
    Object? addressId = freezed,
    Object? multiAddressID = freezed,
    Object? addressDetails = freezed,
    Object? addressTitle = freezed,
    Object? location = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? isDefault = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      addressId: freezed == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int?,
      multiAddressID: freezed == multiAddressID
          ? _value.multiAddressID
          : multiAddressID // ignore: cast_nullable_to_non_nullable
              as int?,
      addressDetails: freezed == addressDetails
          ? _value.addressDetails
          : addressDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      addressTitle: freezed == addressTitle
          ? _value.addressTitle
          : addressTitle // ignore: cast_nullable_to_non_nullable
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
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
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
      String? name,
      String? userName,
      String? mobile,
      @JsonKey(name: 'id') int? addressId,
      @JsonKey(name: 'multiAddressID') int? multiAddressID,
      @JsonKey(name: 'address') String? addressDetails,
      @JsonKey(name: 'address_Name') String? addressTitle,
      @JsonKey(name: 'location') String? location,
      @JsonKey(name: 'address_Latitude') double? latitude,
      @JsonKey(name: 'address_Longitude') double? longitude,
      bool? isDefault,
      bool? isDeleted});
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
    Object? name = freezed,
    Object? userName = freezed,
    Object? mobile = freezed,
    Object? addressId = freezed,
    Object? multiAddressID = freezed,
    Object? addressDetails = freezed,
    Object? addressTitle = freezed,
    Object? location = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? isDefault = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_$AddressImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      addressId: freezed == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int?,
      multiAddressID: freezed == multiAddressID
          ? _value.multiAddressID
          : multiAddressID // ignore: cast_nullable_to_non_nullable
              as int?,
      addressDetails: freezed == addressDetails
          ? _value.addressDetails
          : addressDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      addressTitle: freezed == addressTitle
          ? _value.addressTitle
          : addressTitle // ignore: cast_nullable_to_non_nullable
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
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressImpl extends _Address {
  const _$AddressImpl(
      {this.code,
      this.name,
      this.userName,
      this.mobile,
      @JsonKey(name: 'id') this.addressId,
      @JsonKey(name: 'multiAddressID') this.multiAddressID,
      @JsonKey(name: 'address') this.addressDetails,
      @JsonKey(name: 'address_Name') this.addressTitle,
      @JsonKey(name: 'location') this.location,
      @JsonKey(name: 'address_Latitude') this.latitude,
      @JsonKey(name: 'address_Longitude') this.longitude,
      this.isDefault,
      this.isDeleted = false})
      : super._();

  factory _$AddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressImplFromJson(json);

  @override
  final String? code;
  @override
  final String? name;
  @override
  final String? userName;
  @override
  final String? mobile;
  @override
  @JsonKey(name: 'id')
  final int? addressId;
  @override
  @JsonKey(name: 'multiAddressID')
  final int? multiAddressID;
// String? userId,
  @override
  @JsonKey(name: 'address')
  final String? addressDetails;
  @override
  @JsonKey(name: 'address_Name')
  final String? addressTitle;
  @override
  @JsonKey(name: 'location')
  final String? location;
// String? zip,
  @override
  @JsonKey(name: 'address_Latitude')
  final double? latitude;
  @override
  @JsonKey(name: 'address_Longitude')
  final double? longitude;
  @override
  final bool? isDefault;
  @override
  @JsonKey()
  final bool? isDeleted;

  @override
  String toString() {
    return 'Address(code: $code, name: $name, userName: $userName, mobile: $mobile, addressId: $addressId, multiAddressID: $multiAddressID, addressDetails: $addressDetails, addressTitle: $addressTitle, location: $location, latitude: $latitude, longitude: $longitude, isDefault: $isDefault, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.addressId, addressId) ||
                other.addressId == addressId) &&
            (identical(other.multiAddressID, multiAddressID) ||
                other.multiAddressID == multiAddressID) &&
            (identical(other.addressDetails, addressDetails) ||
                other.addressDetails == addressDetails) &&
            (identical(other.addressTitle, addressTitle) ||
                other.addressTitle == addressTitle) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      name,
      userName,
      mobile,
      addressId,
      multiAddressID,
      addressDetails,
      addressTitle,
      location,
      latitude,
      longitude,
      isDefault,
      isDeleted);

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
      final String? name,
      final String? userName,
      final String? mobile,
      @JsonKey(name: 'id') final int? addressId,
      @JsonKey(name: 'multiAddressID') final int? multiAddressID,
      @JsonKey(name: 'address') final String? addressDetails,
      @JsonKey(name: 'address_Name') final String? addressTitle,
      @JsonKey(name: 'location') final String? location,
      @JsonKey(name: 'address_Latitude') final double? latitude,
      @JsonKey(name: 'address_Longitude') final double? longitude,
      final bool? isDefault,
      final bool? isDeleted}) = _$AddressImpl;
  const _Address._() : super._();

  factory _Address.fromJson(Map<String, dynamic> json) = _$AddressImpl.fromJson;

  @override
  String? get code;
  @override
  String? get name;
  @override
  String? get userName;
  @override
  String? get mobile;
  @override
  @JsonKey(name: 'id')
  int? get addressId;
  @override
  @JsonKey(name: 'multiAddressID')
  int? get multiAddressID;
  @override // String? userId,
  @JsonKey(name: 'address')
  String? get addressDetails;
  @override
  @JsonKey(name: 'address_Name')
  String? get addressTitle;
  @override
  @JsonKey(name: 'location')
  String? get location;
  @override // String? zip,
  @JsonKey(name: 'address_Latitude')
  double? get latitude;
  @override
  @JsonKey(name: 'address_Longitude')
  double? get longitude;
  @override
  bool? get isDefault;
  @override
  bool? get isDeleted;
  @override
  @JsonKey(ignore: true)
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
