import 'package:common_code/common_code.dart';
import 'package:common_code/domain/auth/entities/signup_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:common_code/components/stateful_wrapper/stateful_wrapper.dart';
import 'package:yumi/app/pages/auth/registeration/pages/registeration_step.dart';
import 'package:yumi/app/pages/auth/registeration/pages/signup_screen/cubit/signup_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/verify_otp_sheet.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/count_down_cubit/count_down_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';

import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/validators/confirm_password_validator.dart';
import 'package:yumi/validators/email_validator.dart';
import 'package:yumi/validators/password_validator.dart';
import 'package:yumi/validators/required_validator.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();

    final signupCubit = context.read<SignupCubit>();

    final reg = context.read<RegCubit>();

    final fullNameField = TextFormFieldTemplate(
      key: key,
      label: S.of(context).fullName,
      inputFormatters: [
        FilteringTextInputFormatter.allow(CustomRegex.lettersBlankOnly)
      ],
      onSave: (value) {
        reg.setAccount(reg.state.signupData.copyWith(fullName: value));
      },
      validators: requiredValidator,
    );

    final userNameField = TextFormFieldTemplate(
      key: key,
      label: S.of(context).userName,
      onSave: (value) {
        reg.setAccount(reg.state.signupData.copyWith(userName: value));
      },
      validators: requiredValidator,
      inputFormatters: [
        FilteringTextInputFormatter.allow(CustomRegex.lettersNumbersOnly)
      ],
    );

    final emailField = TextFormFieldTemplate(
      key: key,
      label: S.of(context).email,
      // set on reload in cubit _navigateToIdx,
      initialValue: reg.state.willVerifyEmail,
      onSave: (value) {
        reg.setAccount(reg.state.signupData.copyWith(email: value));
      },
      onChange: (value) {
        reg.setWillVerifyEmail(value);
      },
      validators: emailValidator,
      suffixText: '                    ',
    );

    final verifyEmailButton = BlocBuilder<RegCubit, RegState>(
      builder: (context, state) {
        return InteractiveButton(
          height: 48,
          label: 'Verify',
          loadingLabel: '',
          style: InteractiveButtonStyle(
            backgroundColor:
                (state.verifiedEmail ?? 'x') == (state.willVerifyEmail ?? 'y')
                    ? Colors.grey
                    : null,
          ),
          onPressed: () => _sendEmailVerificationOtp(
            context,
            signupCubit,
          ),
        );
      },
    );

    final emailRow = Stack(
      children: [
        emailField,
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            height: 48,
            width: 96,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: verifyEmailButton,
          ),
        ),
      ],
    );

    final passwordField = TextFormFieldTemplate(
      key: key,
      label: S.of(context).password,
      onSave: (value) {
        reg.setAccount(reg.state.signupData.copyWith(password: value));
      },
      validators: passwordValidator,
      isPassword: true,
      controller: passwordController,
    );

    final confirmPasswordField = TextFormFieldTemplate(
      key: key,
      label: S.of(context).confirmPassword,
      validators: (value) {
        return confirmPasswordValidator(
            value: value, comparedValue: passwordController.text);
      },
      isPassword: true,
    );

    return StatefulWrapper(
      // WidgetsBinding.instance.addPostFrameCallback((_) async {});
      onInit: () async {
        final storageKey = VerifyOtpSheet.storageKey(OTPType.email);

        if (signupCubit.state.sheetIsActive) return;
        await hasActiveCountDown(storageKey: storageKey).then((value) async {
          if (!value) return;
          await _showOTPSheet(context);
        });
      },
      child: Form(
        child: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: CommonDimens.formFieldInlineGap),
            child: Column(
              children: [
                fullNameField,
                const SizedBox(height: CommonDimens.formFieldGap),
                userNameField,
                const SizedBox(height: CommonDimens.formFieldGap),
                emailRow,
                const SizedBox(height: CommonDimens.formFieldGap),
                passwordField,
                const SizedBox(height: CommonDimens.formFieldGap),
                confirmPasswordField,
                const SizedBox(height: CommonDimens.defaultGap),
                // Create Account Button
                InteractiveButton(
                  label: S.of(context).createAccount,
                  onLongPress: () => _signUp(context, true),
                  onPressed: () => _signUp(context),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

// PersistentBottomSheetController
Future<void> _showOTPSheet(BuildContext context) async {
  final signupCubit = context.read<SignupCubit>();

  signupCubit.setSheetIsActive(true);
  await showModalBottomSheet(
    context: G().context, // context mush have a scaffold
    isScrollControlled: true,
    enableDrag: true,
    sheetAnimationStyle: AnimationStyle(curve: Curves.bounceIn),
    backgroundColor: Colors.transparent,
    builder: (context) => VerifyOtpSheetProvider(
      value: G().rd<RegCubit>().state.willVerifyEmail ?? '',
      // otp: G().rd<RegCubit>().state.emailOTP,
    ),
  );

  signupCubit.setSheetIsActive(false);
}

Future<void> _sendEmailVerificationOtp(
  BuildContext context,
  SignupCubit signupCubit,
) async {
  final regCubit = G().rd<RegCubit>();

  if ((regCubit.state.verifiedEmail ?? '').isNotEmpty &&
      regCubit.state.verifiedEmail == regCubit.state.willVerifyEmail) {
    return G().snackBar(
      "${regCubit.state.verifiedEmail} is already verified",
    );
  }

  if (!emailStructure(regCubit.state.willVerifyEmail)) {
    return G().snackBar("Please enter a valid email");
  }

  final storageKey = VerifyOtpSheet.storageKey(OTPType.email);

  if (await hasActiveCountDown(storageKey: storageKey)) {
    final hasMatchingEmail =
        await counterStoredValue(storageKey: storageKey).then(
      (value) {
        if (value != regCubit.state.willVerifyEmail) return false;
        _showOTPSheet(context);
        return true;
      },
    );

    if (hasMatchingEmail) return;
  }

  try {
    if (context.mounted) context.read<CountDownCubit>().stop();
  } catch (e) {
    null;
  }

  await regCubit.getEmailOTP(regCubit.state.willVerifyEmail!).then(
    (sent) async {
      if (!sent) {
        return G().snackBar(
          "Please enter a valid email, nothing sent!",
        );
      }

      G().snackBar("Verification code sent");

      // signupCubit.showSheet(() => showOTPSheet());
      _showOTPSheet(context);
    },
  );
}

Future<void> _signUp(
  BuildContext context, [
  bool skipEmailVerification = false,
]) async {
  final reg = G().rd<RegCubit>();

  if (!Form.of(context).validate()) return;

  if (kDebugMode && skipEmailVerification) {
    // skip email verification
  } else if ((reg.state.verifiedEmail != reg.state.willVerifyEmail ||
      reg.state.willVerifyEmail == null ||
      reg.state.willVerifyEmail!.isEmpty)) {
    return G().snackBar("Please verify your email");
  }

  Form.of(context).save();

  await reg.signup().then((v) {
    if (!v) return G().snackBar(reg.state.singupError);

    final rp = RegisterationPage.of(context);
    rp?.done();
  });
}
