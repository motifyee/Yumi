part of 'forgot_password_cubit.dart';

enum ForgotPwdWindow {
  enterEmail,
  enterOTP,
  done,
}

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  // const factory ForgotPasswordState.initial() = _Initial;

  const factory ForgotPasswordState({
    @Default(false) bool isLoading,
    @Default('') String email,
    @Default('') String error,
    @Default(false) bool success,
    @Default(false) bool emailSent,
    @Default(false) bool emailFound,
    //
    @Default('') String otpCode,
    @Default(false) bool codeSent, // sent to be verified
    @Default(false) bool codeVerified,
    @Default('') String newPassword,
    @Default(false) bool passwordUpdated,
    //
    @Default(ForgotPwdWindow.enterEmail) ForgotPwdWindow window,
  }) = Initial;

  const ForgotPasswordState._();

  bool get isEmailValid => email.isNotEmpty && emailFound;

  bool get isCodeValid => otpCode.length == 4 && codeSent && codeVerified;

  bool get isPasswordUpdated => newPassword.length >= 8 && passwordUpdated;
}
