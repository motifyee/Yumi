import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/components/interactive_button/interactive_button.dart';
import 'package:yumi/app/components/interactive_button/interactive_button_style.dart';
import 'package:yumi/app/pages/auth/registeration/verify_otp_sheet.dart';
import 'package:yumi/app/pages/settings/profile/cubit/profile_cubit.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/app/pages/driver/reg_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/model/registeration.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/app/pages/auth/registeration/repository/signup_service.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/code_generator.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/snack_bar.dart';
import 'package:yumi/template/text_form_field.dart';
import 'package:yumi/validators/confirm_password_validator.dart';
import 'package:yumi/validators/email_validator.dart';
import 'package:yumi/validators/password_validator.dart';
import 'package:yumi/validators/required_validator.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key, required this.signUpFormKey, this.passwordController});

  final GlobalKey<FormState> signUpFormKey;
  final TextEditingController? passwordController;

  RegisterationForm signupForm = RegisterationForm(
    code: CodeGenerator.getRandomCode(),
    fullName: '',
    userName: '',
    // mobile: '',
    signupType: '2',
    countryID: '3',
    email: '',
    password: '',
    branchId: AppTarget.branch,
  );

  @override
  Widget build(BuildContext context) {
    final reg = context.read<RegCubit>();

    return Form(
      key: signUpFormKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ThemeSelector.statics.formFieldInlineGap),
        child: Column(
          children: [
            TextFormFieldTemplate(
              key: key,
              label: S.of(context).fullName,
              onSave: (value) {
                signupForm = signupForm.copyWith(fullName: value);
              },
              validators: requiredValidator,
            ),
            SizedBox(height: ThemeSelector.statics.formFieldGap),
            TextFormFieldTemplate(
              key: key,
              label: S.of(context).userName,
              onSave: (value) {
                signupForm = signupForm.copyWith(userName: value);
              },
              validators: requiredValidator,
            ),
            SizedBox(height: ThemeSelector.statics.formFieldGap),
            Stack(
              children: [
                TextFormFieldTemplate(
                  key: key,
                  label: S.of(context).email,
                  onSave: (value) {
                    signupForm = signupForm.copyWith(email: value);
                  },
                  onChange: (value) {
                    reg.setWillVerifyEmail(value);
                    signupForm = signupForm.copyWith(email: value);
                  },
                  validators: emailValidator,
                  suffixText: '                    ',
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  // bottom: 0,
                  child: Container(
                    height: 48,
                    width: 96,
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      // color: Theme.of(context).primaryColor.withOpacity(.7),
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
                          onPressed: () async {
                            if (reg.state.verifiedEmail ==
                                reg.state.willVerifyEmail) {
                              return G.snackBar(
                                "${state.verifiedEmail} is already verified",
                              );
                            }

                            if (!emailStructure(reg.state.willVerifyEmail)) {
                              return G.snackBar("Please enter a valid email");
                            }

                            await reg
                                .getEmailOTP(reg.state.willVerifyEmail!)
                                .then(
                              (sent) {
                                if (!sent) {
                                  return G.snackBar(
                                    "Please enter a valid email, nothing sent!",
                                  );
                                }

                                G.snackBar("Verification code sent");

                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) =>
                                      const VerifyOtpSheetProvider(),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: ThemeSelector.statics.formFieldGap),
            TextFormFieldTemplate(
              key: key,
              label: S.of(context).password,
              onSave: (value) {
                signupForm = signupForm.copyWith(password: value);
              },
              validators: passwordValidator,
              isPassword: true,
              controller: passwordController,
            ),
            SizedBox(height: ThemeSelector.statics.formFieldGap),
            TextFormFieldTemplate(
              key: key,
              label: S.of(context).confirmPassword,
              onSave: (value) {
                signupForm = signupForm.copyWith(password: value);
              },
              validators: (value) {
                return confirmPasswordValidator(
                    value: value, comparedValue: passwordController?.text);
              },
              isPassword: true,
            ),
            SizedBox(height: ThemeSelector.statics.defaultGap),
            InteractiveButton(
              label: S.of(context).createAccount,
              onLongPress: () async {
                if (kReleaseMode) return;
                if (!signUpFormKey.currentState!.validate()) return;

                signUpFormKey.currentState!.save();

                await SignUpService.signUp(signup: signupForm, context: context)
                    .then((value) {
                  value = jsonDecode(value.toString());

                  if (value["message"].contains('Created')) {
                    var idReg = RegExp(r"Created with id:\s*(.*)");
                    // var tokenReg = RegExp(r"Token\s*=\s*(.*)[\s|,]*");
                    var chefId = idReg.firstMatch(value["message"])!.group(1)!;

                    var userMap = signupForm.toUserMap(chefId, value['token']);

                    context.read<UserBloc>().add(UserFromJsonEvent(
                        user: userMap,
                        routeAfterLogin: () =>
                            context.read<ProfileCubit>().getProfileForm()));

                    return reg.setAccount(signupForm);
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
              onPressed: () async {
                if (reg.state.verifiedEmail != reg.state.willVerifyEmail ||
                    reg.state.willVerifyEmail == null ||
                    reg.state.willVerifyEmail!.isEmpty) {
                  return G.snackBar("Please verify your email");
                }

                if (!signUpFormKey.currentState!.validate()) return;
                signUpFormKey.currentState!.save();

                await SignUpService.signUp(signup: signupForm, context: context)
                    .then((value) {
                  value = jsonDecode(value.toString());

                  if (value["message"].contains('Created')) {
                    var idReg = RegExp(r"Created with id:\s*(.*)");
                    // var tokenReg = RegExp(r"Token\s*=\s*(.*)[\s|,]*");
                    var chefId = idReg.firstMatch(value["message"])!.group(1)!;

                    var userMap = signupForm.toUserMap(chefId, value['token']);

                    context.read<UserBloc>().add(UserFromJsonEvent(
                        user: userMap,
                        routeAfterLogin: () =>
                            context.read<ProfileCubit>().getProfileForm()));

                    return reg.setAccount(signupForm);
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
            ),
          ],
        ),
      ),
    );
  }
}
