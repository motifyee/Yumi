import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/login_model.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/service/login_service.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/confirm_button.dart';
import 'package:yumi/template/snack_bar.dart';
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
        padding: EdgeInsets.symmetric(
            horizontal: ThemeSelector.statics.formFieldInlineGap),
        child: Column(
          children: [
            Column(
              children: [
                TextFormFieldTemplate(
                  label: S.of(context).email,
                  validators: emailValidator,
                  autoHint: const [AutofillHints.username],
                  onSave: (value) => {loginForm.email = value ?? ''},
                ),
                SizedBox(
                  height: ThemeSelector.statics.formFieldGap,
                ),
                TextFormFieldTemplate(
                  label: S.of(context).password,
                  validators: passwordValidator,
                  autoHint: const [AutofillHints.password],
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
                    context.router.push(const ForgetPasswordRoute());
                  },
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(80, 20),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft),
                  child: Text(
                    "${S.of(context).forgetPassword}?",
                    style: TextStyle(
                        fontSize: ThemeSelector.fonts.font_9,
                        color: ThemeSelector.colors.primary),
                  ),
                )
              ],
            ),
            SizedBox(
              height: ThemeSelector.statics.defaultGap,
            ),
            ConfirmButton(
              label: S.of(context).login,
              onPressed: () {
                if (loginFormKey.currentState!.validate()) {
                  loginFormKey.currentState!.save();

                  loginService(login: loginForm, context: context)
                      .then((value) {
                    if (value['access_Token'] != null) {
                      context
                          .read<UserBloc>()
                          .add(UserFromJsonEvent(user: value));
                      context.router.replaceAll([HomeRoute()]);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: SnackBarMassage(
                            massage: value["message"],
                          ),
                        ),
                      );
                    }
                  }).catchError(
                          (onError) => print('error' + onError.toString()));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
