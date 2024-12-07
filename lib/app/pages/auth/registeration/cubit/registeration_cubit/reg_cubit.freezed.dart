// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reg_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegState {
  bool get partialFlow => throw _privateConstructorUsedError;
  bool get registerationStarted => throw _privateConstructorUsedError;
  bool get finished => throw _privateConstructorUsedError;
  int get step => throw _privateConstructorUsedError;

  /// stops automatic flow at [lastStep]
  int get lastStep =>
      throw _privateConstructorUsedError; // applies to partial flow
//
  String? get email => throw _privateConstructorUsedError;
  String? get willVerifyEmail => throw _privateConstructorUsedError;
  String? get verifiedEmail => throw _privateConstructorUsedError;
  String? get emailOTP => throw _privateConstructorUsedError;
  Status get verifiedEmailStatus => throw _privateConstructorUsedError; //
  SignupData get signupData => throw _privateConstructorUsedError; // step: 0
  String get singupError => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError; // step: 1
  String? get otp => throw _privateConstructorUsedError; // step: 2
  Address get address => throw _privateConstructorUsedError; // step: 3
//
  String get message => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String get addressMessage => throw _privateConstructorUsedError;
  Status get addressStatus => throw _privateConstructorUsedError; //
  Vehicle get vehicle => throw _privateConstructorUsedError;
  Status get ridesStatus => throw _privateConstructorUsedError; //
  int get storedOnboardingProgress => throw _privateConstructorUsedError;
  Unique? get unique => throw _privateConstructorUsedError;
  int? get countDown => throw _privateConstructorUsedError;

  /// Create a copy of RegState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegStateCopyWith<RegState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegStateCopyWith<$Res> {
  factory $RegStateCopyWith(RegState value, $Res Function(RegState) then) =
      _$RegStateCopyWithImpl<$Res, RegState>;
  @useResult
  $Res call(
      {bool partialFlow,
      bool registerationStarted,
      bool finished,
      int step,
      int lastStep,
      String? email,
      String? willVerifyEmail,
      String? verifiedEmail,
      String? emailOTP,
      Status verifiedEmailStatus,
      SignupData signupData,
      String singupError,
      String? phone,
      String? otp,
      Address address,
      String message,
      Status status,
      String addressMessage,
      Status addressStatus,
      Vehicle vehicle,
      Status ridesStatus,
      int storedOnboardingProgress,
      Unique? unique,
      int? countDown});

  $SignupDataCopyWith<$Res> get signupData;
  $AddressCopyWith<$Res> get address;
  $VehicleCopyWith<$Res> get vehicle;
}

/// @nodoc
class _$RegStateCopyWithImpl<$Res, $Val extends RegState>
    implements $RegStateCopyWith<$Res> {
  _$RegStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partialFlow = null,
    Object? registerationStarted = null,
    Object? finished = null,
    Object? step = null,
    Object? lastStep = null,
    Object? email = freezed,
    Object? willVerifyEmail = freezed,
    Object? verifiedEmail = freezed,
    Object? emailOTP = freezed,
    Object? verifiedEmailStatus = null,
    Object? signupData = null,
    Object? singupError = null,
    Object? phone = freezed,
    Object? otp = freezed,
    Object? address = null,
    Object? message = null,
    Object? status = null,
    Object? addressMessage = null,
    Object? addressStatus = null,
    Object? vehicle = null,
    Object? ridesStatus = null,
    Object? storedOnboardingProgress = null,
    Object? unique = freezed,
    Object? countDown = freezed,
  }) {
    return _then(_value.copyWith(
      partialFlow: null == partialFlow
          ? _value.partialFlow
          : partialFlow // ignore: cast_nullable_to_non_nullable
              as bool,
      registerationStarted: null == registerationStarted
          ? _value.registerationStarted
          : registerationStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      finished: null == finished
          ? _value.finished
          : finished // ignore: cast_nullable_to_non_nullable
              as bool,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      lastStep: null == lastStep
          ? _value.lastStep
          : lastStep // ignore: cast_nullable_to_non_nullable
              as int,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      willVerifyEmail: freezed == willVerifyEmail
          ? _value.willVerifyEmail
          : willVerifyEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedEmail: freezed == verifiedEmail
          ? _value.verifiedEmail
          : verifiedEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      emailOTP: freezed == emailOTP
          ? _value.emailOTP
          : emailOTP // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedEmailStatus: null == verifiedEmailStatus
          ? _value.verifiedEmailStatus
          : verifiedEmailStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      signupData: null == signupData
          ? _value.signupData
          : signupData // ignore: cast_nullable_to_non_nullable
              as SignupData,
      singupError: null == singupError
          ? _value.singupError
          : singupError // ignore: cast_nullable_to_non_nullable
              as String,
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
              as Status,
      addressMessage: null == addressMessage
          ? _value.addressMessage
          : addressMessage // ignore: cast_nullable_to_non_nullable
              as String,
      addressStatus: null == addressStatus
          ? _value.addressStatus
          : addressStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      vehicle: null == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as Vehicle,
      ridesStatus: null == ridesStatus
          ? _value.ridesStatus
          : ridesStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      storedOnboardingProgress: null == storedOnboardingProgress
          ? _value.storedOnboardingProgress
          : storedOnboardingProgress // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of RegState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SignupDataCopyWith<$Res> get signupData {
    return $SignupDataCopyWith<$Res>(_value.signupData, (value) {
      return _then(_value.copyWith(signupData: value) as $Val);
    });
  }

  /// Create a copy of RegState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }

  /// Create a copy of RegState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VehicleCopyWith<$Res> get vehicle {
    return $VehicleCopyWith<$Res>(_value.vehicle, (value) {
      return _then(_value.copyWith(vehicle: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> implements $RegStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool partialFlow,
      bool registerationStarted,
      bool finished,
      int step,
      int lastStep,
      String? email,
      String? willVerifyEmail,
      String? verifiedEmail,
      String? emailOTP,
      Status verifiedEmailStatus,
      SignupData signupData,
      String singupError,
      String? phone,
      String? otp,
      Address address,
      String message,
      Status status,
      String addressMessage,
      Status addressStatus,
      Vehicle vehicle,
      Status ridesStatus,
      int storedOnboardingProgress,
      Unique? unique,
      int? countDown});

  @override
  $SignupDataCopyWith<$Res> get signupData;
  @override
  $AddressCopyWith<$Res> get address;
  @override
  $VehicleCopyWith<$Res> get vehicle;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$RegStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partialFlow = null,
    Object? registerationStarted = null,
    Object? finished = null,
    Object? step = null,
    Object? lastStep = null,
    Object? email = freezed,
    Object? willVerifyEmail = freezed,
    Object? verifiedEmail = freezed,
    Object? emailOTP = freezed,
    Object? verifiedEmailStatus = null,
    Object? signupData = null,
    Object? singupError = null,
    Object? phone = freezed,
    Object? otp = freezed,
    Object? address = null,
    Object? message = null,
    Object? status = null,
    Object? addressMessage = null,
    Object? addressStatus = null,
    Object? vehicle = null,
    Object? ridesStatus = null,
    Object? storedOnboardingProgress = null,
    Object? unique = freezed,
    Object? countDown = freezed,
  }) {
    return _then(_$InitialImpl(
      partialFlow: null == partialFlow
          ? _value.partialFlow
          : partialFlow // ignore: cast_nullable_to_non_nullable
              as bool,
      registerationStarted: null == registerationStarted
          ? _value.registerationStarted
          : registerationStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      finished: null == finished
          ? _value.finished
          : finished // ignore: cast_nullable_to_non_nullable
              as bool,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      lastStep: null == lastStep
          ? _value.lastStep
          : lastStep // ignore: cast_nullable_to_non_nullable
              as int,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      willVerifyEmail: freezed == willVerifyEmail
          ? _value.willVerifyEmail
          : willVerifyEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedEmail: freezed == verifiedEmail
          ? _value.verifiedEmail
          : verifiedEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      emailOTP: freezed == emailOTP
          ? _value.emailOTP
          : emailOTP // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedEmailStatus: null == verifiedEmailStatus
          ? _value.verifiedEmailStatus
          : verifiedEmailStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      signupData: null == signupData
          ? _value.signupData
          : signupData // ignore: cast_nullable_to_non_nullable
              as SignupData,
      singupError: null == singupError
          ? _value.singupError
          : singupError // ignore: cast_nullable_to_non_nullable
              as String,
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
              as Status,
      addressMessage: null == addressMessage
          ? _value.addressMessage
          : addressMessage // ignore: cast_nullable_to_non_nullable
              as String,
      addressStatus: null == addressStatus
          ? _value.addressStatus
          : addressStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      vehicle: null == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as Vehicle,
      ridesStatus: null == ridesStatus
          ? _value.ridesStatus
          : ridesStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      storedOnboardingProgress: null == storedOnboardingProgress
          ? _value.storedOnboardingProgress
          : storedOnboardingProgress // ignore: cast_nullable_to_non_nullable
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
      {this.partialFlow = false,
      this.registerationStarted = false,
      this.finished = false,
      this.step = -1,
      this.lastStep = -1,
      this.email,
      this.willVerifyEmail,
      this.verifiedEmail,
      this.emailOTP,
      this.verifiedEmailStatus = Status.init,
      this.signupData = const SignupData(),
      this.singupError = '',
      this.phone,
      this.otp,
      this.address = const Address(isDefault: true),
      this.message = '',
      this.status = Status.init,
      this.addressMessage = '',
      this.addressStatus = Status.init,
      this.vehicle = const Vehicle(typeCode: 0),
      this.ridesStatus = Status.init,
      this.storedOnboardingProgress = 0,
      this.unique,
      this.countDown})
      : super._();

  @override
  @JsonKey()
  final bool partialFlow;
  @override
  @JsonKey()
  final bool registerationStarted;
  @override
  @JsonKey()
  final bool finished;
  @override
  @JsonKey()
  final int step;

  /// stops automatic flow at [lastStep]
  @override
  @JsonKey()
  final int lastStep;
// applies to partial flow
//
  @override
  final String? email;
  @override
  final String? willVerifyEmail;
  @override
  final String? verifiedEmail;
  @override
  final String? emailOTP;
  @override
  @JsonKey()
  final Status verifiedEmailStatus;
//
  @override
  @JsonKey()
  final SignupData signupData;
// step: 0
  @override
  @JsonKey()
  final String singupError;
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
  final Status status;
  @override
  @JsonKey()
  final String addressMessage;
  @override
  @JsonKey()
  final Status addressStatus;
//
  @override
  @JsonKey()
  final Vehicle vehicle;
  @override
  @JsonKey()
  final Status ridesStatus;
//
  @override
  @JsonKey()
  final int storedOnboardingProgress;
  @override
  final Unique? unique;
  @override
  final int? countDown;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegState(partialFlow: $partialFlow, registerationStarted: $registerationStarted, finished: $finished, step: $step, lastStep: $lastStep, email: $email, willVerifyEmail: $willVerifyEmail, verifiedEmail: $verifiedEmail, emailOTP: $emailOTP, verifiedEmailStatus: $verifiedEmailStatus, signupData: $signupData, singupError: $singupError, phone: $phone, otp: $otp, address: $address, message: $message, status: $status, addressMessage: $addressMessage, addressStatus: $addressStatus, vehicle: $vehicle, ridesStatus: $ridesStatus, storedOnboardingProgress: $storedOnboardingProgress, unique: $unique, countDown: $countDown)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegState'))
      ..add(DiagnosticsProperty('partialFlow', partialFlow))
      ..add(DiagnosticsProperty('registerationStarted', registerationStarted))
      ..add(DiagnosticsProperty('finished', finished))
      ..add(DiagnosticsProperty('step', step))
      ..add(DiagnosticsProperty('lastStep', lastStep))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('willVerifyEmail', willVerifyEmail))
      ..add(DiagnosticsProperty('verifiedEmail', verifiedEmail))
      ..add(DiagnosticsProperty('emailOTP', emailOTP))
      ..add(DiagnosticsProperty('verifiedEmailStatus', verifiedEmailStatus))
      ..add(DiagnosticsProperty('signupData', signupData))
      ..add(DiagnosticsProperty('singupError', singupError))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('otp', otp))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('addressMessage', addressMessage))
      ..add(DiagnosticsProperty('addressStatus', addressStatus))
      ..add(DiagnosticsProperty('vehicle', vehicle))
      ..add(DiagnosticsProperty('ridesStatus', ridesStatus))
      ..add(DiagnosticsProperty(
          'storedOnboardingProgress', storedOnboardingProgress))
      ..add(DiagnosticsProperty('unique', unique))
      ..add(DiagnosticsProperty('countDown', countDown));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.partialFlow, partialFlow) ||
                other.partialFlow == partialFlow) &&
            (identical(other.registerationStarted, registerationStarted) ||
                other.registerationStarted == registerationStarted) &&
            (identical(other.finished, finished) ||
                other.finished == finished) &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.lastStep, lastStep) ||
                other.lastStep == lastStep) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.willVerifyEmail, willVerifyEmail) ||
                other.willVerifyEmail == willVerifyEmail) &&
            (identical(other.verifiedEmail, verifiedEmail) ||
                other.verifiedEmail == verifiedEmail) &&
            (identical(other.emailOTP, emailOTP) ||
                other.emailOTP == emailOTP) &&
            (identical(other.verifiedEmailStatus, verifiedEmailStatus) ||
                other.verifiedEmailStatus == verifiedEmailStatus) &&
            (identical(other.signupData, signupData) ||
                other.signupData == signupData) &&
            (identical(other.singupError, singupError) ||
                other.singupError == singupError) &&
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
            (identical(other.ridesStatus, ridesStatus) ||
                other.ridesStatus == ridesStatus) &&
            (identical(
                    other.storedOnboardingProgress, storedOnboardingProgress) ||
                other.storedOnboardingProgress == storedOnboardingProgress) &&
            (identical(other.unique, unique) || other.unique == unique) &&
            (identical(other.countDown, countDown) ||
                other.countDown == countDown));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        partialFlow,
        registerationStarted,
        finished,
        step,
        lastStep,
        email,
        willVerifyEmail,
        verifiedEmail,
        emailOTP,
        verifiedEmailStatus,
        signupData,
        singupError,
        phone,
        otp,
        address,
        message,
        status,
        addressMessage,
        addressStatus,
        vehicle,
        ridesStatus,
        storedOnboardingProgress,
        unique,
        countDown
      ]);

  /// Create a copy of RegState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial extends RegState {
  const factory _Initial(
      {final bool partialFlow,
      final bool registerationStarted,
      final bool finished,
      final int step,
      final int lastStep,
      final String? email,
      final String? willVerifyEmail,
      final String? verifiedEmail,
      final String? emailOTP,
      final Status verifiedEmailStatus,
      final SignupData signupData,
      final String singupError,
      final String? phone,
      final String? otp,
      final Address address,
      final String message,
      final Status status,
      final String addressMessage,
      final Status addressStatus,
      final Vehicle vehicle,
      final Status ridesStatus,
      final int storedOnboardingProgress,
      final Unique? unique,
      final int? countDown}) = _$InitialImpl;
  const _Initial._() : super._();

  @override
  bool get partialFlow;
  @override
  bool get registerationStarted;
  @override
  bool get finished;
  @override
  int get step;

  /// stops automatic flow at [lastStep]
  @override
  int get lastStep; // applies to partial flow
//
  @override
  String? get email;
  @override
  String? get willVerifyEmail;
  @override
  String? get verifiedEmail;
  @override
  String? get emailOTP;
  @override
  Status get verifiedEmailStatus; //
  @override
  SignupData get signupData; // step: 0
  @override
  String get singupError;
  @override
  String? get phone; // step: 1
  @override
  String? get otp; // step: 2
  @override
  Address get address; // step: 3
//
  @override
  String get message;
  @override
  Status get status;
  @override
  String get addressMessage;
  @override
  Status get addressStatus; //
  @override
  Vehicle get vehicle;
  @override
  Status get ridesStatus; //
  @override
  int get storedOnboardingProgress;
  @override
  Unique? get unique;
  @override
  int? get countDown;

  /// Create a copy of RegState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
