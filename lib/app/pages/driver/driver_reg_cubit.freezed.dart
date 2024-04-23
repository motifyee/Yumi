// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_reg_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NRegState {
  bool get registerationStarted => throw _privateConstructorUsedError;
  int get step => throw _privateConstructorUsedError; //
  RegisterationForm? get singupData =>
      throw _privateConstructorUsedError; // step: 0
  String? get phone => throw _privateConstructorUsedError; // step: 1
  String? get otp => throw _privateConstructorUsedError; // step: 2
  Address get address => throw _privateConstructorUsedError; // step: 3
//
  String get message => throw _privateConstructorUsedError;
  ObseleteStatusEnum get status => throw _privateConstructorUsedError;
  String get addressMessage => throw _privateConstructorUsedError;
  ObseleteStatusEnum get addressStatus => throw _privateConstructorUsedError; //
// bool? otherVehicle,
// String? vehicleType,
  Vehicle get vehicle => throw _privateConstructorUsedError; //
  int get onboardingProgress =>
      throw _privateConstructorUsedError; // timeStamp forces comparison of the same state to fail
  Unique? get unique => throw _privateConstructorUsedError;
  int? get countDown => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NRegStateCopyWith<NRegState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NRegStateCopyWith<$Res> {
  factory $NRegStateCopyWith(NRegState value, $Res Function(NRegState) then) =
      _$NRegStateCopyWithImpl<$Res, NRegState>;
  @useResult
  $Res call(
      {bool registerationStarted,
      int step,
      RegisterationForm? singupData,
      String? phone,
      String? otp,
      Address address,
      String message,
      ObseleteStatusEnum status,
      String addressMessage,
      ObseleteStatusEnum addressStatus,
      Vehicle vehicle,
      int onboardingProgress,
      Unique? unique,
      int? countDown});

  $RegisterationFormCopyWith<$Res>? get singupData;
  $AddressCopyWith<$Res> get address;
  $VehicleCopyWith<$Res> get vehicle;
}

/// @nodoc
class _$NRegStateCopyWithImpl<$Res, $Val extends NRegState>
    implements $NRegStateCopyWith<$Res> {
  _$NRegStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registerationStarted = null,
    Object? step = null,
    Object? singupData = freezed,
    Object? phone = freezed,
    Object? otp = freezed,
    Object? address = null,
    Object? message = null,
    Object? status = null,
    Object? addressMessage = null,
    Object? addressStatus = null,
    Object? vehicle = null,
    Object? onboardingProgress = null,
    Object? unique = freezed,
    Object? countDown = freezed,
  }) {
    return _then(_value.copyWith(
      registerationStarted: null == registerationStarted
          ? _value.registerationStarted
          : registerationStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      singupData: freezed == singupData
          ? _value.singupData
          : singupData // ignore: cast_nullable_to_non_nullable
              as RegisterationForm?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ObseleteStatusEnum,
      addressMessage: null == addressMessage
          ? _value.addressMessage
          : addressMessage // ignore: cast_nullable_to_non_nullable
              as String,
      addressStatus: null == addressStatus
          ? _value.addressStatus
          : addressStatus // ignore: cast_nullable_to_non_nullable
              as ObseleteStatusEnum,
      vehicle: null == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as Vehicle,
      onboardingProgress: null == onboardingProgress
          ? _value.onboardingProgress
          : onboardingProgress // ignore: cast_nullable_to_non_nullable
              as int,
      unique: freezed == unique
          ? _value.unique
          : unique // ignore: cast_nullable_to_non_nullable
              as Unique?,
      countDown: freezed == countDown
          ? _value.countDown
          : countDown // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RegisterationFormCopyWith<$Res>? get singupData {
    if (_value.singupData == null) {
      return null;
    }

    return $RegisterationFormCopyWith<$Res>(_value.singupData!, (value) {
      return _then(_value.copyWith(singupData: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $VehicleCopyWith<$Res> get vehicle {
    return $VehicleCopyWith<$Res>(_value.vehicle, (value) {
      return _then(_value.copyWith(vehicle: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $NRegStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool registerationStarted,
      int step,
      RegisterationForm? singupData,
      String? phone,
      String? otp,
      Address address,
      String message,
      ObseleteStatusEnum status,
      String addressMessage,
      ObseleteStatusEnum addressStatus,
      Vehicle vehicle,
      int onboardingProgress,
      Unique? unique,
      int? countDown});

  @override
  $RegisterationFormCopyWith<$Res>? get singupData;
  @override
  $AddressCopyWith<$Res> get address;
  @override
  $VehicleCopyWith<$Res> get vehicle;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$NRegStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registerationStarted = null,
    Object? step = null,
    Object? singupData = freezed,
    Object? phone = freezed,
    Object? otp = freezed,
    Object? address = null,
    Object? message = null,
    Object? status = null,
    Object? addressMessage = null,
    Object? addressStatus = null,
    Object? vehicle = null,
    Object? onboardingProgress = null,
    Object? unique = freezed,
    Object? countDown = freezed,
  }) {
    return _then(_$InitialImpl(
      registerationStarted: null == registerationStarted
          ? _value.registerationStarted
          : registerationStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      singupData: freezed == singupData
          ? _value.singupData
          : singupData // ignore: cast_nullable_to_non_nullable
              as RegisterationForm?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ObseleteStatusEnum,
      addressMessage: null == addressMessage
          ? _value.addressMessage
          : addressMessage // ignore: cast_nullable_to_non_nullable
              as String,
      addressStatus: null == addressStatus
          ? _value.addressStatus
          : addressStatus // ignore: cast_nullable_to_non_nullable
              as ObseleteStatusEnum,
      vehicle: null == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as Vehicle,
      onboardingProgress: null == onboardingProgress
          ? _value.onboardingProgress
          : onboardingProgress // ignore: cast_nullable_to_non_nullable
              as int,
      unique: freezed == unique
          ? _value.unique
          : unique // ignore: cast_nullable_to_non_nullable
              as Unique?,
      countDown: freezed == countDown
          ? _value.countDown
          : countDown // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends _Initial with DiagnosticableTreeMixin {
  const _$InitialImpl(
      {this.registerationStarted = false,
      this.step = 0,
      this.singupData,
      this.phone,
      this.otp,
      this.address = const Address(isDefault: true),
      this.message = '',
      this.status = ObseleteStatusEnum.init,
      this.addressMessage = '',
      this.addressStatus = ObseleteStatusEnum.init,
      this.vehicle = const Vehicle(typeCode: 0),
      this.onboardingProgress = 0,
      this.unique,
      this.countDown})
      : super._();

  @override
  @JsonKey()
  final bool registerationStarted;
  @override
  @JsonKey()
  final int step;
//
  @override
  final RegisterationForm? singupData;
// step: 0
  @override
  final String? phone;
// step: 1
  @override
  final String? otp;
// step: 2
  @override
  @JsonKey()
  final Address address;
// step: 3
//
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final ObseleteStatusEnum status;
  @override
  @JsonKey()
  final String addressMessage;
  @override
  @JsonKey()
  final ObseleteStatusEnum addressStatus;
//
// bool? otherVehicle,
// String? vehicleType,
  @override
  @JsonKey()
  final Vehicle vehicle;
//
  @override
  @JsonKey()
  final int onboardingProgress;
// timeStamp forces comparison of the same state to fail
  @override
  final Unique? unique;
  @override
  final int? countDown;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NRegState(registerationStarted: $registerationStarted, step: $step, singupData: $singupData, phone: $phone, otp: $otp, address: $address, message: $message, status: $status, addressMessage: $addressMessage, addressStatus: $addressStatus, vehicle: $vehicle, onboardingProgress: $onboardingProgress, unique: $unique, countDown: $countDown)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NRegState'))
      ..add(DiagnosticsProperty('registerationStarted', registerationStarted))
      ..add(DiagnosticsProperty('step', step))
      ..add(DiagnosticsProperty('singupData', singupData))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('otp', otp))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('addressMessage', addressMessage))
      ..add(DiagnosticsProperty('addressStatus', addressStatus))
      ..add(DiagnosticsProperty('vehicle', vehicle))
      ..add(DiagnosticsProperty('onboardingProgress', onboardingProgress))
      ..add(DiagnosticsProperty('unique', unique))
      ..add(DiagnosticsProperty('countDown', countDown));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.registerationStarted, registerationStarted) ||
                other.registerationStarted == registerationStarted) &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.singupData, singupData) ||
                other.singupData == singupData) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.addressMessage, addressMessage) ||
                other.addressMessage == addressMessage) &&
            (identical(other.addressStatus, addressStatus) ||
                other.addressStatus == addressStatus) &&
            (identical(other.vehicle, vehicle) || other.vehicle == vehicle) &&
            (identical(other.onboardingProgress, onboardingProgress) ||
                other.onboardingProgress == onboardingProgress) &&
            (identical(other.unique, unique) || other.unique == unique) &&
            (identical(other.countDown, countDown) ||
                other.countDown == countDown));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      registerationStarted,
      step,
      singupData,
      phone,
      otp,
      address,
      message,
      status,
      addressMessage,
      addressStatus,
      vehicle,
      onboardingProgress,
      unique,
      countDown);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial extends NRegState {
  const factory _Initial(
      {final bool registerationStarted,
      final int step,
      final RegisterationForm? singupData,
      final String? phone,
      final String? otp,
      final Address address,
      final String message,
      final ObseleteStatusEnum status,
      final String addressMessage,
      final ObseleteStatusEnum addressStatus,
      final Vehicle vehicle,
      final int onboardingProgress,
      final Unique? unique,
      final int? countDown}) = _$InitialImpl;
  const _Initial._() : super._();

  @override
  bool get registerationStarted;
  @override
  int get step;
  @override //
  RegisterationForm? get singupData;
  @override // step: 0
  String? get phone;
  @override // step: 1
  String? get otp;
  @override // step: 2
  Address get address;
  @override // step: 3
//
  String get message;
  @override
  ObseleteStatusEnum get status;
  @override
  String get addressMessage;
  @override
  ObseleteStatusEnum get addressStatus;
  @override //
// bool? otherVehicle,
// String? vehicleType,
  Vehicle get vehicle;
  @override //
  int get onboardingProgress;
  @override // timeStamp forces comparison of the same state to fail
  Unique? get unique;
  @override
  int? get countDown;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
