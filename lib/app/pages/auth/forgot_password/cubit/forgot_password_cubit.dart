import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/profile/use_cases/forgot_password.dart';
import 'package:yumi/domain/profile/use_cases/get_otp.dart';
import 'package:yumi/domain/profile/use_cases/verify_reset_pwd_otp.dart';
import 'package:yumi/global.dart';
import 'package:yumi/util/util.dart';

part 'forgot_password_state.dart';
part 'forgot_password_cubit.freezed.dart';

const forgotPwdEmailKey = 'forgot_pwd_email';
const forgotPwdTimeKey = 'forgot_pwd_time';

class ForgotPwdCubit extends Cubit<ForgotPasswordState> {
  ForgotPwdCubit() : super(const ForgotPasswordState());

  void emailChanged(String email) {
    emit(state.copyWith(email: email));
  }

  void init() async {
    final prefs = await G.prefs;

    final email = prefs.getString(forgotPwdEmailKey);
    if (email == null) return;

    final time = prefs.getInt(forgotPwdTimeKey) ?? 0;

    if ((DateTime.now().millisecondsSinceEpoch - time) >= 1000 * 60) {
      prefs.remove(forgotPwdTimeKey);
      prefs.remove(forgotPwdEmailKey);
      return;
    }

    emit(state.copyWith(
      email: email,
      initialCountDownTime: time,
      window: ForgotPwdWindow.enterOTP,
    ));
    startCountDown();
  }

  Unique? _unique;
  void startCountDown([int countDown = 60]) {
    final lUnique = unique();

    if (state.countDown == null) {
      _unique = lUnique;

      final d = DateTime.now().millisecondsSinceEpoch -
          (state.initialCountDownTime ?? 0);

      emit(
        state.copyWith(
          countDown: countDown - (d / 1000).round(),
        ),
      );
    }
    void recur() => Future.delayed(const Duration(seconds: 1), () {
          if (state.countDown == null) return; // has been stopped
          if (lUnique != _unique) return; // has been restarted

          if ((state.countDown ?? 0) <= 0) {
            return emit(state.copyWith(countDown: null));
          }

          emit(state.copyWith(countDown: state.countDown! - 1));

          recur();
        });

    recur();
  }

  void stopCountDown() => emit(state.copyWith(countDown: null));

  Future<void> forgotPassword([String? email]) async {
    final email0 = email ?? state.email;

    emit(state.copyWith(isLoading: true, email: email0));

    final forgot = await ForgotPassword().call(ForgotPasswordParams(email0));

    forgot.fold(
      (l) => emit(state.copyWith(
        error: 'Can\'t reset password, check your email!',
        isLoading: false,
        emailFound: false,
      )),
      (r) async {
        final initialCountDown = DateTime.now().millisecondsSinceEpoch;

        final prefs = await G.prefs;
        prefs.setString(forgotPwdEmailKey, email0);
        prefs.setInt(forgotPwdTimeKey, initialCountDown);

        emit(state.copyWith(
          isLoading: false,
          email: email0,
          initialCountDownTime: initialCountDown,
          countDown: null,
          emailFound: true,
        ));

        startCountDown();
      },
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

  Future<void> verifyResetPasswordOTPCode(String otp, String password) async {
    emit(state.copyWith(isLoading: true));

    final verify = await VerifyResetPasswordOTP()
        .call(VerifyResetPasswordOTPParams(state.email, otp, password));
    Failure;
    verify.fold(
      (l) => emit(state.copyWith(
        codeSent: true,
        codeVerified: false,
        isLoading: false,
        otpCode: otp,
        newPassword: password,
        error: switch (l) {
          ServerFailure() => (l.error as dynamic).error as String,
          NetworkFailure() => 'Can\'t connect to server',
          _ => 'Something went wrong',
        },
      )),
      (r) {
        emit(state.copyWith(
          codeSent: true,
          codeVerified: true,
          isLoading: false,
          window: ForgotPwdWindow.done,
        ));

        stopCountDown();
      },
    );
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

  @override
  Future<void> close() {
    _unique = unique();

    return super.close();
  }
}
