import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/app/pages/auth/login/login_form.dart';
import 'package:yumi/core/resources/app_assets.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/app/pages/auth/login/custom_domain.dart';

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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 75,
                        padding: const EdgeInsets.all(CommonDimens.defaultGap),
                        child: InteractiveButton(
                          label: S.current.appLang,
                          buttonType: ButtonType.outline,
                          onPressed: () =>
                              context.read<AppCubit>().toggleLocale(),
                        ),
                      ),
                      CustomDomain(),
                    ],
                  ),
                  const SizedBox(
                    height: CommonDimens.defaultBlockGap,
                  ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (AppTarget.user == YumiApp.chefs)
                          SvgPicture.asset(AppAssets.welcomeChefIcon),
                        if (AppTarget.user == YumiApp.drivers)
                          SvgPicture.asset(AppAssets.welcomeDriverIcon),
                        Text(
                          S.of(context).welcomeBack,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          S.of(context).signToContinue,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        const SizedBox(
                          height: CommonDimens.defaultTitleGap,
                        ),
                        const LoginFormProvider(),
                        const SizedBox(
                          height: CommonDimens.defaultBlockGap,
                        ),
                        // const SocialLogin(),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // context.router.push(const RegisterationRoute());
                      G().rd<RegCubit>().initReg();
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
                          AppAssets.ellipseIcon,
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
