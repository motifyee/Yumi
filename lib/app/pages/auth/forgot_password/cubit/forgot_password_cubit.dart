import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/profile/use_cases/forgot_password.dart';
import 'package:yumi/domain/profile/use_cases/get_otp.dart';
import 'package:yumi/domain/profile/use_cases/verify_otp.dart';
import 'package:yumi/global.dart';

part 'forgot_password_state.dart';
part 'forgot_password_cubit.freezed.dart';

class ForgotPwdCubit extends Cubit<ForgotPasswordState> {
  ForgotPwdCubit() : super(const ForgotPasswordState());

  void emailChanged(String email) {
    emit(state.copyWith(email: email));
  }

  Future<void> forgotPassword(String email) async {
    emit(state.copyWith(isLoading: true, email: email));

    final forgot = await ForgotPassword().call(ForgotPasswordParams(email));

    forgot.fold(
      (l) => emit(state.copyWith(
        error: 'Can\'t reset password, check your email!',
        isLoading: false,
        emailFound: false,
      )),
      (r) => emit(state.copyWith(
        isLoading: false,
        email: email,
        emailFound: true,
      )),
    );

    if (state.isEmailValid) {
      final otp = await GetOTP().call(NoParams());

      otp.fold(
        (l) => null,
        (r) => emit(state.copyWith(otpCode: r)),
      );

      emit(state.copyWith(window: ForgotPwdWindow.enterOTP));
    }
  }

  Future<void> verifyOTPCode(String code) async {
    emit(state.copyWith(isLoading: true));

    final verify = await VerifyOTP().call(VerifyOTPParams(code));

    verify.fold(
      (l) => emit(state.copyWith(
        codeSent: true,
        codeVerified: false,
        isLoading: false,
      )),
      (r) => emit(state.copyWith(
        codeSent: true,
        codeVerified: true,
        isLoading: false,
      )),
    );

    if (state.isCodeValid) {
      emit(state.copyWith(window: ForgotPwdWindow.enterPwd));
    }
  }

  Future<void> resetPassword(String password) async {
    emit(state.copyWith(
      newPassword: password,
      passwordUpdated: true,
    ));

    if (state.isPasswordUpdated) {
      G.pop();
    }
  }

  void setWindow(ForgotPwdWindow window) {
    emit(state.copyWith(window: window));
  }
}
