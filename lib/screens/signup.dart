import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:yumi/forms/signup_form.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/login_thrid_part.dart';
import 'package:yumi/template/screen_container.dart';

@RoutePage()
class SignUp extends StatelessWidget {
  SignUp({super.key});

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
          iconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.primary),
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
                        height: ThemeStatics.defaultBlockGap,
                      ),
                      Text(
                        S.of(context).createAccount,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.fontSize,
                            fontWeight: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.fontWeight),
                      ),
                      Text(
                        S.of(context).createNewAccount,
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            fontSize: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.fontSize),
                      ),
                      SizedBox(
                        height: ThemeStatics.defaultTitleGap,
                      ),
                      SignUpForm(
                        key: key,
                        signUpFormKey: signUpFormKey,
                        passwordController: passwordController,
                      ),
                      SizedBox(
                        height: ThemeStatics.defaultBlockGap,
                      ),
                      const LoginThirdPart(),
                      SizedBox(
                        height: ThemeStatics.defaultBlockGap,
                      ),
                      TextButton(
                        onPressed: () {
                          context.router.pop();
                        },
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.fontSize),
                            children: [
                              TextSpan(text: S.of(context).alreadyHaveAccount),
                              WidgetSpan(
                                  child: SizedBox(
                                width: (Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.fontSize ??
                                        12) /
                                    2,
                              )),
                              TextSpan(
                                  text: S.of(context).login,
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontWeight: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.fontWeight,
                                      fontSize: (Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.fontSize ??
                                              12) *
                                          1.3)),
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
