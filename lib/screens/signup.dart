import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:yumi/forms/signup_form.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/login_thrid_part.dart';
import 'package:yumi/template/screen_container.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final signUpFormKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0,
          scrolledUnderElevation: 0,
          iconTheme: IconThemeData(color: ThemeSelector.colors.primary),
        ),
        body: LayoutBuilder(builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: ThemeSelector.statics.defaultBlockGap,
                      ),
                      Text(
                        S.of(context).createAccount,
                        style: TextStyle(
                            color: ThemeSelector.colors.primary,
                            fontSize: ThemeSelector.fonts.font_24,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        S.of(context).createNewAccount,
                        style: TextStyle(
                            color: ThemeSelector.colors.secondaryTant,
                            fontSize: ThemeSelector.fonts.font_9),
                      ),
                      SizedBox(
                        height: ThemeSelector.statics.defaultTitleGap,
                      ),
                      SignUpForm(
                        key: key,
                        signUpFormKey: signUpFormKey,
                        passwordController: passwordController,
                      ),
                      SizedBox(
                        height: ThemeSelector.statics.defaultBlockGap,
                      ),
                      const LoginThirdPart(),
                      SizedBox(
                        height: ThemeSelector.statics.defaultBlockGap,
                      ),
                      TextButton(
                        onPressed: () {
                          context.router.pop();
                        },
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                                color: ThemeSelector.colors.secondary,
                                fontSize: ThemeSelector.fonts.font_12),
                            children: [
                              TextSpan(text: S.of(context).alreadyHaveAccount),
                              WidgetSpan(
                                  child: SizedBox(
                                width: ThemeSelector.fonts.font_12 / 2,
                              )),
                              TextSpan(
                                  text: S.of(context).login,
                                  style: TextStyle(
                                      color: ThemeSelector.colors.primary,
                                      fontWeight: FontWeight.w700,
                                      fontSize:
                                          ThemeSelector.fonts.font_12 * 1.3)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
