import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/components/interactive_button/interactive_button.dart';
import 'package:yumi/app/components/interactive_button/interactive_button_style.dart';
import 'package:yumi/app/components/stateful_wrapper/stateful_wrapper.dart';
import 'package:yumi/app/pages/auth/registeration/repository/signup_service.dart';
import 'package:yumi/app/pages/auth/registeration/pages/signup_screen/cubit/signup_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/verify_otp_sheet.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/count_down_cubit/count_down_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/app/pages/profile/cubit/profile_cubit.dart';
import 'package:yumi/domain/user/cubit/user_cubit.dart';

import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/regex.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/text_form_field.dart';
import 'package:yumi/validators/confirm_password_validator.dart';
import 'package:yumi/validators/email_validator.dart';
import 'package:yumi/validators/password_validator.dart';
import 'package:yumi/validators/required_validator.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController? passwordController;
  final GlobalKey<FormState> signUpFormKey;

  const SignUpForm(
      {super.key, required this.signUpFormKey, this.passwordController});

  @override
  Widget build(BuildContext context) {
    final signupCubit = context.read<SignupCubit>();

    final reg = context.read<RegCubit>();

    // WidgetsBinding.instance.addPostFrameCallback((_) async {});

    return StatefulWrapper(
      onInit: () async {
        final storageKey = VerifyOtpSheet.storageKey(OTPType.email);

        if (signupCubit.state.sheetIsActive) return;
        await hasActiveCountDown(storageKey: storageKey).then((value) async {
          if (!value) return;
          await _showOTPSheet(context);
        });
      },
      child: Form(
        key: signUpFormKey,
        child: Builder(builder: (context) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ThemeSelector.statics.formFieldInlineGap),
            child: Column(
              children: [
                // full name
                TextFormFieldTemplate(
                  key: key,
                  label: S.of(context).fullName,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        CustomRegex.lettersBlankOnly)
                  ],
                  onSave: (value) {
                    reg.setAccount(
                        reg.state.signupData.copyWith(fullName: value));
                  },
                  validators: requiredValidator,
                ),
                SizedBox(height: ThemeSelector.statics.formFieldGap),
                // user name
                TextFormFieldTemplate(
                  key: key,
                  label: S.of(context).userName,
                  onSave: (value) {
                    reg.setAccount(
                        reg.state.signupData.copyWith(userName: value));
                  },
                  validators: requiredValidator,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        CustomRegex.lettersNumbersOnly)
                  ],
                ),
                SizedBox(height: ThemeSelector.statics.formFieldGap),
                // email
                Stack(
                  children: [
                    TextFormFieldTemplate(
                      key: key,
                      label: S.of(context).email,
                      // set on reload in cubit _navigateToIdx,
                      initialValue: reg.state.willVerifyEmail,
                      onSave: (value) {
                        reg.setAccount(
                            reg.state.signupData.copyWith(email: value));
                      },
                      onChange: (value) {
                        reg.setWillVerifyEmail(value);
                      },
                      validators: emailValidator,
                      suffixText: '                    ',
                    ),
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
                        child: BlocBuilder<RegCubit, RegState>(
                          builder: (context, state) {
                            return InteractiveButton(
                              height: 48,
                              label: 'Verify',
                              loadingLabel: '',
                              style: InteractiveButtonStyle(
                                backgroundColor: (state.verifiedEmail ?? 'x') ==
                                        (state.willVerifyEmail ?? 'y')
                                    ? Colors.grey
                                    : null,
                              ),
                              onPressed: () => _verifyEmailOtp(
                                context,
                                signupCubit,
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: ThemeSelector.statics.formFieldGap),
                // password
                TextFormFieldTemplate(
                  key: key,
                  label: S.of(context).password,
                  onSave: (value) {
                    reg.setAccount(
                        reg.state.signupData.copyWith(password: value));
                  },
                  validators: passwordValidator,
                  isPassword: true,
                  controller: passwordController,
                ),
                SizedBox(height: ThemeSelector.statics.formFieldGap),
                // confirm password
                TextFormFieldTemplate(
                  key: key,
                  label: S.of(context).confirmPassword,
                  validators: (value) {
                    return confirmPasswordValidator(
                        value: value, comparedValue: passwordController?.text);
                  },
                  isPassword: true,
                ),
                SizedBox(height: ThemeSelector.statics.defaultGap),
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
    context: G.context, // context mush have a scaffold
    isScrollControlled: true,
    enableDrag: true,
    sheetAnimationStyle: AnimationStyle(curve: Curves.bounceIn),
    backgroundColor: Colors.transparent,
    builder: (context) => VerifyOtpSheetProvider(
      value: G.rd<RegCubit>().state.willVerifyEmail ?? '',
      // otp: G.rd<RegCubit>().state.emailOTP,
    ),
  );

  signupCubit.setSheetIsActive(false);
}

Future<void> _verifyEmailOtp(
    BuildContext context, SignupCubit signupCubit) async {
  final reg = G.rd<RegCubit>();

  if ((reg.state.verifiedEmail ?? '').isNotEmpty &&
      reg.state.verifiedEmail == reg.state.willVerifyEmail) {
    return G.snackBar(
      "${reg.state.verifiedEmail} is already verified",
    );
  }

  if (!emailStructure(reg.state.willVerifyEmail)) {
    return G.snackBar("Please enter a valid email");
  }

  final storageKey = VerifyOtpSheet.storageKey(OTPType.email);

  if (await hasActiveCountDown(storageKey: storageKey)) {
    if (await counterStoredValue(storageKey: storageKey).then(
      (value) {
        if (value != reg.state.willVerifyEmail) return false;
        _showOTPSheet(context);
        return true;
      },
    )) {
      return;
    }

    try {
      if (context.mounted) context.read<CountDownCubit>().stopCountDown();
    } catch (e) {}
  }

  await reg.getEmailOTP(reg.state.willVerifyEmail!).then(
    (sent) async {
      if (!sent) {
        return G.snackBar(
          "Please enter a valid email, nothing sent!",
        );
      }

      G.snackBar("Verification code sent");

      // signupCubit.showSheet(() => showOTPSheet());
      _showOTPSheet(context);
    },
  );
}

Future<void> _signUp(
  BuildContext context, [
  bool skipEmailVerification = false,
]) async {
  if (skipEmailVerification && kReleaseMode) return;

  final reg = G.rd<RegCubit>();

  if (!Form.of(context).validate()) return;

  if (!skipEmailVerification &&
      (reg.state.verifiedEmail != reg.state.willVerifyEmail ||
          reg.state.willVerifyEmail == null ||
          reg.state.willVerifyEmail!.isEmpty)) {
    return G.snackBar("Please verify your email");
  }

  Form.of(context).save();

  await SignUpService.signUp(signup: reg.state.signupData, context: G.context)
      .then((value) {
    value = jsonDecode(value.toString());

    if (value["message"].contains('Created')) {
      var idReg = RegExp(r"Created with id:\s*(.*)");

      var chefId = idReg.firstMatch(value["message"])!.group(1)!;

      var userMap = reg.state.signupData.toUserMap(chefId, value['token']);

      G
          .rd<UserCubit>()
          .saveUser(userMap)
          .then((_) => G.rd<ProfileCubit>().getProfileForm());

      return reg.setAccount(reg.state.signupData, true);
    }

    G.snackBar(value["message"]);
  }); //.catchError((err) {});
}
