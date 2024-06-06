import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/components/interactive_button/interactive_button.dart';
import 'package:yumi/app/components/interactive_button/interactive_button_style.dart';
import 'package:yumi/app/pages/auth/registeration/repository/signup_service.dart';
import 'package:yumi/app/pages/auth/registeration/signup/cubit/signup_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/verify_otp_sheet.dart';
import 'package:yumi/app/pages/driver/count_down/cubit/count_down_cubit.dart';
import 'package:yumi/app/pages/driver/reg_cubit.dart';
import 'package:yumi/app/pages/settings/profile/cubit/profile_cubit.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/snack_bar.dart';
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
    () async {
      final storageKey = VerifyOtpSheet.storageKey(OTPType.email);

      if (!signupCubit.state.sheetIsActive &&
          await hasActiveCountDown(storageKey: storageKey)) {
        // return signupCubit.showSheet(() => showOTPSheet(context));
        signupCubit.setSheetIsActive(true);
        await showOTPSheet();
        signupCubit.setSheetIsActive(false);
      }
    }();

    return Form(
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
              ),
              SizedBox(height: ThemeSelector.statics.formFieldGap),
              // email
              Stack(
                children: [
                  TextFormFieldTemplate(
                    key: key,
                    label: S.of(context).email,
                    // set on reload in cubit _navigateToIdx,
                    initialValue: reg.state.email,
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
                      child: BlocBuilder<RegCubit, NRegState>(
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
                onLongPress: () async {
                  if (kReleaseMode) return;
                  if (!Form.of(context).validate()) return;

                  Form.of(context).save();

                  await SignUpService.signUp(
                          signup: reg.state.signupData, context: context)
                      .then((value) {
                    value = jsonDecode(value.toString());

                    if (value["message"].contains('Created')) {
                      var idReg = RegExp(r"Created with id:\s*(.*)");
                      // var tokenReg = RegExp(r"Token\s*=\s*(.*)[\s|,]*");
                      var chefId =
                          idReg.firstMatch(value["message"])!.group(1)!;

                      var userMap = reg.state.signupData
                          .toUserMap(chefId, value['token']);

                      context.read<UserBloc>().add(UserFromJsonEvent(
                          user: userMap,
                          routeAfterLogin: () =>
                              context.read<ProfileCubit>().getProfileForm()));

                      return reg.setAccount(reg.state.signupData);
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: SnackBarMassage(
                          massage: value["message"],
                        ),
                      ),
                    );
                  }).catchError((err) {});
                },
                onPressed: () => _signUp(context),
              ),
            ],
          ),
        );
      }),
    );
  }
}

// PersistentBottomSheetController
Future<void> showOTPSheet() => showModalBottomSheet(
      context: G.context, // context mush have a scaffold
      isScrollControlled: true,
      enableDrag: true,
      sheetAnimationStyle: AnimationStyle(curve: Curves.bounceIn),
      backgroundColor: Colors.transparent,
      builder: (context) => VerifyOtpSheetProvider(
        value: '',
        otp: G.rd<RegCubit>().state.emailOTP,
      ),
    );

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
    if (await counterStoredValue(storageKey: storageKey) ==
        reg.state.willVerifyEmail) {
      signupCubit.setSheetIsActive(true);

      return showOTPSheet().then((_) => signupCubit.setSheetIsActive(false));
    }

    if (context.mounted) context.read<CountDownCubit>().stopCountDown();
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
      signupCubit.setSheetIsActive(true);
      showOTPSheet().then(
        (_) => signupCubit.setSheetIsActive(false),
      );
    },
  );
}

Future<void> _signUp(BuildContext context) async {
  final reg = G.rd<RegCubit>();

  if (!Form.of(context).validate()) return;

  if (reg.state.verifiedEmail != reg.state.willVerifyEmail ||
      reg.state.willVerifyEmail == null ||
      reg.state.willVerifyEmail!.isEmpty) {
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

      G.read<UserBloc>().add(UserFromJsonEvent(
          user: userMap,
          routeAfterLogin: () => G.rd<ProfileCubit>().getProfileForm()));

      return reg.setAccount(reg.state.signupData, true);
    }

    G.snackBar(value["message"]);
  }); //.catchError((err) {});
}
