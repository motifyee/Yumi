// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForgotPasswordState {
  bool get isLoading => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  bool get emailSent => throw _privateConstructorUsedError;
  bool get emailFound => throw _privateConstructorUsedError; //
  String get otpCode => throw _privateConstructorUsedError;
  bool get codeSent =>
      throw _privateConstructorUsedError; // sent to be verified
  bool get codeVerified => throw _privateConstructorUsedError;
  String get newPassword => throw _privateConstructorUsedError;
  bool get passwordUpdated => throw _privateConstructorUsedError; //
  ForgotPwdWindow get window => throw _privateConstructorUsedError; //
  int? get initialCountDownTime => throw _privateConstructorUsedError;
  int? get countDown => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgotPasswordStateCopyWith<ForgotPwdState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordStateCopyWith<$Res> {
  factory $ForgotPasswordStateCopyWith(
          ForgotPwdState value, $Res Function(ForgotPwdState) then) =
      _$ForgotPasswordStateCopyWithImpl<$Res, ForgotPwdState>;
  @useResult
  $Res call(
      {bool isLoading,
      String email,
      String error,
      bool success,
      bool emailSent,
      bool emailFound,
      String otpCode,
      bool codeSent,
      bool codeVerified,
      String newPassword,
      bool passwordUpdated,
      ForgotPwdWindow window,
      int? initialCountDownTime,
      int? countDown});
}

/// @nodoc
class _$ForgotPasswordStateCopyWithImpl<$Res, $Val extends ForgotPwdState>
    implements $ForgotPasswordStateCopyWith<$Res> {
  _$ForgotPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? email = null,
    Object? error = null,
    Object? success = null,
    Object? emailSent = null,
    Object? emailFound = null,
    Object? otpCode = null,
    Object? codeSent = null,
    Object? codeVerified = null,
    Object? newPassword = null,
    Object? passwordUpdated = null,
    Object? window = null,
    Object? initialCountDownTime = freezed,
    Object? countDown = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      emailSent: null == emailSent
          ? _value.emailSent
          : emailSent // ignore: cast_nullable_to_non_nullable
              as bool,
      emailFound: null == emailFound
          ? _value.emailFound
          : emailFound // ignore: cast_nullable_to_non_nullable
              as bool,
      otpCode: null == otpCode
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String,
      codeSent: null == codeSent
          ? _value.codeSent
          : codeSent // ignore: cast_nullable_to_non_nullable
              as bool,
      codeVerified: null == codeVerified
          ? _value.codeVerified
          : codeVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      passwordUpdated: null == passwordUpdated
          ? _value.passwordUpdated
          : passwordUpdated // ignore: cast_nullable_to_non_nullable
              as bool,
      window: null == window
          ? _value.window
          : window // ignore: cast_nullable_to_non_nullable
              as ForgotPwdWindow,
      initialCountDownTime: freezed == initialCountDownTime
          ? _value.initialCountDownTime
          : initialCountDownTime // ignore: cast_nullable_to_non_nullable
              as int?,
      countDown: freezed == countDown
          ? _value.countDown
          : countDown // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ForgotPasswordStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String email,
      String error,
      bool success,
      bool emailSent,
      bool emailFound,
      String otpCode,
      bool codeSent,
      bool codeVerified,
      String newPassword,
      bool passwordUpdated,
      ForgotPwdWindow window,
      int? initialCountDownTime,
      int? countDown});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? email = null,
    Object? error = null,
    Object? success = null,
    Object? emailSent = null,
    Object? emailFound = null,
    Object? otpCode = null,
    Object? codeSent = null,
    Object? codeVerified = null,
    Object? newPassword = null,
    Object? passwordUpdated = null,
    Object? window = null,
    Object? initialCountDownTime = freezed,
    Object? countDown = freezed,
  }) {
    return _then(_$InitialImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      emailSent: null == emailSent
          ? _value.emailSent
          : emailSent // ignore: cast_nullable_to_non_nullable
              as bool,
      emailFound: null == emailFound
          ? _value.emailFound
          : emailFound // ignore: cast_nullable_to_non_nullable
              as bool,
      otpCode: null == otpCode
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String,
      codeSent: null == codeSent
          ? _value.codeSent
          : codeSent // ignore: cast_nullable_to_non_nullable
              as bool,
      codeVerified: null == codeVerified
          ? _value.codeVerified
          : codeVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      passwordUpdated: null == passwordUpdated
          ? _value.passwordUpdated
          : passwordUpdated // ignore: cast_nullable_to_non_nullable
              as bool,
      window: null == window
          ? _value.window
          : window // ignore: cast_nullable_to_non_nullable
              as ForgotPwdWindow,
      initialCountDownTime: freezed == initialCountDownTime
          ? _value.initialCountDownTime
          : initialCountDownTime // ignore: cast_nullable_to_non_nullable
              as int?,
      countDown: freezed == countDown
          ? _value.countDown
          : countDown // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends Initial {
  const _$InitialImpl(
      {this.isLoading = false,
      this.email = '',
      this.error = '',
      this.success = false,
      this.emailSent = false,
      this.emailFound = false,
      this.otpCode = '',
      this.codeSent = false,
      this.codeVerified = false,
      this.newPassword = '',
      this.passwordUpdated = false,
      this.window = ForgotPwdWindow.enterEmail,
      this.initialCountDownTime,
      this.countDown})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String error;
  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final bool emailSent;
  @override
  @JsonKey()
  final bool emailFound;
//
  @override
  @JsonKey()
  final String otpCode;
  @override
  @JsonKey()
  final bool codeSent;
// sent to be verified
  @override
  @JsonKey()
  final bool codeVerified;
  @override
  @JsonKey()
  final String newPassword;
  @override
  @JsonKey()
  final bool passwordUpdated;
//
  @override
  @JsonKey()
  final ForgotPwdWindow window;
//
  @override
  final int? initialCountDownTime;
  @override
  final int? countDown;

  @override
  String toString() {
    return 'ForgotPasswordState(isLoading: $isLoading, email: $email, error: $error, success: $success, emailSent: $emailSent, emailFound: $emailFound, otpCode: $otpCode, codeSent: $codeSent, codeVerified: $codeVerified, newPassword: $newPassword, passwordUpdated: $passwordUpdated, window: $window, initialCountDownTime: $initialCountDownTime, countDown: $countDown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.emailSent, emailSent) ||
                other.emailSent == emailSent) &&
            (identical(other.emailFound, emailFound) ||
                other.emailFound == emailFound) &&
            (identical(other.otpCode, otpCode) || other.otpCode == otpCode) &&
            (identical(other.codeSent, codeSent) ||
                other.codeSent == codeSent) &&
            (identical(other.codeVerified, codeVerified) ||
                other.codeVerified == codeVerified) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.passwordUpdated, passwordUpdated) ||
                other.passwordUpdated == passwordUpdated) &&
            (identical(other.window, window) || other.window == window) &&
            (identical(other.initialCountDownTime, initialCountDownTime) ||
                other.initialCountDownTime == initialCountDownTime) &&
            (identical(other.countDown, countDown) ||
                other.countDown == countDown));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      email,
      error,
      success,
      emailSent,
      emailFound,
      otpCode,
      codeSent,
      codeVerified,
      newPassword,
      passwordUpdated,
      window,
      initialCountDownTime,
      countDown);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class Initial extends ForgotPwdState {
  const factory Initial(
      {final bool isLoading,
      final String email,
      final String error,
      final bool success,
      final bool emailSent,
      final bool emailFound,
      final String otpCode,
      final bool codeSent,
      final bool codeVerified,
      final String newPassword,
      final bool passwordUpdated,
      final ForgotPwdWindow window,
      final int? initialCountDownTime,
      final int? countDown}) = _$InitialImpl;
  const Initial._() : super._();

  @override
  bool get isLoading;
  @override
  String get email;
  @override
  String get error;
  @override
  bool get success;
  @override
  bool get emailSent;
  @override
  bool get emailFound;
  @override //
  String get otpCode;
  @override
  bool get codeSent;
  @override // sent to be verified
  bool get codeVerified;
  @override
  String get newPassword;
  @override
  bool get passwordUpdated;
  @override //
  ForgotPwdWindow get window;
  @override //
  int? get initialCountDownTime;
  @override
  int? get countDown;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
