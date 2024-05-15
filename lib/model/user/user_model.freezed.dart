// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _Initial.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String? get chefId => throw _privateConstructorUsedError;
  String? get driverId => throw _privateConstructorUsedError;
  String? get customerId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  int get multiAddressID =>
      throw _privateConstructorUsedError; // @Default('') String bio,
  @JsonKey(name: 'access_Token')
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_In')
  String get expiresIn => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_Name')
  String? get addressName => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_Lattitude')
  double? get lat => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_Longitude')
  double? get long => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_Work')
  int? get status => throw _privateConstructorUsedError;
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
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String? chefId,
      String? driverId,
      String? customerId,
      String message,
      String userName,
      String email,
      String? password,
      String code,
      int multiAddressID,
      @JsonKey(name: 'access_Token') String accessToken,
      @JsonKey(name: 'expires_In') String expiresIn,
      String? address,
      @JsonKey(name: 'address_Name') String? addressName,
      @JsonKey(name: 'address_Lattitude') double? lat,
      @JsonKey(name: 'address_Longitude') double? long,
      String location,
      @JsonKey(name: 'status_Work') int? status,
      @JsonKey(name: 'account_Approved') bool? accountApproved,
      @JsonKey(name: 'account_Approved_Date') String? accountApprovedDate,
      @JsonKey(name: 'mobile_Verified') bool? mobileVerified,
      @JsonKey(name: 'mobile_Verified_Date') String? mobileVerifiedDate});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chefId = freezed,
    Object? driverId = freezed,
    Object? customerId = freezed,
    Object? message = null,
    Object? userName = null,
    Object? email = null,
    Object? password = freezed,
    Object? code = null,
    Object? multiAddressID = null,
    Object? accessToken = null,
    Object? expiresIn = null,
    Object? address = freezed,
    Object? addressName = freezed,
    Object? lat = freezed,
    Object? long = freezed,
    Object? location = null,
    Object? status = freezed,
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
      driverId: freezed == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      multiAddressID: null == multiAddressID
          ? _value.multiAddressID
          : multiAddressID // ignore: cast_nullable_to_non_nullable
              as int,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      addressName: freezed == addressName
          ? _value.addressName
          : addressName // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      long: freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
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
abstract class _$$InitialImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? chefId,
      String? driverId,
      String? customerId,
      String message,
      String userName,
      String email,
      String? password,
      String code,
      int multiAddressID,
      @JsonKey(name: 'access_Token') String accessToken,
      @JsonKey(name: 'expires_In') String expiresIn,
      String? address,
      @JsonKey(name: 'address_Name') String? addressName,
      @JsonKey(name: 'address_Lattitude') double? lat,
      @JsonKey(name: 'address_Longitude') double? long,
      String location,
      @JsonKey(name: 'status_Work') int? status,
      @JsonKey(name: 'account_Approved') bool? accountApproved,
      @JsonKey(name: 'account_Approved_Date') String? accountApprovedDate,
      @JsonKey(name: 'mobile_Verified') bool? mobileVerified,
      @JsonKey(name: 'mobile_Verified_Date') String? mobileVerifiedDate});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chefId = freezed,
    Object? driverId = freezed,
    Object? customerId = freezed,
    Object? message = null,
    Object? userName = null,
    Object? email = null,
    Object? password = freezed,
    Object? code = null,
    Object? multiAddressID = null,
    Object? accessToken = null,
    Object? expiresIn = null,
    Object? address = freezed,
    Object? addressName = freezed,
    Object? lat = freezed,
    Object? long = freezed,
    Object? location = null,
    Object? status = freezed,
    Object? accountApproved = freezed,
    Object? accountApprovedDate = freezed,
    Object? mobileVerified = freezed,
    Object? mobileVerifiedDate = freezed,
  }) {
    return _then(_$InitialImpl(
      chefId: freezed == chefId
          ? _value.chefId
          : chefId // ignore: cast_nullable_to_non_nullable
              as String?,
      driverId: freezed == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      multiAddressID: null == multiAddressID
          ? _value.multiAddressID
          : multiAddressID // ignore: cast_nullable_to_non_nullable
              as int,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      addressName: freezed == addressName
          ? _value.addressName
          : addressName // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      long: freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
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
class _$InitialImpl extends _Initial {
  const _$InitialImpl(
      {this.chefId,
      this.driverId,
      this.customerId,
      this.message = '',
      this.userName = '',
      this.email = '',
      this.password,
      this.code = '',
      this.multiAddressID = 0,
      @JsonKey(name: 'access_Token') this.accessToken = '',
      @JsonKey(name: 'expires_In') this.expiresIn = '',
      this.address,
      @JsonKey(name: 'address_Name') this.addressName,
      @JsonKey(name: 'address_Lattitude') this.lat,
      @JsonKey(name: 'address_Longitude') this.long,
      this.location = '',
      @JsonKey(name: 'status_Work') this.status,
      @JsonKey(name: 'account_Approved') this.accountApproved,
      @JsonKey(name: 'account_Approved_Date') this.accountApprovedDate,
      @JsonKey(name: 'mobile_Verified') this.mobileVerified,
      @JsonKey(name: 'mobile_Verified_Date') this.mobileVerifiedDate})
      : super._();

  factory _$InitialImpl.fromJson(Map<String, dynamic> json) =>
      _$$InitialImplFromJson(json);

  @override
  final String? chefId;
  @override
  final String? driverId;
  @override
  final String? customerId;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final String userName;
  @override
  @JsonKey()
  final String email;
  @override
  final String? password;
  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final int multiAddressID;
// @Default('') String bio,
  @override
  @JsonKey(name: 'access_Token')
  final String accessToken;
  @override
  @JsonKey(name: 'expires_In')
  final String expiresIn;
  @override
  final String? address;
  @override
  @JsonKey(name: 'address_Name')
  final String? addressName;
  @override
  @JsonKey(name: 'address_Lattitude')
  final double? lat;
  @override
  @JsonKey(name: 'address_Longitude')
  final double? long;
  @override
  @JsonKey()
  final String location;
  @override
  @JsonKey(name: 'status_Work')
  final int? status;
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
    return 'UserModel(chefId: $chefId, driverId: $driverId, customerId: $customerId, message: $message, userName: $userName, email: $email, password: $password, code: $code, multiAddressID: $multiAddressID, accessToken: $accessToken, expiresIn: $expiresIn, address: $address, addressName: $addressName, lat: $lat, long: $long, location: $location, status: $status, accountApproved: $accountApproved, accountApprovedDate: $accountApprovedDate, mobileVerified: $mobileVerified, mobileVerifiedDate: $mobileVerifiedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.chefId, chefId) || other.chefId == chefId) &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.multiAddressID, multiAddressID) ||
                other.multiAddressID == multiAddressID) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.addressName, addressName) ||
                other.addressName == addressName) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.status, status) || other.status == status) &&
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
  int get hashCode => Object.hashAll([
        runtimeType,
        chefId,
        driverId,
        customerId,
        message,
        userName,
        email,
        password,
        code,
        multiAddressID,
        accessToken,
        expiresIn,
        address,
        addressName,
        lat,
        long,
        location,
        status,
        accountApproved,
        accountApprovedDate,
        mobileVerified,
        mobileVerifiedDate
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InitialImplToJson(
      this,
    );
  }
}

abstract class _Initial extends UserModel {
  const factory _Initial(
      {final String? chefId,
      final String? driverId,
      final String? customerId,
      final String message,
      final String userName,
      final String email,
      final String? password,
      final String code,
      final int multiAddressID,
      @JsonKey(name: 'access_Token') final String accessToken,
      @JsonKey(name: 'expires_In') final String expiresIn,
      final String? address,
      @JsonKey(name: 'address_Name') final String? addressName,
      @JsonKey(name: 'address_Lattitude') final double? lat,
      @JsonKey(name: 'address_Longitude') final double? long,
      final String location,
      @JsonKey(name: 'status_Work') final int? status,
      @JsonKey(name: 'account_Approved') final bool? accountApproved,
      @JsonKey(name: 'account_Approved_Date') final String? accountApprovedDate,
      @JsonKey(name: 'mobile_Verified') final bool? mobileVerified,
      @JsonKey(name: 'mobile_Verified_Date')
      final String? mobileVerifiedDate}) = _$InitialImpl;
  const _Initial._() : super._();

  factory _Initial.fromJson(Map<String, dynamic> json) = _$InitialImpl.fromJson;

  @override
  String? get chefId;
  @override
  String? get driverId;
  @override
  String? get customerId;
  @override
  String get message;
  @override
  String get userName;
  @override
  String get email;
  @override
  String? get password;
  @override
  String get code;
  @override
  int get multiAddressID;
  @override // @Default('') String bio,
  @JsonKey(name: 'access_Token')
  String get accessToken;
  @override
  @JsonKey(name: 'expires_In')
  String get expiresIn;
  @override
  String? get address;
  @override
  @JsonKey(name: 'address_Name')
  String? get addressName;
  @override
  @JsonKey(name: 'address_Lattitude')
  double? get lat;
  @override
  @JsonKey(name: 'address_Longitude')
  double? get long;
  @override
  String get location;
  @override
  @JsonKey(name: 'status_Work')
  int? get status;
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
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
