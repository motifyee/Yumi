import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/forms/login_form.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/login_thrid_part.dart';
import 'package:yumi/template/screen_container.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: ThemeSelector.statics.defaultBlockGap,
                  ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (AppTarget.user == AppTargetUser.chefs)
                          SvgPicture.asset(
                              'assets/images/welocme_chef_icon.svg'),
                        if (AppTarget.user == AppTargetUser.drivers)
                          SvgPicture.asset(
                              'assets/images/welcom_driver_icon.svg'),
                        Text(
                          S.of(context).welcomeBack,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          S.of(context).signToContinue,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        SizedBox(
                          height: ThemeSelector.statics.defaultTitleGap,
                        ),
                        LoginForm(
                          loginFormKey: loginFormKey,
                        ),
                        SizedBox(
                          height: ThemeSelector.statics.defaultBlockGap,
                        ),
                        const LoginThirdPart(),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.router.push(const RegisterationRoute());
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (states) => Colors.transparent,
                        ),
                        splashFactory: NoSplash.splashFactory,
                        padding: MaterialStateProperty.resolveWith(
                            (states) => EdgeInsets.zero)),
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          'assets/images/Ellipse1.svg',
                          width: MediaQuery.of(context).size.width,
                        ),
                        Positioned.fill(
                          bottom: 20,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              S.of(context).createNewAccount,
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    ));
  }
}
