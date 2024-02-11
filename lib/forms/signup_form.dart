import 'package:flutter/material.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/signup_model.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/confim_button.dart';
import 'package:yumi/template/text_form_field.dart';
import 'package:yumi/validators/email_validator.dart';
import 'package:yumi/validators/password_validator.dart';
import 'package:yumi/validators/required_validator.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key, required this.signUpFormKey});

  final GlobalKey<FormState> signUpFormKey;

  SignUpModel signupForm = SignUpModel(
    code: '',
    fullName: '',
    userName: '',
    mobile: '',
    signupType: '',
    countryID: '',
    email: '',
    password: '',
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signUpFormKey,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: ThemeStatics.formFieldInlineGap),
        child: Column(
          children: [
            TextFormFieldTemplate(
              key: key,
              label: S.of(context).name,
              onSave: (value) {
                signupForm.userName = value ?? '';
                signupForm.fullName = value ?? '';
              },
              validators: requiredValidator,
            ),
            SizedBox(height: ThemeStatics.formFieldGap),
            TextFormFieldTemplate(
              key: key,
              label: S.of(context).email,
              onSave: (value) {
                signupForm.email = value ?? '';
              },
              validators: emailValidator,
            ),
            SizedBox(height: ThemeStatics.formFieldGap),
            TextFormFieldTemplate(
              key: key,
              label: S.of(context).password,
              onSave: (value) {
                signupForm.password = value ?? '';
              },
              validators: passwordValidator,
              isPassword: true,
            ),
            SizedBox(height: ThemeStatics.formFieldGap),
            TextFormFieldTemplate(
              key: key,
              label: S.of(context).confirmPassword,
              onSave: (value) {
                signupForm.password = value ?? '';
              },
              validators: passwordValidator,
              isPassword: true,
            ),
            SizedBox(height: ThemeStatics.defaultGap),
            ConfirmButton(
              label: S.of(context).createAccount,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
