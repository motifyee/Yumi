import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/login_model.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/service/login_service.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/confirm_button.dart';
import 'package:yumi/template/text_form_field.dart';
import 'package:yumi/validators/email_validator.dart';
import 'package:yumi/validators/password_validator.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key, required this.loginFormKey});

  final LoginModel loginForm = LoginModel(email: '', password: '');
  final GlobalKey<FormState> loginFormKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFormKey,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: ThemeStatics.formFieldInlineGap),
        child: Column(
          children: [
            Column(
              children: [
                TextFormFieldTemplate(
                  label: S.of(context).email,
                  validators: emailValidator,
                  onSave: (value) => {loginForm.email = value ?? ''},
                ),
                SizedBox(
                  height: ThemeStatics.formFieldGap,
                ),
                TextFormFieldTemplate(
                  label: S.of(context).password,
                  validators: passwordValidator,
                  onSave: (value) => {loginForm.password = value ?? ''},
                  isPassword: true,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    context.router.push(const ForgetPassword());
                  },
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(80, 20),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft),
                  child: Text(
                    "${S.of(context).forgetPassword}?",
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodySmall?.fontSize),
                  ),
                )
              ],
            ),
            SizedBox(
              height: ThemeStatics.defaultGap,
            ),
            ConfirmButton(
              label: S.of(context).login,
              onPressed: () async {
                if (loginFormKey.currentState!.validate()) {
                  loginFormKey.currentState!.save();
                  final res = await loginService(login: loginForm);
                  print(res);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
