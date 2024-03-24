import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/features/registeration/bloc/bloc.dart';
import 'package:yumi/features/registeration/model/registeration.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/features/registeration/model/signup_model.dart';
import 'package:yumi/features/registeration/repository/signup_service.dart';
import 'package:yumi/statics/code_generator.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/confirm_button.dart';
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
      mobile: '',
      signupType: '2',
      countryID: '3',
      email: '',
      password: '',
      branchId: AppTarget.branch);

  @override
  Widget build(BuildContext context) {
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
            TextFormFieldTemplate(
              key: key,
              label: S.of(context).email,
              onSave: (value) {
                signupForm = signupForm.copyWith(email: value);
              },
              validators: emailValidator,
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
            ConfirmButton(
              label: S.of(context).createAccount,
              onPressed: () async {
                if (kDebugMode) {
                  return context
                      .read<RegBloc>()
                      .add(RegEvent.setAccount(signupForm, context));
                }

                if (signUpFormKey.currentState!.validate()) {
                  signUpFormKey.currentState!.save();

                  SignUpService.signUp(signup: signupForm, context: context)
                      .then((value) {
                    value = jsonDecode(value.toString());

                    if (value["message"].contains('Created')) {
                      // Navigator.of(context).pop();
                      context
                          .read<RegBloc>()
                          .add(RegEvent.setAccount(signupForm, context));

                      return context
                          .read<RegBloc>()
                          .add(RegEvent.setAccount(signupForm, context));
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: SnackBarMassage(
                          massage: value["message"],
                        ),
                      ),
                    );
                  }).catchError((err) {});
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
