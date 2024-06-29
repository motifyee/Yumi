import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/app/pages/auth/login/login_form.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/app/pages/auth/login/custom_domain.dart';
import 'package:yumi/app/pages/auth/login/login_thrid_part.dart';
import 'package:yumi/app/components/screen_container.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomDomain(),
                    ],
                  ),
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
                        const LoginFormProvider(),
                        SizedBox(
                          height: ThemeSelector.statics.defaultBlockGap,
                        ),
                        const SocialLogin(),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // context.router.push(const RegisterationRoute());
                      G.rd<RegCubit>().init();
                    },
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.resolveWith<Color>(
                          (states) => Colors.transparent,
                        ),
                        splashFactory: NoSplash.splashFactory,
                        padding: WidgetStateProperty.resolveWith(
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
