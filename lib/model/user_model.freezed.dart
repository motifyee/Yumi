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
  String get code =>
      throw _privateConstructorUsedError; // @Default('') String bio,
  @JsonKey(name: 'access_Token')
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_In')
  String get expiresIn => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_Name')
  String? get addressName => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_Lattitude')
  String? get lat => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_Longitude')
  String? get long => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;

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
      String code,
      @JsonKey(name: 'access_Token') String accessToken,
      @JsonKey(name: 'expires_In') String expiresIn,
      String? address,
      @JsonKey(name: 'address_Name') String? addressName,
      @JsonKey(name: 'address_Lattitude') String? lat,
      @JsonKey(name: 'address_Longitude') String? long,
      String location});
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
    Object? code = null,
    Object? accessToken = null,
    Object? expiresIn = null,
    Object? address = freezed,
    Object? addressName = freezed,
    Object? lat = freezed,
    Object? long = freezed,
    Object? location = null,
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
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String?,
      long: freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
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
      String code,
      @JsonKey(name: 'access_Token') String accessToken,
      @JsonKey(name: 'expires_In') String expiresIn,
      String? address,
      @JsonKey(name: 'address_Name') String? addressName,
      @JsonKey(name: 'address_Lattitude') String? lat,
      @JsonKey(name: 'address_Longitude') String? long,
      String location});
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
    Object? code = null,
    Object? accessToken = null,
    Object? expiresIn = null,
    Object? address = freezed,
    Object? addressName = freezed,
    Object? lat = freezed,
    Object? long = freezed,
    Object? location = null,
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
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String?,
      long: freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
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
      this.code = '',
      @JsonKey(name: 'access_Token') this.accessToken = '',
      @JsonKey(name: 'expires_In') this.expiresIn = '',
      this.address,
      @JsonKey(name: 'address_Name') this.addressName,
      @JsonKey(name: 'address_Lattitude') this.lat,
      @JsonKey(name: 'address_Longitude') this.long,
      this.location = ''})
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
  @JsonKey()
  final String code;
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
  final String? lat;
  @override
  @JsonKey(name: 'address_Longitude')
  final String? long;
  @override
  @JsonKey()
  final String location;

  @override
  String toString() {
    return 'UserModel(chefId: $chefId, driverId: $driverId, customerId: $customerId, message: $message, userName: $userName, email: $email, code: $code, accessToken: $accessToken, expiresIn: $expiresIn, address: $address, addressName: $addressName, lat: $lat, long: $long, location: $location)';
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
            (identical(other.code, code) || other.code == code) &&
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
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      chefId,
      driverId,
      customerId,
      message,
      userName,
      email,
      code,
      accessToken,
      expiresIn,
      address,
      addressName,
      lat,
      long,
      location);

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
      final String code,
      @JsonKey(name: 'access_Token') final String accessToken,
      @JsonKey(name: 'expires_In') final String expiresIn,
      final String? address,
      @JsonKey(name: 'address_Name') final String? addressName,
      @JsonKey(name: 'address_Lattitude') final String? lat,
      @JsonKey(name: 'address_Longitude') final String? long,
      final String location}) = _$InitialImpl;
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
  String get code;
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
  String? get lat;
  @override
  @JsonKey(name: 'address_Longitude')
  String? get long;
  @override
  String get location;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
