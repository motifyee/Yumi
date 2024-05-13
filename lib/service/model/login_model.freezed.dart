// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return _LoginResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginResponse {
  String? get chefId => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_Token')
  String? get accessToken => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_In')
  String? get expiresIn => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_Name')
  String? get addressName => throw _privateConstructorUsedError;
  int? get multiAddressID => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_Latitude')
  double? get addressLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_Longitude')
  double? get addressLongitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_Work')
  int? get statusWork => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_Approved')
  bool? get accountApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_Approved_Date')
  String? get accountApprovedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile_Verified')
  bool? get mobileVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile_Verified_Date')
  String? get mobileVerifiedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginResponseCopyWith<LoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseCopyWith<$Res> {
  factory $LoginResponseCopyWith(
          LoginResponse value, $Res Function(LoginResponse) then) =
      _$LoginResponseCopyWithImpl<$Res, LoginResponse>;
  @useResult
  $Res call(
      {String? chefId,
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
      @JsonKey(name: 'mobile_Verified_Date') String? mobileVerifiedDate});
}

/// @nodoc
class _$LoginResponseCopyWithImpl<$Res, $Val extends LoginResponse>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chefId = freezed,
    Object? message = freezed,
    Object? userName = freezed,
    Object? email = freezed,
    Object? accessToken = freezed,
    Object? code = freezed,
    Object? expiresIn = freezed,
    Object? address = freezed,
    Object? addressName = freezed,
    Object? multiAddressID = freezed,
    Object? location = freezed,
    Object? addressLatitude = freezed,
    Object? addressLongitude = freezed,
    Object? statusWork = freezed,
    Object? accountApproved = freezed,
    Object? accountApprovedDate = freezed,
    Object? mobileVerified = freezed,
    Object? mobileVerifiedDate = freezed,
  }) {
    return _then(_value.copyWith(
      chefId: freezed == chefId
          ? _value.chefId
          : chefId // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresIn: freezed == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      addressName: freezed == addressName
          ? _value.addressName
          : addressName // ignore: cast_nullable_to_non_nullable
              as String?,
      multiAddressID: freezed == multiAddressID
          ? _value.multiAddressID
          : multiAddressID // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLatitude: freezed == addressLatitude
          ? _value.addressLatitude
          : addressLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      addressLongitude: freezed == addressLongitude
          ? _value.addressLongitude
          : addressLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      statusWork: freezed == statusWork
          ? _value.statusWork
          : statusWork // ignore: cast_nullable_to_non_nullable
              as int?,
      accountApproved: freezed == accountApproved
          ? _value.accountApproved
          : accountApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      accountApprovedDate: freezed == accountApprovedDate
          ? _value.accountApprovedDate
          : accountApprovedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileVerified: freezed == mobileVerified
          ? _value.mobileVerified
          : mobileVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      mobileVerifiedDate: freezed == mobileVerifiedDate
          ? _value.mobileVerifiedDate
          : mobileVerifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginResponseImplCopyWith<$Res>
    implements $LoginResponseCopyWith<$Res> {
  factory _$$LoginResponseImplCopyWith(
          _$LoginResponseImpl value, $Res Function(_$LoginResponseImpl) then) =
      __$$LoginResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? chefId,
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
      @JsonKey(name: 'mobile_Verified_Date') String? mobileVerifiedDate});
}

/// @nodoc
class __$$LoginResponseImplCopyWithImpl<$Res>
    extends _$LoginResponseCopyWithImpl<$Res, _$LoginResponseImpl>
    implements _$$LoginResponseImplCopyWith<$Res> {
  __$$LoginResponseImplCopyWithImpl(
      _$LoginResponseImpl _value, $Res Function(_$LoginResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chefId = freezed,
    Object? message = freezed,
    Object? userName = freezed,
    Object? email = freezed,
    Object? accessToken = freezed,
    Object? code = freezed,
    Object? expiresIn = freezed,
    Object? address = freezed,
    Object? addressName = freezed,
    Object? multiAddressID = freezed,
    Object? location = freezed,
    Object? addressLatitude = freezed,
    Object? addressLongitude = freezed,
    Object? statusWork = freezed,
    Object? accountApproved = freezed,
    Object? accountApprovedDate = freezed,
    Object? mobileVerified = freezed,
    Object? mobileVerifiedDate = freezed,
  }) {
    return _then(_$LoginResponseImpl(
      chefId: freezed == chefId
          ? _value.chefId
          : chefId // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresIn: freezed == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      addressName: freezed == addressName
          ? _value.addressName
          : addressName // ignore: cast_nullable_to_non_nullable
              as String?,
      multiAddressID: freezed == multiAddressID
          ? _value.multiAddressID
          : multiAddressID // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLatitude: freezed == addressLatitude
          ? _value.addressLatitude
          : addressLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      addressLongitude: freezed == addressLongitude
          ? _value.addressLongitude
          : addressLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      statusWork: freezed == statusWork
          ? _value.statusWork
          : statusWork // ignore: cast_nullable_to_non_nullable
              as int?,
      accountApproved: freezed == accountApproved
          ? _value.accountApproved
          : accountApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      accountApprovedDate: freezed == accountApprovedDate
          ? _value.accountApprovedDate
          : accountApprovedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileVerified: freezed == mobileVerified
          ? _value.mobileVerified
          : mobileVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      mobileVerifiedDate: freezed == mobileVerifiedDate
          ? _value.mobileVerifiedDate
          : mobileVerifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginResponseImpl implements _LoginResponse {
  const _$LoginResponseImpl(
      {this.chefId,
      this.message,
      this.userName,
      this.email,
      @JsonKey(name: 'access_Token') this.accessToken,
      this.code,
      @JsonKey(name: 'expires_In') this.expiresIn,
      this.address,
      @JsonKey(name: 'address_Name') this.addressName,
      this.multiAddressID,
      this.location,
      @JsonKey(name: 'address_Latitude') this.addressLatitude,
      @JsonKey(name: 'address_Longitude') this.addressLongitude,
      @JsonKey(name: 'status_Work') this.statusWork,
      @JsonKey(name: 'account_Approved') this.accountApproved,
      @JsonKey(name: 'account_Approved_Date') this.accountApprovedDate,
      @JsonKey(name: 'mobile_Verified') this.mobileVerified,
      @JsonKey(name: 'mobile_Verified_Date') this.mobileVerifiedDate});

  factory _$LoginResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResponseImplFromJson(json);

  @override
  final String? chefId;
  @override
  final String? message;
  @override
  final String? userName;
  @override
  final String? email;
  @override
  @JsonKey(name: 'access_Token')
  final String? accessToken;
  @override
  final String? code;
  @override
  @JsonKey(name: 'expires_In')
  final String? expiresIn;
  @override
  final String? address;
  @override
  @JsonKey(name: 'address_Name')
  final String? addressName;
  @override
  final int? multiAddressID;
  @override
  final String? location;
  @override
  @JsonKey(name: 'address_Latitude')
  final double? addressLatitude;
  @override
  @JsonKey(name: 'address_Longitude')
  final double? addressLongitude;
  @override
  @JsonKey(name: 'status_Work')
  final int? statusWork;
  @override
  @JsonKey(name: 'account_Approved')
  final bool? accountApproved;
  @override
  @JsonKey(name: 'account_Approved_Date')
  final String? accountApprovedDate;
  @override
  @JsonKey(name: 'mobile_Verified')
  final bool? mobileVerified;
  @override
  @JsonKey(name: 'mobile_Verified_Date')
  final String? mobileVerifiedDate;

  @override
  String toString() {
    return 'LoginResponse(chefId: $chefId, message: $message, userName: $userName, email: $email, accessToken: $accessToken, code: $code, expiresIn: $expiresIn, address: $address, addressName: $addressName, multiAddressID: $multiAddressID, location: $location, addressLatitude: $addressLatitude, addressLongitude: $addressLongitude, statusWork: $statusWork, accountApproved: $accountApproved, accountApprovedDate: $accountApprovedDate, mobileVerified: $mobileVerified, mobileVerifiedDate: $mobileVerifiedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResponseImpl &&
            (identical(other.chefId, chefId) || other.chefId == chefId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.addressName, addressName) ||
                other.addressName == addressName) &&
            (identical(other.multiAddressID, multiAddressID) ||
                other.multiAddressID == multiAddressID) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.addressLatitude, addressLatitude) ||
                other.addressLatitude == addressLatitude) &&
            (identical(other.addressLongitude, addressLongitude) ||
                other.addressLongitude == addressLongitude) &&
            (identical(other.statusWork, statusWork) ||
                other.statusWork == statusWork) &&
            (identical(other.accountApproved, accountApproved) ||
                other.accountApproved == accountApproved) &&
            (identical(other.accountApprovedDate, accountApprovedDate) ||
                other.accountApprovedDate == accountApprovedDate) &&
            (identical(other.mobileVerified, mobileVerified) ||
                other.mobileVerified == mobileVerified) &&
            (identical(other.mobileVerifiedDate, mobileVerifiedDate) ||
                other.mobileVerifiedDate == mobileVerifiedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      chefId,
      message,
      userName,
      email,
      accessToken,
      code,
      expiresIn,
      address,
      addressName,
      multiAddressID,
      location,
      addressLatitude,
      addressLongitude,
      statusWork,
      accountApproved,
      accountApprovedDate,
      mobileVerified,
      mobileVerifiedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      __$$LoginResponseImplCopyWithImpl<_$LoginResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResponseImplToJson(
      this,
    );
  }
}

abstract class _LoginResponse implements LoginResponse {
  const factory _LoginResponse(
      {final String? chefId,
      final String? message,
      final String? userName,
      final String? email,
      @JsonKey(name: 'access_Token') final String? accessToken,
      final String? code,
      @JsonKey(name: 'expires_In') final String? expiresIn,
      final String? address,
      @JsonKey(name: 'address_Name') final String? addressName,
      final int? multiAddressID,
      final String? location,
      @JsonKey(name: 'address_Latitude') final double? addressLatitude,
      @JsonKey(name: 'address_Longitude') final double? addressLongitude,
      @JsonKey(name: 'status_Work') final int? statusWork,
      @JsonKey(name: 'account_Approved') final bool? accountApproved,
      @JsonKey(name: 'account_Approved_Date') final String? accountApprovedDate,
      @JsonKey(name: 'mobile_Verified') final bool? mobileVerified,
      @JsonKey(name: 'mobile_Verified_Date')
      final String? mobileVerifiedDate}) = _$LoginResponseImpl;

  factory _LoginResponse.fromJson(Map<String, dynamic> json) =
      _$LoginResponseImpl.fromJson;

  @override
  String? get chefId;
  @override
  String? get message;
  @override
  String? get userName;
  @override
  String? get email;
  @override
  @JsonKey(name: 'access_Token')
  String? get accessToken;
  @override
  String? get code;
  @override
  @JsonKey(name: 'expires_In')
  String? get expiresIn;
  @override
  String? get address;
  @override
  @JsonKey(name: 'address_Name')
  String? get addressName;
  @override
  int? get multiAddressID;
  @override
  String? get location;
  @override
  @JsonKey(name: 'address_Latitude')
  double? get addressLatitude;
  @override
  @JsonKey(name: 'address_Longitude')
  double? get addressLongitude;
  @override
  @JsonKey(name: 'status_Work')
  int? get statusWork;
  @override
  @JsonKey(name: 'account_Approved')
  bool? get accountApproved;
  @override
  @JsonKey(name: 'account_Approved_Date')
  String? get accountApprovedDate;
  @override
  @JsonKey(name: 'mobile_Verified')
  bool? get mobileVerified;
  @override
  @JsonKey(name: 'mobile_Verified_Date')
  String? get mobileVerifiedDate;
  @override
  @JsonKey(ignore: true)
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}