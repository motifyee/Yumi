import 'dart:convert';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  static bool loginAttempted = false;

  @override
  Widget build(BuildContext context) {
    Future skipLogin(BuildContext context) async {
      try {
        String data = await rootBundle.loadString('assets/.autologin');
        var dataList = (const LineSplitter()).convert(data);

        if (!context.mounted) return;
        debugPrint("auto login...");

        performLogin(
          context,
          LoginModel(email: dataList[0], password: dataList[1]),
          dataList.length > 2 ? dataList[2] : null,
        );
        // ignore: empty_catches
      } catch (e) {
        debugPrint(e.toString());
      }
    }

    if (!kReleaseMode && loginAttempted == false) {
      loginAttempted = true;
      // skipLogin();

      () async {
        await rootBundle.loadString('assets/.autologin').then((data) {
          var dataList = (const LineSplitter()).convert(data);

          context.read<UserBloc>().add(
                UserFromSharedRefEvent(
                  context: context,
                  route: dataList.length > 2 ? dataList[2] : null,
                  afterFetchSuccess: routeAfterLogin,
                  autoLogin: skipLogin,
                ),
              );
        });
      }();
    }

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
                    style: Theme.of(context).textTheme.headlineMedium,
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

                  performLogin(context, loginForm);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

void performLogin(BuildContext context, LoginModel loginForm, [String? route]) {
  LoginServices.login(login: loginForm, context: context).then((value) async {
    if (value['access_Token'] != null) {
      context.read<UserBloc>().add(UserFromJsonEvent(user: value));
      // routeAfterLogin(context: context, route: route);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: SnackBarMassage(
            massage: value["message"],
          ),
        ),
      );
    }
  }).catchError((onError) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SnackBarMassage(
          massage: S.of(context).connectionError,
        ),
      ),
    );
  });
}

void routeAfterLogin(BuildContext context, String? route) async {
  if (!context.mounted) return;

  if (route == "flow") {
    context.router.replaceAll([const ChefApplicationFlowRoute()]);
  } else if (route == "schedule") {
    context.router.replaceAll([const MyScheduleRoute()]);
  } else if (route == "phone") {
    context.router.replaceAll([const AddPhoneRoute()]);
  } else if (route == "location") {
    context.router.replaceAll([LocationRoute()]);
  } else if (route == "otp") {
    context.router.replaceAll([const OTPRoute()]);
  } else if (route == "regmap") {
    context.router.replaceAll([LocationRoute()]);
  } else {
    context.router.replaceAll([HomeRoute()]);
  }
}
